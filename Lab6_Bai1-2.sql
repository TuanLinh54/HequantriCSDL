﻿CREATE TRIGGER checktuoi_them_NV ON NHANVIEN FOR INSERT AS
IF (SELECT (YEAR(GETDATE())-YEAR(NGSINH)) FROM inserted) <= 65 
AND (SELECT (YEAR(GETDATE())-YEAR(NGSINH)) FROM inserted) >= 18
BEGIN
PRINT N'DO TUOI PHAI NAM TRONG KHOANG 18 <= TUOI => 65'
ROLLBACK TRANSACTION
END