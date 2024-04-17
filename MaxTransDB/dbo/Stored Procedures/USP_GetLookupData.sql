CREATE PROCEDURE USP_GetLookupData
(
	@Type NVARCHAR(50)
)
AS
BEGIN
	IF @Type = 'status'
	BEGIN
		select Id, Description AS Value from JobStatus
	END
END