﻿CREATE TRIGGER checksldean_NV ON DEAN AFTER DELETE AS
BEGIN
DECLARE @sldean INT;
SET @sldean = (SELECT COUNT(*) FROM DEAN, NHANVIEN WHERE DEAN.PHONG = NHANVIEN.PHG)
SELECT @sldean = COUNT(*) FROM deleted
PRINT N'TONG SO LUONG DE AN MA NHAN VIEN DA LAM' + @sldean
END