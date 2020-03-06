USE [AodbData]
GO
/****** Object:  StoredProcedure [dbo].[processAirlineIntegrationRecord]    Script Date: 3/6/2020 10:01:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[processAirlineIntegrationRecord]
AS

declare @transactionid as uniqueidentifier

select @transactionid = NEWID()

update	AirlineIntegration
set		statuscode = 1,
		status = 'inprocess',
		tranid = @transactionid
where	id in (
				select	top 50 id
				from	AirlineIntegration
				where 	isnull(attempt, 0) < 5 and
						status not in ('Success', 'inprocess')
				order by ctime
			)

select	id,
		request
from	AirlineIntegration
where 	tranid = @transactionid
