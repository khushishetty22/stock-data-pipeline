CREATE PROCEDURE DeleteTableData (@tableNames nvarchar(max)) AS
BEGIN
  DECLARE @tableName nvarchar(50);
  DECLARE @deleteState nvarchar(max); -- Declare the variable outside the loop

  -- Loop through each table name in the comma-separated list
  WHILE CHARINDEX(',', @tableNames) > 0
  BEGIN
    -- Extract the first table name from the list
    SELECT @tableName = LEFT(@tableNames, CHARINDEX(',', @tableNames) - 1);

    -- Construct the DELETE statement dynamically
    SET @deleteState = 'DELETE FROM ' + QUOTENAME(@tableName);

    -- Remove the first table name from the list
    SET @tableNames = SUBSTRING(@tableNames, CHARINDEX(',', @tableNames) + 1, LEN(@tableNames));

    -- Execute the DELETE statement for the current table
    EXEC sp_executesql @deleteState;
  END;

  -- Handle the last table name remaining in the list (if any)
  IF LEN(@tableNames) > 0
  BEGIN
    SET @deleteState = 'DELETE FROM ' + QUOTENAME(@tableNames);
    EXEC sp_executesql @deleteState;
  END;
END;
