SELECT TENNV, LUONG, YEAR(GETDATE())-YEAR(NGSINH) AS 'TUOI' FROM NHANVIEN

CREATE VIEW tuoiNV
AS
SELECT TENNV, LUONG, YEAR(GETDATE())-YEAR(NGSINH) AS 'TUOI' FROM NHANVIEN

SELECT * FROM tuoiNV