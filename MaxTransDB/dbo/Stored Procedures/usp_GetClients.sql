
CREATE PROCEDURE usp_GetClients

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT C.*, U.CompanyId, U.Email, U.FIrstName AS FirstName, U.LastName, U.Password, U.PhoneNo, U.Email, U.LoginName, R.[Description] AS [RoleName],
	CMP.[Name] AS CompanyName
	FROM Client C
	JOIN [Users] U ON C.UserId = U.Id
	JOIN [UserRoles] UR ON U.Id = UR.UserId 
	JOIN [Roles] R ON UR.RoleId = R.Id
	LEFT JOIN Company CMP ON R.CompanyId = CMP.Id

END
GO
