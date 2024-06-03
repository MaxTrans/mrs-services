CREATE FUNCTION fn_GetJobStatus 
(
	-- Add the parameters for the function here
	@Status varchar(100)
)
RETURNS UNIQUEIDENTIFIER
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ReturnVal UNIQUEIDENTIFIER = NULL

	-- Add the T-SQL statements to compute the return value here
	SELECT @ReturnVal = Id FROM JobStatus WHERE Description = @Status

	-- Return the result of the function
	RETURN @ReturnVal
END