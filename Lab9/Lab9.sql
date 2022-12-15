----Cau 1
CREATE FUNCTION diemtb (@msv CHAR(5))
RETURNS FLOAT
AS
BEGIN
	DECLARE @dtb FLOAT
	SET @dtb = (SELECT AVG(DIEMTHI) FROM KETQUA WHERE MASV=@msv)
	RETURN @dtb
END

SELECT dbo.diemtb ('01')

----Cau 2
--Cach 1:
CREATE FUNCTION tblop(@mlop CHAR(5))
RETURNS TABLE
AS
RETURN
	SELECT s.MASV, HOTEN, trbinh=dbo.diemtb(s.MASV)
	FROM SINHVIEN s JOIN KETQUA k ON s.MASV=k.MASV
	WHERE MALOP=@mlop
	GROUP BY s.MASV, HOTEN

--Cach 2:
CREATE FUNCTION tblop1(@mlop CHAR(5))
RETURNS @dsdtb TABLE (MASV CHAR(5), TENSV NVARCHAR(20), DTB FLOAT)
AS
BEGIN
	INSERT @dsdtb
	SELECT s.MASV, HOTEN, trbinh=dbo.diemtb(s.MASV)
	FROM SINHVIEN s JOIN KETQUA k ON s.MASV=k.MASV
	WHERE MALOP=@mlop
	GROUP BY s.MASV, HOTEN
	RETURN
END

SELECT * FROM tblop1('a')

----Cau 3
CREATE PROCEDURE ktra @msv CHAR(5)
AS
BEGIN
 DECLARE @n INT
 SET @n=(SELECT COUNT(*) FROM KETQUA WHERE MASV=@msv)
 IF @n=0
 PRINT 'sinh vien '+@msv + 'khong thi mon nao'
 ELSE
 PRINT 'sinh vien '+ @msv+ 'thi '+CAST(@n AS CHAR(2))+ 'mon'
END

EXEC ktra '01'

----Cau 4
CREATE TRIGGER updatesslop
ON sinhvien
FOR INSERT
AS
BEGIN
	 DECLARE @ss INT
	 SET @ss=(SELECT COUNT(*) FROM SINHVIEN s
	 WHERE MALOP IN(SELECT MALOP FROM inserted))
	 IF @ss>10
	 BEGIN
	 PRINT 'Lop day'
	 ROLLBACK TRAN
	 END
	 ELSE
	 BEGIN
	 UPDATE LOP
	 SET SiSo=@ss
	 WHERE malop IN (SELECT MALOP FROM inserted)
	 END END