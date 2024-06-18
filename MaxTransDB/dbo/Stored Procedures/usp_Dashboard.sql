CREATE PROCEDURE usp_Dashboard
AS BEGIN

SELECT * FROM (
SELECT COUNT(J.Id) as [RecCount], '#17a2b8' as Color, 'ion ion-document' as Icon, 'Pending' as Title, '' as Link,
1 as SortOrder
FROM Jobs J
JOIN JobStatus JS ON J.Status = JS.Id
WHERE JS.Description = 'Pending'

UNION

SELECT COUNT(J.Id) as [RecCount], '#28a745' as Color, 'ion ion-document-text' as Icon, 'Completed' as Title, '' as Link,
2 as SortOrder
FROM Jobs J
JOIN JobStatus JS ON J.Status = JS.Id
WHERE JS.Description = 'Completed'

UNION

SELECT COUNT(U.Id) as [RecCount], '#ffc107' as Color, 'ion ion-person-stalker' as Icon, 'Clients' as Title, '' as Link,
3 as SortOrder
FROM Users U
JOIN UserRoles UR ON U.Id = UR.UserId
JOIN Roles R ON UR.RoleId = R.Id
WHERE R.Description = 'Client' AND ISNULL(U.IsDeleted,0) = 0 

UNION 

SELECT COUNT(U.Id) as [RecCount], '#dc3545' as Color, 'ion ion-person-stalker' as Icon, 'Employees' as Title, '' as Link,
4 as SortOrder
FROM Users U
JOIN UserRoles UR ON U.Id = UR.UserId
JOIN Roles R ON UR.RoleId = R.Id
WHERE R.Description = 'Employee' AND ISNULL(U.IsDeleted,0) = 0 ) T
ORDER BY SortOrder
END

