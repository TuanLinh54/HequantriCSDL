/*B�i 1 - 1*/
CREATE PROC sp_Bai1_1 @ten NVARCHAR(20)
AS
	BEGIN
		PRINT ('Xin ch�o: '+ @ten)
	END

EXEC sp_Bai1_1 'BAN'
