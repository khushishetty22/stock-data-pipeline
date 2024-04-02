-- Insert data into the QuarterlyFinancials table by joining Quarterly_income-statement and Quarterly_balance-sheet
INSERT INTO QuarterlyFinancials (Date, BasicEPS, EBIT, GrossProfit, InterestExpense, NetIncome, TotalRevenue, CurrentAssets, CurrentLiabilities, StockholdersEquity, TotalLiabilitiesNetMinorityInterest, CompanyName)
SELECT 
    qis.Date,
    qis.BasicEPS,
    qis.EBIT,
    qis.GrossProfit,
    qis.InterestExpense,
    qis.NetIncome,
    qis.TotalRevenue,
    qbs.CurrentAssets,
    qbs.CurrentLiabilities,
    qbs.StockholdersEquity,
    qbs.TotalLiabilitiesNetMinorityInterest,
    qis.CompanyName
FROM 
    Quarterly_income_statement qis
JOIN 
    Quarterly_balance_sheet qbs ON qis.Date = qbs.Date AND qis.CompanyName = qbs.CompanyName;


-- Insert data into the AnnualFinancials table by joining Annual_income-statement and Annual_balance-sheet
INSERT INTO AnnualFinancials (Date, BasicEPS, EBIT, GrossProfit, InterestExpense, NetIncome, TotalRevenue, CurrentAssets, CurrentLiabilities, StockholdersEquity, TotalLiabilitiesNetMinorityInterest, CompanyName)
SELECT 
    ais.Date,
    ais.BasicEPS,
    ais.EBIT,
    ais.GrossProfit,
    ais.InterestExpense,
    ais.NetIncome,
    ais.TotalRevenue,
    abs.CurrentAssets,
    abs.CurrentLiabilities,
    abs.StockholdersEquity,
    abs.TotalLiabilitiesNetMinorityInterest,
    ais.CompanyName
FROM 
    Annual_income_statement ais
JOIN 
    Annual_balance_sheet abs ON ais.Date = abs.Date AND ais.CompanyName = abs.CompanyName;
