DECLARE @Users TABLE (UserName SYSNAME, USERSID VARCHAR(40))
DECLARE @UserName SYSNAME
INSERT INTO @Users EXEC sp_change_users_login 'report'
DECLARE cur_User CURSOR FOR
SELECT U.UserName
FROM @Users U
INNER JOIN msdb.sys.syslogins S WITH (NOLOCK)
    ON S.loginname COLLATE Latin1_General_100_CS_AS = U.UserName
    AND S.hasaccess = 1
OPEN cur_User
FETCH NEXT FROM cur_User INTO @UserName
WHILE (@@fetch_status = 0)
BEGIN
    PRINT @UserName
    EXEC sp_change_users_login 'update_one', @UserName, @UserName
    FETCH NEXT FROM cur_User INTO @UserName
END
CLOSE cur_User
DEALLOCATE cur_User