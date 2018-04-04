    // Getting an exclusive access 
    ALTER DATABASE [Database-Name] SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
    ALTER DATABASE [Database-Name] SET MULTI_USER
    
    // Grant permission at object
    GRANT SELECT, UPDATE, INSERT ON dbo.[Restaurants] TO RestaurantEvents
