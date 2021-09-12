
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/12/2021 13:29:49
-- Generated from EDMX file: C:\Users\User\source\repos\32SA2\32SA2\Models\EntityDataModel1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-32SA2-20210912010533];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Bookings'
CREATE TABLE [dbo].[Bookings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QuestionField1] nvarchar(max)  NOT NULL,
    [QuestionField2] nvarchar(max)  NOT NULL,
    [Duration] nvarchar(max)  NOT NULL,
    [DateTime] nvarchar(max)  NOT NULL,
    [UserID] nvarchar(max)  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL,
    [Service_Id] int  NOT NULL,
    [PublicEvent_Id] int  NOT NULL
);
GO

-- Creating table 'Services'
CREATE TABLE [dbo].[Services] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ServiceTitle] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [ConsultantID] nvarchar(max)  NOT NULL,
    [TargetGroup] nvarchar(max)  NOT NULL,
    [Consultant_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'PublicEvents'
CREATE TABLE [dbo].[PublicEvents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [DateTime] nvarchar(max)  NOT NULL,
    [Duration] nvarchar(max)  NOT NULL,
    [Capacity] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AspNetUsers_Consultant'
CREATE TABLE [dbo].[AspNetUsers_Consultant] (
    [AreaofExpertise] nvarchar(max)  NOT NULL,
    [Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [PK_Bookings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Services'
ALTER TABLE [dbo].[Services]
ADD CONSTRAINT [PK_Services]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PublicEvents'
ALTER TABLE [dbo].[PublicEvents]
ADD CONSTRAINT [PK_PublicEvents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers_Consultant'
ALTER TABLE [dbo].[AspNetUsers_Consultant]
ADD CONSTRAINT [PK_AspNetUsers_Consultant]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_AspNetUserBooking]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserBooking'
CREATE INDEX [IX_FK_AspNetUserBooking]
ON [dbo].[Bookings]
    ([AspNetUserId]);
GO

-- Creating foreign key on [Service_Id] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_BookingService]
    FOREIGN KEY ([Service_Id])
    REFERENCES [dbo].[Services]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingService'
CREATE INDEX [IX_FK_BookingService]
ON [dbo].[Bookings]
    ([Service_Id]);
GO

-- Creating foreign key on [Consultant_Id] in table 'Services'
ALTER TABLE [dbo].[Services]
ADD CONSTRAINT [FK_ServiceConsultant]
    FOREIGN KEY ([Consultant_Id])
    REFERENCES [dbo].[AspNetUsers_Consultant]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceConsultant'
CREATE INDEX [IX_FK_ServiceConsultant]
ON [dbo].[Services]
    ([Consultant_Id]);
GO

-- Creating foreign key on [PublicEvent_Id] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_BookingPublicEvent]
    FOREIGN KEY ([PublicEvent_Id])
    REFERENCES [dbo].[PublicEvents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingPublicEvent'
CREATE INDEX [IX_FK_BookingPublicEvent]
ON [dbo].[Bookings]
    ([PublicEvent_Id]);
GO

-- Creating foreign key on [Id] in table 'AspNetUsers_Consultant'
ALTER TABLE [dbo].[AspNetUsers_Consultant]
ADD CONSTRAINT [FK_Consultant_inherits_AspNetUser]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------