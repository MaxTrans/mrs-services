CREATE PROCEDURE USP_GetUserLookup
(
	@Role NVARCHAR(50)
)
AS
BEGIN
	SELECT U.Id, U.FIrstName + ' ' + U.LastName AS Value  from Users U
	JOIN UserRoles UR ON UR.UserId = U.Id
	JOIN Roles R ON R.Id = UR.RoleId
	WHERE R.Description = @Role
END