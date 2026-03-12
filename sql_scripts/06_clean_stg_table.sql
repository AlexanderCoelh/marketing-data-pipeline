--- Removendo Colunas constantes
ALTER TABLE stg_marketing_campaign
DROP COLUMN z_costcontact, z_revenue

--- Verificando Possíveis Outliers para escolher entre Média ou Mediana
--- para substituir os valores nulos

SELECT MAX(income) AS Maximo, MIN(income) AS Minimo
FROM stg_marketing_campaign

--- Contado a quantidade de valores
SELECT count(income)
FROM stg_marketing_campaign

-- Fazendo um CTE para o Cálculo da Mediana
-- A ideia é ordernar os dados de forma crescente
-- e pegar o dado que está no meio da tabela

WITH Mediana AS (
	SELECT 
		income
		,ROW_NUMBER() OVER (ORDER BY income) as num
	FROM stg_marketing_campaign
	WHERE income IS NOT NULL
)

SELECT income
FROM Mediana
WHERE num in (
	SELECT COUNT(*)/2
	FROM Mediana
)

-- Fazendo o UPDATE nos valores nulos na tabela Staging

UPDATE stg_marketing_campaign
SET income = 51373
WHERE income IS NULL

-- Fazendo a coluna idade através da coluna year_birth

ALTER TABLE stg_marketing_campaign
ADD Age AS (YEAR(GETDATE()) - year_birth)