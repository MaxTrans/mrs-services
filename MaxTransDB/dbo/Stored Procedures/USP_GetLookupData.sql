CREATE PROCEDURE [dbo].[USP_GetLookupData]
(
	@Type NVARCHAR(50)
)
AS
BEGIN
	IF @Type = 'status'
	BEGIN
		select Id, Description AS Value from JobStatus
	END
	ELSE IF @Type = 'tat'
	BEGIN
		select Id, Description AS Value from JobHandleTime order by SortOrder
	END
	ELSE IF @Type = 'filetype'
	BEGIN
		select Id, Description AS Value from FileTypes
	END
END