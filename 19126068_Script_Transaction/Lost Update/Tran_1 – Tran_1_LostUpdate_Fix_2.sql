select ma_DH, tinh_trang, tien_do 
from YUN.chitietdonhang;

update YUN.chitietdonhang
set tien_do = '?� c� t�i x? nh?n'
where Ma_DH='DH04';

commit;