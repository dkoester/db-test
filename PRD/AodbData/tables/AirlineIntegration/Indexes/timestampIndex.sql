USE [AodbData]
GO

/****** Object:  Index [timestampIndex]    Script Date: 3/6/2020 9:58:56 AM ******/
CREATE NONCLUSTERED INDEX [timestampIndex] ON [dbo].[AirlineIntegration]
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
