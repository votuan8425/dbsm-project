select ma_DH, tinh_trang, tien_do 
from YUN.chitietdonhang;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


update YUN.chitietdonhang
set tien_do = '?� c� t�i x? nh?n', tinh_trang ='?� thanh to�n'
where Ma_DH='DH04';

commit;
select ma_DH, tinh_trang, tien_do 
from YUN.chitietdonhang;