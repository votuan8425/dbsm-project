select ma_SP, gia_ban from YUN.sanPham;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
update YUN.sanpham set gia_ban=700 where ma_sp='SP12';
rollback;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
select ma_SP, gia_ban from YUN.sanPham;
update YUN.sanpham set gia_ban=300 where ma_sp='SP12';
commit;
