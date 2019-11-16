IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    CREATE TABLE [Location] (
        [LocationId] int NOT NULL IDENTITY,
        [VenueName] nvarchar(max) NULL,
        [Address1] nvarchar(max) NULL,
        [Address2] nvarchar(max) NULL,
        [Address3] nvarchar(max) NULL,
        [CityTown] nvarchar(max) NULL,
        [StateProvince] nvarchar(max) NULL,
        [PostalCode] nvarchar(max) NULL,
        [Country] nvarchar(max) NULL,
        CONSTRAINT [PK_Location] PRIMARY KEY ([LocationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    CREATE TABLE [Speakers] (
        [SpeakerId] int NOT NULL IDENTITY,
        [FirstName] nvarchar(max) NULL,
        [LastName] nvarchar(max) NULL,
        [MiddleName] nvarchar(max) NULL,
        [Company] nvarchar(max) NULL,
        [CompanyUrl] nvarchar(max) NULL,
        [BlogUrl] nvarchar(max) NULL,
        [Twitter] nvarchar(max) NULL,
        [GitHub] nvarchar(max) NULL,
        CONSTRAINT [PK_Speakers] PRIMARY KEY ([SpeakerId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    CREATE TABLE [Camps] (
        [CampId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Moniker] nvarchar(max) NULL,
        [LocationId] int NULL,
        [EventDate] datetime2 NOT NULL,
        [Length] int NOT NULL,
        CONSTRAINT [PK_Camps] PRIMARY KEY ([CampId]),
        CONSTRAINT [FK_Camps_Location_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Location] ([LocationId]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    CREATE TABLE [Talks] (
        [TalkId] int NOT NULL IDENTITY,
        [CampId] int NULL,
        [Title] nvarchar(max) NULL,
        [Abstract] nvarchar(max) NULL,
        [Level] int NOT NULL,
        [SpeakerId] int NULL,
        CONSTRAINT [PK_Talks] PRIMARY KEY ([TalkId]),
        CONSTRAINT [FK_Talks_Camps_CampId] FOREIGN KEY ([CampId]) REFERENCES [Camps] ([CampId]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Talks_Speakers_SpeakerId] FOREIGN KEY ([SpeakerId]) REFERENCES [Speakers] ([SpeakerId]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'LocationId', N'Address1', N'Address2', N'Address3', N'CityTown', N'Country', N'PostalCode', N'StateProvince', N'VenueName') AND [object_id] = OBJECT_ID(N'[Location]'))
        SET IDENTITY_INSERT [Location] ON;
    INSERT INTO [Location] ([LocationId], [Address1], [Address2], [Address3], [CityTown], [Country], [PostalCode], [StateProvince], [VenueName])
    VALUES (1, N'123 Main Street', NULL, NULL, N'Atlanta', N'USA', N'12345', N'GA', N'Atlanta Convention Center');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'LocationId', N'Address1', N'Address2', N'Address3', N'CityTown', N'Country', N'PostalCode', N'StateProvince', N'VenueName') AND [object_id] = OBJECT_ID(N'[Location]'))
        SET IDENTITY_INSERT [Location] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'SpeakerId', N'BlogUrl', N'Company', N'CompanyUrl', N'FirstName', N'GitHub', N'LastName', N'MiddleName', N'Twitter') AND [object_id] = OBJECT_ID(N'[Speakers]'))
        SET IDENTITY_INSERT [Speakers] ON;
    INSERT INTO [Speakers] ([SpeakerId], [BlogUrl], [Company], [CompanyUrl], [FirstName], [GitHub], [LastName], [MiddleName], [Twitter])
    VALUES (1, N'http://wildermuth.com', N'Wilder Minds LLC', N'http://wilderminds.com', N'Shawn', N'shawnwildermuth', N'Wildermuth', NULL, N'shawnwildermuth');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'SpeakerId', N'BlogUrl', N'Company', N'CompanyUrl', N'FirstName', N'GitHub', N'LastName', N'MiddleName', N'Twitter') AND [object_id] = OBJECT_ID(N'[Speakers]'))
        SET IDENTITY_INSERT [Speakers] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'SpeakerId', N'BlogUrl', N'Company', N'CompanyUrl', N'FirstName', N'GitHub', N'LastName', N'MiddleName', N'Twitter') AND [object_id] = OBJECT_ID(N'[Speakers]'))
        SET IDENTITY_INSERT [Speakers] ON;
    INSERT INTO [Speakers] ([SpeakerId], [BlogUrl], [Company], [CompanyUrl], [FirstName], [GitHub], [LastName], [MiddleName], [Twitter])
    VALUES (2, N'http://shawnandresa.com', N'Wilder Minds LLC', N'http://wilderminds.com', N'Resa', N'resawildermuth', N'Wildermuth', NULL, N'resawildermuth');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'SpeakerId', N'BlogUrl', N'Company', N'CompanyUrl', N'FirstName', N'GitHub', N'LastName', N'MiddleName', N'Twitter') AND [object_id] = OBJECT_ID(N'[Speakers]'))
        SET IDENTITY_INSERT [Speakers] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CampId', N'EventDate', N'Length', N'LocationId', N'Moniker', N'Name') AND [object_id] = OBJECT_ID(N'[Camps]'))
        SET IDENTITY_INSERT [Camps] ON;
    INSERT INTO [Camps] ([CampId], [EventDate], [Length], [LocationId], [Moniker], [Name])
    VALUES (1, '2018-10-18T00:00:00.0000000', 1, 1, N'ATL2018', N'Atlanta Code Camp');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CampId', N'EventDate', N'Length', N'LocationId', N'Moniker', N'Name') AND [object_id] = OBJECT_ID(N'[Camps]'))
        SET IDENTITY_INSERT [Camps] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'TalkId', N'Abstract', N'CampId', N'Level', N'SpeakerId', N'Title') AND [object_id] = OBJECT_ID(N'[Talks]'))
        SET IDENTITY_INSERT [Talks] ON;
    INSERT INTO [Talks] ([TalkId], [Abstract], [CampId], [Level], [SpeakerId], [Title])
    VALUES (1, N'Entity Framework from scratch in an hour. Probably cover it all', 1, 100, 1, N'Entity Framework From Scratch');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'TalkId', N'Abstract', N'CampId', N'Level', N'SpeakerId', N'Title') AND [object_id] = OBJECT_ID(N'[Talks]'))
        SET IDENTITY_INSERT [Talks] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'TalkId', N'Abstract', N'CampId', N'Level', N'SpeakerId', N'Title') AND [object_id] = OBJECT_ID(N'[Talks]'))
        SET IDENTITY_INSERT [Talks] ON;
    INSERT INTO [Talks] ([TalkId], [Abstract], [CampId], [Level], [SpeakerId], [Title])
    VALUES (2, N'Thinking of good sample data examples is tiring.', 1, 200, 2, N'Writing Sample Data Made Easy');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'TalkId', N'Abstract', N'CampId', N'Level', N'SpeakerId', N'Title') AND [object_id] = OBJECT_ID(N'[Talks]'))
        SET IDENTITY_INSERT [Talks] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    CREATE INDEX [IX_Camps_LocationId] ON [Camps] ([LocationId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    CREATE INDEX [IX_Talks_CampId] ON [Talks] ([CampId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    CREATE INDEX [IX_Talks_SpeakerId] ON [Talks] ([SpeakerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20180928134504_initialdb')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20180928134504_initialdb', N'2.2.4-servicing-10062');
END;

GO

