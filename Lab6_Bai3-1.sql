CREATE TRIGGER xoaTN_nv ON NHANVIEN INSTEAD OF DELETE AS
BEGIN
DELETE FROM THANNHAN WHERE MA_NVIEN IN (SELECT MANV FROM deleted)
DELETE FROM NHANVIEN WHERE MANV IN (SELECT MANV FROM deleted)
END