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
	acceptedcmp1
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