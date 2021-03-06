SELECT
--[DRA].[RID] as RID,
[DRA].[ST] as [userType],
[DRI].[SR] AS [Serial Number],
[DRI].[BC] AS [BarCode],
CONVERT(VARCHAR(10),[DRA].[DT],101) AS [Issued],
CONVERT(VARCHAR(10),[DRA].[RD],101) AS [Returned]
FROM (SELECT [DRA].* FROM DRA WHERE DEL = 0)
 DRA LEFT JOIN (SELECT [DRI].* FROM DRI WHERE DEL = 0) DRI ON [DRI].[RID] = [DRA].[RID] AND [DRI].[RIN] = [DRA].[RIN]
WHERE
 DRA.DD IS NULL
 AND DRA.RD IS NUll
 AND DRA.RID IN (1,2,3,4)
 AND DRI.DEL <> 1
 AND convert(date, DRA.DT) >= DATEADD (day, -3, convert(date,GETDATE()))