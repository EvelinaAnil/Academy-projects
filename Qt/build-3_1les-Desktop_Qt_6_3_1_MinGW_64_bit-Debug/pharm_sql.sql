SELECT name, title, date_order, amount
FROM [Customer], [Medicine],[Order]
WHERE [Customer].id_customer=[Order].id_client AND [Medicine].id_medicine=[order].id_med
AND strftime('%m', [Order].date_order)=strftime('%m', DATE('now', '-1 month'))

SELECT * 
From Customer
Where [Customer].sale > 20