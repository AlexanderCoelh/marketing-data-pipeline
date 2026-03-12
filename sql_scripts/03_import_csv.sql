BULK INSERT marketing_campaign
FROM 'C:\Windows\Temp\marketing_campaign.csv'
WITH(
	FORMAT = 'CSV',
	FIELDTERMINATOR = ';',
	FIRSTROW = 2
)