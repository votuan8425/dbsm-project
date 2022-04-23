SET TRANSACTION 
ISOLATION LEVEL 
READ COMMITTED;

select * from YUN.sanpham_chinhanh;

update YUN.sanpham_chinhanh 
set so_luong = 200
where ma_cn='CN01'and ma_sp='SP01';
