--EXEC [dbo].[usp_GetUploadPreferences] '6B535790-9DEA-4C17-AA04-FE599C0FBA62'
CREATE PROCEDURE [dbo].[usp_GetUploadPreferences]
	@UserId UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 'PDF' AS [Type], ISNULL(FilePreferencePDF,0) AS [Selected] FROM Client WHERE UserId = @UserId
	UNION ALL
	SELECT 'DOC' AS [Type], ISNULL(FilePreferenceWord,0) AS [Selected] FROM Client WHERE UserId = @UserId
	UNION ALL
	SELECT 'PDFLINK' AS [Type], ISNULL(FilePreferencePDFLink,0) AS [Selected] FROM Client WHERE UserId = @UserId
END
GO
