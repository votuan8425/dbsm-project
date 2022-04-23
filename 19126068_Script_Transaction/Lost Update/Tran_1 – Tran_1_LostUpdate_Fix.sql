select ma_SP, gia_ban from YUN.sanPham;
update YUN.sanpham set gia_ban=600 where ma_sp='SP12';
commit;
rollback;