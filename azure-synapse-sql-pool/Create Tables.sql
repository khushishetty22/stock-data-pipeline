CREATE TABLE index_data
(
    Date date,
    DJI float,
    GSPC float,
    IXIC float,
    RUT float,
    W5000 float
)
WITH
(
    DISTRIBUTION = HASH (Date),
    CLUSTERED COLUMNSTORE INDEX
)
GO


CREATE TABLE company_data
(
    Date date,
    AAPL float,
    AMZN float,
    META float,
    MSFT float
)
WITH
(
    DISTRIBUTION = HASH (Date),
    CLUSTERED COLUMNSTORE INDEX
)
GO


CREATE TABLE annual_balance_sheet
(
    Date date,
    CurrentAssets bigint,
    CurrentLiabilities bigint,
    StockholdersEquity bigint,
    TotalLiabilitiesNetMinorityInterest bigint,
    CompanyName nvarchar(6)
)
WITH
(
    DISTRIBUTION = HASH (Date),
    CLUSTERED COLUMNSTORE INDEX
)
GO


CREATE TABLE annual_income_statement 
(
    Date date,
    BasicEPS decimal(18,2),
    EBIT bigint,
    GrossProfit bigint,
    InterestExpense bigint,
    NetIncome bigint,
    TotalRevenue bigint,
    CompanyName nvarchar(6)
)
WITH
(
    DISTRIBUTION = HASH (Date),
    CLUSTERED COLUMNSTORE INDEX
)
GO


CREATE TABLE quarterly_income_statement
(
    Date date,
    BasicEPS decimal(18,2),
    EBIT bigint,
    GrossProfit bigint,
    InterestExpense bigint,
    NetIncome bigint,
    TotalRevenue bigint,
    CompanyName nvarchar(6)
)
WITH
(
    DISTRIBUTION = HASH (Date),
    CLUSTERED COLUMNSTORE INDEX
)
GO


CREATE TABLE quarterly_balance_sheet
(
    Date date,
    CurrentAssets bigint,
    CurrentLiabilities bigint,
    StockholdersEquity bigint,
    TotalLiabilitiesNetMinorityInterest bigint,
    CompanyName nvarchar(6)
)
WITH
(
    DISTRIBUTION = HASH (Date),
    CLUSTERED COLUMNSTORE INDEX
)
GO

CREATE TABLE company_volume_data
(
    Date DATE,  
    AAPL BIGINT,  
    AMZN BIGINT,  
    META BIGINT,  
    MSFT BIGINT  
)
WITH
(
    DISTRIBUTION = HASH (Date),
    CLUSTERED COLUMNSTORE INDEX
)
GO
