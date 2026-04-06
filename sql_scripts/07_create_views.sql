-- View para observar o perfil do cliente

CREATE VIEW vw_customer_profile AS
SELECT
	id
	,age
	,education
	,marital_status
	,CASE
		WHEN income <= 35000 THEN 'Low income'
		WHEN income <= 75000 THEN 'Middle Income'
		Else 'Upper Income'
	END as income_status
	,CASE
		WHEN kidhome > 0 or teenhome > 0 THEN 'Yes'
		ELSE 'No' 
	END AS has_children
FROM stg_marketing_campaign
GO

-- View para observar os gastos do cliente

CREATE VIEW vw_customer_spending AS

SELECT
	id
	,mntfruits
	,mntwines
	,mntfishproducts
	,mntmeatproducts
	,mntsweetproducts
	,mntgoldprods
	,(mntfruits + mntwines + mntfishproducts  + mntmeatproducts + mntsweetproducts + mntgoldprods) as total_spend
FROM stg_marketing_campaign
GO

--- View para observar a frequência do cliente
CREATE VIEW vw_customer_activity AS 
SELECT
	id
	,recency
	,CASE
		WHEN recency <= 30 THEN 'Active'
		WHEN recency <= 60 THEN 'Moderate'
		Else 'Inactive'
	END as recency_status
	,numdealspurchase
	,numwebpurchases
	,numcatalogpurcha
	,numstorepurchase
	,numwebvisitsmont
	,CASE 
		WHEN numwebpurchases > numstorepurchase and numwebpurchases > numcatalogpurcha THEN 'Web'
		WHEN numstorepurchase  > numwebpurchases and numstorepurchase  > numcatalogpurcha THEN 'Store'
		ELSE 'Catalog'
	END AS chanel_preferido
FROM stg_marketing_campaign
GO

-- View para observar a aceitação da campanha pelos clientes

CREATE VIEW vw_campaign_perfomance AS
SELECT
	id
	,acceptedcmp1
	,acceptedcmp2
	,acceptedcmp3
	,acceptedcmp4
	,acceptedcmp5
	,CAST(acceptedcmp1 AS INT) + CAST(acceptedcmp2 AS INT) +
	CAST(acceptedcmp3 AS INT) + CAST(acceptedcmp4 AS INT) + CAST(acceptedcmp5 AS INT) AS total_cmp_accepted
	,CASE
		WHEN CAST(acceptedcmp1 AS INT) + CAST(acceptedcmp2 AS INT) +
	CAST(acceptedcmp3 AS INT) + CAST(acceptedcmp4 AS INT) + CAST(acceptedcmp5 AS INT) >= 3 THEN 'High Engagement'
		WHEN CAST(acceptedcmp1 AS INT) + CAST(acceptedcmp2 AS INT) +
	CAST(acceptedcmp3 AS INT) + CAST(acceptedcmp4 AS INT) + CAST(acceptedcmp5 AS INT) >= 1 THEN 'Medium Engagement'
		ELSE 'Lower Engagement'
	END AS cmp_engagement
	,response
	,complain
FROM stg_marketing_campaign
GO

-- View para calcular os gastos de categoria de produtos

CREATE VIEW vw_products_revenue AS
SELECT id,'Wines' as Produtos, SUM(mntwines) AS total
FROM vw_customer_spending
GROUP BY id
UNION ALL
SELECT id,'Meat', SUM(mntmeatproducts)
FROM vw_customer_spending
GROUP BY id
UNION ALL
SELECT id,'Fish', SUM(mntfishproducts)
FROM vw_customer_spending
GROUP BY id
UNION ALL
SELECT id,'Fruits', SUM(mntfruits)
FROM vw_customer_spending
GROUP BY id
UNION ALL
SELECT id,'Sweets', SUM(mntsweetproducts)
FROM vw_customer_spending
GROUP BY id
UNION ALL
SELECT id,'Gold', SUM(mntgoldprods)
FROM vw_customer_spending
GROUP BY id
GO

-- View para ver se clientes que aceitaram campanhas passadas, responderam a campanha atual

CREATE VIEW vw_campaign_conversion AS
SELECT id,'Campaign 1' AS campaign
,SUM(CAST(acceptedcmp1 AS INT)) AS total_accepted
,SUM(CASE WHEN acceptedcmp1 = 1 AND response = 1 THEN 1 ELSE 0 END) AS converted_retention
FROM vw_campaign_perfomance
GROUP BY id
UNION ALL
SELECT id, 'Campaign 2'
,SUM(CAST(acceptedcmp2 AS INT))
,SUM(CASE WHEN acceptedcmp2 = 1 AND response = 1 THEN 1 ELSE 0 END)
FROM vw_campaign_perfomance
GROUP BY id
UNION ALL
SELECT id, 'Campaign 3'
,SUM(CAST(acceptedcmp3 AS INT))
,SUM(CASE WHEN acceptedcmp3 = 1 AND response = 1 THEN 1 ELSE 0 END)
FROM vw_campaign_perfomance
GROUP BY id
UNION ALL
SELECT id, 'Campaign 4'
,SUM(CAST(acceptedcmp4 AS INT))
,SUM(CASE WHEN acceptedcmp4 = 1 AND response = 1 THEN 1 ELSE 0 END)
FROM vw_campaign_perfomance
GROUP BY id
UNION ALL
SELECT id, 'Campaign 5'
,SUM(CAST(acceptedcmp5 AS INT))
,SUM(CASE WHEN acceptedcmp5 = 1 AND response = 1 THEN 1 ELSE 0 END)
FROM vw_campaign_perfomance
GROUP BY id
GO
