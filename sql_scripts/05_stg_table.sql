-- Criando tabela Virtual com a tipagem correta
CREATE TABLE stg_marketing_campaign (
	
	id					SMALLINT PRIMARY KEY
	,year_birth			SMALLINT NULL
	,education			VARCHAR(50) NOT NULL
	,marital_status		VARCHAR(50) NOT NULL
	,income				DECIMAL(18) NULL
	,kidhome			TINYINT NULL
	,teenhome			TINYINT NULL
	,dt_customer		DATE NOT NULL
	,recency			INTEGER NULL
	,mntwines			SMALLINT NULL
	,mntfruits			SMALLINT NULL
	,mntmeatproducts	SMALLINT NULL
	,mntfishproducts	SMALLINT NULL
	,mntsweetproducts	SMALLINT NULL
	,mntgoldprods		SMALLINT NULL
	,numdealspurchase	TINYINT	 NULL
	,numwebpurchases	TINYINT	 NULL
	,numcatalogpurcha	TINYINT	 NULL
	,numstorepurchase	TINYINT	 NULL
	,numwebvisitsmont	TINYINT	 NULL
	,acceptedcmp3		BIT		 NULL
	,acceptedcmp4		BIT		 NULL
	,acceptedcmp5		BIT		 NULL
	,acceptedcmp1		BIT		 NULL
	,acceptedcmp2		BIT		 NULL
	,complain			BIT		 NULL
	,z_costcontact		TINYINT	 NULL
	,z_revenue			TINYINT	 NULL
	,response			BIT	NULL)

--- Inserindo os dados usando o CAST

INSERT INTO stg_marketing_campaign
SELECT
	CAST(id AS SMALLINT)
	,CAST(year_birth AS SMALLINT)
	,education
	,marital_status 
	,TRY_CAST(REPLACE(REPLACE(income, '.', ''), ',', '.') AS DECIMAL(18,2)) AS income
	,CAST(kidhome AS TINYINT) 
	,CAST(teenhome AS TINYINT)
	,TRY_CONVERT(DATE, dt_customer, 105)
	,CAST(recency AS INTEGER)
	,CAST(mntwines AS SMALLINT)
	,CAST(mntfruits	AS SMALLINT)
	,CAST(mntmeatproducts AS SMALLINT)
	,CAST(mntfishproducts AS SMALLINT)
	,CAST(mntsweetproducts AS SMALLINT) 
	,CAST(mntgoldprods AS SMALLINT)
	,CAST(numdealspurchase AS TINYINT)
	,CAST(numwebpurchases AS TINYINT)
	,CAST(numcatalogpurcha AS TINYINT)
	,CAST(numstorepurchase AS TINYINT)
	,CAST(numwebvisitsmont AS TINYINT)
	,CAST(acceptedcmp3 AS BIT)
	,CAST(acceptedcmp4 AS BIT)
	,CAST(acceptedcmp5 AS BIT)
	,CAST(acceptedcmp1 AS BIT)
	,CAST(acceptedcmp2 AS BIT)
	,CAST(complain AS BIT)
	,CAST(z_costcontact AS TINYINT)
	,CAST(z_revenue	AS TINYINT)
	,CAST(response AS BIT)
FROM marketing_backup
