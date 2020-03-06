USE [AodbData]
GO
/****** Object:  StoredProcedure [dbo].[updateAirlineIntegrationRecord]    Script Date: 3/6/2020 10:00:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[updateAirlineIntegrationRecord]
	@response varchar(max),
	@id uniqueIdentifier
AS

declare @succ int

set @succ = charindex('success', @response);

if @succ > 0
begin
	update	AirlineIntegration
	set		statuscode = 201,
			response = @response,
			status = 'Success',
			[timestamp] = getdate(),
			attempt = isnull(attempt,0) + 1
	where	id = @id
end
else
begin
	declare @statusCode varchar(500)

	set @statusCode = substring(@response, charindex('<Error ', @response), charindex('</Error>', @response))
	set @statusCode = substring(@statusCode, charindex('Type="', @statusCode) + 6, len(@statusCode))
	set @statusCode = substring(@statusCode, 0, charindex('"', @statusCode))

	update	AirlineIntegration
	set		statuscode = @statusCode,
			response = @response,
			status = 'Fail',
			[timestamp] = getdate(),
			attempt = isnull(attempt,0) + 1
	where	id = @id
end
