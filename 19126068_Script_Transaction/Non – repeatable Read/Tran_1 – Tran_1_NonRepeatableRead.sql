SET TRANSACTION 
ISOLATION LEVEL 
READ COMMITTED;

select ma_DH, ma_SP , so_luong
from YUN.DonHang
where ma_KH='KH03';

select sum(SP.gia_ban*DH.so_luong)
from YUN.DonHang DH join YUN.SanPham SP
on DH.ma_SP = SP.ma_SP
where ma_KH ='KH03';

commit;
