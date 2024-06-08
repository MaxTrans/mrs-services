INSERT [dbo].[Company] ([Id], [Name], [Url], [SmallLogo], [LoginLogo], [HeaderTitle], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', N'Test Company', N'', N'', N'          ', N'Test Company', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-16T12:09:10.993' AS DateTime), NULL)
GO
INSERT [dbo].[JobHandleTime] ([Id], [Description], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime], [SortOrder]) VALUES (N'92f64838-d8a3-48e4-8e2a-385a9751326e', N'2 Days', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-04-27T08:29:14.773' AS DateTime), NULL, 2)
GO
INSERT [dbo].[JobHandleTime] ([Id], [Description], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime], [SortOrder]) VALUES (N'fb2c8feb-c5c6-4d19-9bca-4db37b80ac97', N'3 Days', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-04-27T08:29:14.777' AS DateTime), NULL, 3)
GO
INSERT [dbo].[JobHandleTime] ([Id], [Description], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime], [SortOrder]) VALUES (N'3bf2356a-e789-4257-aae3-65ce1a52ca47', N'24 Hours', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-04-27T08:29:14.767' AS DateTime), NULL, 1)
GO
INSERT [dbo].[JobStatus] ([Id], [Description], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime], [OrderSqe]) VALUES (N'b0f5c768-dccf-474d-ae43-645148f88ba6', N'In Progress', NULL, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-05-20T13:35:47.223' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[JobStatus] ([Id], [Description], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime], [OrderSqe]) VALUES (N'12f5b379-a6e9-48a2-81e2-6e7249b4895e', N'Completed', NULL, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-29T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[JobStatus] ([Id], [Description], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime], [OrderSqe]) VALUES (N'fab98251-70c2-410b-bc09-9b66f9234e30', N'Pending', NULL, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-28T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Roles] ([Id], [Description], [CompanyId], [Type], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'b7422f30-0441-449b-8f63-127c196a51a0', N'Client', N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', N'', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-16T12:16:45.530' AS DateTime), NULL)
GO
INSERT [dbo].[Roles] ([Id], [Description], [CompanyId], [Type], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'992a4758-7b07-4a8e-8a3a-3f7890922a12', N'Admin', N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', N'', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-16T12:16:18.250' AS DateTime), NULL)
GO
INSERT [dbo].[Roles] ([Id], [Description], [CompanyId], [Type], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'bb964354-6ebc-43e9-90c0-91a079804bb2', N'Employee', N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', N'', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-16T12:16:26.140' AS DateTime), NULL)
GO
INSERT [dbo].[Roles] ([Id], [Description], [CompanyId], [Type], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'604f91cb-e52d-4ed3-a223-c3d8a2be5a3f', N'Vendor', N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', N'', 0, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-16T12:16:35.393' AS DateTime), NULL)
GO
INSERT [dbo].[Users] ([Id], [FIrstName], [LastName], [LoginName], [Password], [Email], [PhoneNo], [CompanyId], [IsDisabled], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'564d9dbf-5b96-4ce7-8c51-7808fb8a3bac', N'Client 2', N'', N'client2', N'client2', N'client2@test.com', N'1111111111', N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', NULL, NULL, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-24T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Users] ([Id], [FIrstName], [LastName], [LoginName], [Password], [Email], [PhoneNo], [CompanyId], [IsDisabled], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'cb5d5a27-2220-4635-8b7e-a7396333a46e', N'Client 1', N'', N'client1', N'FUIA5sZL/MuMSBMBJVEBag==', N'client1@test.com', N'1111111111', N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', NULL, NULL, N'6b535790-9dea-4c17-aa04-fe599c0fba62', NULL, CAST(N'2024-03-24T00:00:00.000' AS DateTime), CAST(N'2024-05-29T15:45:48.490' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FIrstName], [LastName], [LoginName], [Password], [Email], [PhoneNo], [CompanyId], [IsDisabled], [IsDeleted], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'6b535790-9dea-4c17-aa04-fe599c0fba62', N'Pratap', N'Kumar', N'admin', N'FUIA5sZL/MuMSBMBJVEBag==', N'admin@test.com', N'1111111111', N'4c82bf3c-fc5e-4405-a5e6-a441c43bed73', NULL, NULL, N'3c3deae1-f0cd-4259-bc26-05303c37a480', NULL, CAST(N'2024-03-14T02:13:31.300' AS DateTime), CAST(N'2024-05-29T15:45:23.413' AS DateTime))
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'3360ab08-36eb-4a1d-89fa-1027aff1e325', N'6b535790-9dea-4c17-aa04-fe599c0fba62', N'992a4758-7b07-4a8e-8a3a-3f7890922a12', N'992a4758-7b07-4a8e-8a3a-3f7890922a12', NULL, CAST(N'2024-03-16T12:20:33.047' AS DateTime), NULL)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'd676f13f-b9ac-4163-94e6-759840ccb282', N'564d9dbf-5b96-4ce7-8c51-7808fb8a3bac', N'b7422f30-0441-449b-8f63-127c196a51a0', N'992a4758-7b07-4a8e-8a3a-3f7890922a12', NULL, CAST(N'2024-04-03T01:03:22.703' AS DateTime), NULL)
GO
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId], [CreatedBy], [ModifyedBy], [CreatedDateTime], [ModifiedDateTime]) VALUES (N'c0f26e91-4a24-49a9-aeeb-985b4f9d2db3', N'cb5d5a27-2220-4635-8b7e-a7396333a46e', N'b7422f30-0441-449b-8f63-127c196a51a0', N'992a4758-7b07-4a8e-8a3a-3f7890922a12', NULL, CAST(N'2024-04-03T01:03:41.347' AS DateTime), NULL)
GO