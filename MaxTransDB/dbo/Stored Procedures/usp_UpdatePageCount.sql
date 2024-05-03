CREATE PROCEDURE [dbo].[usp_UpdatePageCount]
	@FileXml XML
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	;WITH ParsedData AS (
		SELECT 
			Item.value('(@id)[1]', 'VARCHAR(500)') AS Id,
			Item.value('(@pageCount)[1]', 'INT') as [PageCount]
		FROM @FileXml.nodes('/Files/FileInfo') AS X(Item))

	UPDATE JF SET JF.[PageCount] = pd.[PageCount]
	FROM JobFiles JF
	JOIN ParsedData PD ON JF.FileId = PD.Id
	WHERE JF.FileId = PD.Id
END
