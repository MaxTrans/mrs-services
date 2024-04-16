CREATE PROCEDURE [dbo].[USP_VerifyLogin]
(
	@LoginName nvarchar(50),
	@Password nvarchar(50)
)
AS
BEGIN
	SELECT U.Id,U.FIrstName,U.LastName,U.LoginName,U.Email,U.PhoneNo
	,R.Description AS RoleName, C.Name AS CompanyName, C.Id As CompanyId 
	FROM Users U
	JOIN UserRoles UR ON UR.UserId = U.Id
	JOIN Roles R ON R.Id = UR.RoleId
	JOIN Company C ON C.Id = U.CompanyId
	WHERE LoginName = @LoginName AND [Password] = @Password
END