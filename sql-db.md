    // Check if a user exists
    IF USER_ID('RestaurantEventsUK') IS NULL
        EXEC('CREATE USER [RestaurantEvents' + @tenant + '] FOR LOGIN [RestaurantEvents' + @tenant + '] 
        WITH DEFAULT_SCHEMA=[dbo]')


    // Getting an exclusive access 
    ALTER DATABASE [Database-Name] SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
    ALTER DATABASE [Database-Name] SET MULTI_USER
    
    // Grant permission at object
    GRANT SELECT, UPDATE, INSERT ON dbo.[Restaurants] TO RestaurantEvents
    
    // Adding a column
    ALTER TABLE Companies ADD BuyerCompany_EnableBidOnLedgerTrade bit NOT NULL DEFAULT 1

    ALTER TABLE UltraUsers ADD 
        HttpReferer nvarchar(1024) NULL,
        MarketingChannel nvarchar(1024) NULL,
        ReferralSource nvarchar(512) NULL,
        ReferralOtherText nvarchar(2048) NULL

    // Drop a column
    ALTER TABLE InvestorRelationsUserGroups DROP COLUMN UserId

    // Alter column type
    ALTER TABLE InvestorRelationsUserGroups ALTER COLUMN UserId uniqueidentifier NOT NULL

    // Alter Column name
    EXEC sp_RENAME 'DueDiligenceAnswers.Answer' , 'AnswerText', 'COLUMN'

    // Drop constraint
    ALTER TABLE InvestorRelationsUserGroups 
    DROP CONSTRAINT FK_InvestorRelationsUserGroups_InvestorRelationsUsers_UserId

    // Drop index
    DROP INDEX IX_InvestorRelationsUserGroups_UserId ON InvestorRelationsUserGroups

    // Creating an index

    CREATE NONCLUSTERED INDEX [IX_UserData_Id] ON [dbo].[UserData]
    (
        [UserDataId] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



    
