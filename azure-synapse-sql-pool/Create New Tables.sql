-- Create the QuarterlyFinancials table
CREATE TABLE QuarterlyFinancials (
    Date DATE,
    BasicEPS DECIMAL(18, 2),
    EBIT BIGINT,
    GrossProfit BIGINT,
    InterestExpense BIGINT,
    NetIncome BIGINT,
    TotalRevenue BIGINT,
    CurrentAssets BIGINT,
    CurrentLiabilities BIGINT,
    StockholdersEquity BIGINT,
    TotalLiabilitiesNetMinorityInterest BIGINT,
    CompanyName NVARCHAR(50)
)
WITH
(
    DISTRIBUTION = HASH(Date),
    CLUSTERED COLUMNSTORE INDEX
)

GO

-- Create the AnnualFinancials table
CREATE TABLE AnnualFinancials (
    Date DATE,
    BasicEPS DECIMAL(18, 2),
    EBIT BIGINT,
    GrossProfit BIGINT,
    InterestExpense BIGINT,
    NetIncome BIGINT,
    TotalRevenue BIGINT,
    CurrentAssets BIGINT,
    CurrentLiabilities BIGINT,
    StockholdersEquity BIGINT,
    TotalLiabilitiesNetMinorityInterest BIGINT,
    CompanyName NVARCHAR(50)
)
WITH
(
    DISTRIBUTION = HASH(Date),
    CLUSTERED COLUMNSTORE INDEX
);

