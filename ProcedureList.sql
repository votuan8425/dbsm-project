CREATE OR REPLACE PROCEDURE PARTNER_PRINT_ORDER (ma_DHANG nvarchar2) 
IS
    MDH_DonHang donhang.ma_dh%TYPE;
    MKH_DonHang donhang.ma_kh%TYPE;
    MNV_DonHang donhang.ma_nv%TYPE;
    MSP_DonHang donhang.ma_sp%TYPE;
    SL_DonHang donhang.so_luong%TYPE;
BEGIN
    select ma_dh,ma_kh,ma_nv,ma_sp,so_luong 
    into MDH_DonHang,MKH_DonHang,MNV_DonHang,MSP_DonHang,SL_DonHang
    from DonHang
    where ma_dh = ma_DHANG;
    dbms_output.put_line('Thong tin : ' ||MDH_DonHang ||' ' || MKH_DonHang||' ' ||MNV_DonHang||' ' ||MSP_DonHang||' ' ||SL_DonHang);
END;
--MDH_DonHang,MKH_DonHang,MNV_DonHang,MSP_DonHang,SL_DonHang
--EXECUTE PARTNER_PRINT_DH('DH01');


    
CREATE OR REPLACE PROCEDURE PARTNER_ADD_ORDER
    (MDH_DonHang in donhang.ma_dh%TYPE,
    MKH_DonHang in donhang.ma_kh%TYPE,
    MNV_DonHang in donhang.ma_nv%TYPE,
    MKM_DonHang in donhang.ma_km%TYPE,
    MSP_DonHang in donhang.ma_sp%TYPE,
    SL_DonHang in donhang.so_luong%TYPE)
    is
BEGIN
    insert into DonHang values (MDH_DonHang,MKH_DonHang,MNV_DonHang,MKM_DonHang,MSP_DonHang,SL_DonHang);
    dbms_output.put_line('added ');
END;

CREATE OR REPLACE PROCEDURE PARTNER_ADD_PRODUCT
    (MSP in SANPHAM.MA_SP%TYPE,
    TSP in SANPHAM.TEN_SAN_PHAM%TYPE,
    MNCC in SANPHAM.MA_NHA_CUNG_CAP%TYPE,
    MLH in SANPHAM.MA_LOAI_HANG%TYPE,
    GNHAP in SANPHAM.GIA_NHAP%TYPE,
    GBAN in SANPHAM.GIA_BAN%TYPE)
    is
BEGIN
    insert into SANPHAM values (MSP,TSP,MNCC,MLH,GNHAP,GBAN);
    dbms_output.put_line('added ');
END;

CREATE OR REPLACE PROCEDURE PARTNER_REMOVE_PRODUCT (ma_SPHAM nvarchar2) 
IS
BEGIN
    delete from SANPHAM where MA_SP = ma_SPHAM;
    dbms_output.put_line('removed ');
END;

CREATE OR REPLACE PROCEDURE PARTNER_REMOVE_ORDER (ma_DHANG nvarchar2) 
IS
BEGIN
    delete from DonHang where ma_dh = ma_DHANG;
    dbms_output.put_line('removed ');
END;
--EXECUTE PROCEDURE_REMOVE_DH('DH06');


CREATE OR REPLACE PROCEDURE PARTNER_ORDER_TRACKING (ma_DHANG nvarchar2)
is
    MDH chitietdonhang.ma_dh%TYPE;
    quaTrinh chitietdonhang.qua_trinh_vc%TYPE;
begin
        select ma_dh, qua_trinh_vc
        into MDH,quaTrinh
        from chitietdonhang
        where ma_dh = ma_DHANG;
        dbms_output.put_line('Thong tin : ' ||MDH ||' ' || quaTrinh);
end;


create or replace PROCEDURE PROCEDURE_PARTNER_ADD_BRANCH 
    (MCN in chiNhanh.ma_cn%TYPE,
    MDT in chiNhanh.ma_dt%TYPE,
    DCCN in chinhanh.dia_chi_ch%TYPE)
    is
BEGIN
    insert into chinhanh values (MCN,MDT,DCCN);
    dbms_output.put_line('added');
END;

--EXECUTE PROCEDURE_PARTNER_ADD_BRANCH('CN012','DT02',N'90 Phan Hi?u');



CREATE OR REPLACE PROCEDURE PARTNER_ADD_PRODUCT_TO_BRANCH 
    ( MCN in sanPham_chiNhanh.ma_cn%TYPE,
      MSP in sanPham_chiNhanh.ma_sp%TYPE,
      SL in sanPham_chiNhanh.so_luong%TYPE)
      is
begin
    insert into sanPham_chiNhanh values (MCN, MSP, SL);
    dbms_output.put_line('added');
end;

--EXECUTE PARTNER_ADD_PRODUCT_TO_BRANCH('CN11','SP02', 120);

CREATE OR REPLACE PROCEDURE PARTNER_REMOVE_PRODUCT_FROM_BRANCH ( MCN NVARCHAR2)
is
begin
    delete from sanPham_chiNhanh where ma_cn= MCN;
    dbms_output.put_line('removed');
end;
--EXECUTE PARTNER_REMOVE_PRODUCT_FROM_BRANCH('CN12');


CREATE OR REPLACE PROCEDURE PARTNER_GET_ORDERS (MDH NVARCHAR2)
is
        MDHang chitietdonhang.ma_dh%TYPE;
        status chitietdonhang.tinh_trang%TYPE;
begin
    select ma_dh, tinh_trang
    into MDHang, status
    from chitietdonhang
    where ma_dh = MDH;
    dbms_output.put_line('Thong tin : ' ||MDHang ||' ' || status);
end;

--EXECUTE PARTNER_GET_ORDERS('DH01');         


CREATE OR REPLACE PROCEDURE PARTNER_OR_DRIVER_UPDATE_DELIVERY_STATUS 
        (MDHang in chitietdonhang.ma_dh%TYPE,
         status in chitietdonhang.tinh_trang%TYPE)
IS
BEGIN
    update chitietdonhang
    set tinh_trang=status
    where ma_dh = MDHang;
    dbms_output.put_line('Updated');
END;
--EXECUTE PARTNER_OR_DRIVER_UPDATE_DELIVERY_STATUS('DH01', N'?ã thanh toán');


 

create or replace  PROCEDURE CUSTOMER_ADD_PRODUCT_TO_ORDER 
    (MDH_DonHang in donhang.ma_dh%TYPE,
    MKH_DonHang in donhang.ma_kh%TYPE,
    MNV_DonHang in donhang.ma_nv%TYPE,
    MKM_DonHang in donhang.ma_km%TYPE,
    MSP_DonHang in donhang.ma_sp%TYPE,
    SL_DonHang in donhang.so_luong%TYPE)
    is
BEGIN
    insert into DonHang values (MDH_DonHang,MKH_DonHang,MNV_DonHang,MKM_DonHang,MSP_DonHang,SL_DonHang);
    dbms_output.put_line('added ');
END;

--EXECUTE CUSTOMER_ADD_PRODUCT_TO_ORDER('DH06','KH02','NV02','KM01','SP02',2);

CREATE OR REPLACE PROCEDURE CUSTOMER_UPDATE_PRODUCT_TO_ORDER 
    (MDH_DonHang in donhang.ma_dh%TYPE,
    MKH_DonHang in donhang.ma_kh%TYPE,
    MNV_DonHang in donhang.ma_nv%TYPE,
    MKM_DonHang in donhang.ma_km%TYPE,
    MSP_DonHang in donhang.ma_sp%TYPE,
    SL_DonHang in donhang.so_luong%TYPE)
    is
BEGIN
    update donhang
    set ma_kh = MKH_DonHang, ma_nv=MNV_DonHang, ma_km=MKM_DonHang, ma_sp=MSP_DonHang, so_luong = SL_DonHang
    where ma_dh=MDH_DonHang;
    dbms_output.put_line('added ');
END;

--EXECUTE CUSTOMER_UPDATE_PRODUCT_TO_ORDER('DH06','KH02','NV02','KM01','SP02',3);



CREATE OR REPLACE PROCEDURE DRIVER_GET_ORDERS
(MDH NVARCHAR2)
is
        MDHang chitietdonhang.ma_dh%TYPE;
        status chitietdonhang.tinh_trang%TYPE;
        nhandon chitietdonhang.tien_do%TYPE;
begin
    select ma_dh, tinh_trang,tien_do
    into MDHang, status, nhandon
    from chitietdonhang
    where ma_dh = MDH;
    dbms_output.put_line('Thong tin : ' ||MDHang ||' ' || status||' và ' || nhandon);
end;

--EXECUTE DRIVER_GET_ORDERS('DH01');         





 CREATE OR REPLACE PROCEDURE DRIVER_RECEIVE_ORDER 
        (MDHang in chitietdonhang.ma_dh%TYPE,
         tienDo in chitietdonhang.tien_do%TYPE
         )
IS
BEGIN
    update chitietdonhang
    set tien_do=tienDo
    where ma_dh = MDHang;
    dbms_output.put_line('Updated');
END;
--EXECUTE DRIVER_RECEIVE_ORDER('DH03', N'?ã có tài x? nh?n ??n');


 CREATE OR REPLACE PROCEDURE EMPLOYEE_GET_ORDER_DETAILS 
(ma_NVIEN nvarchar2) 
IS
    MNV nhanvien.ma_nv%TYPE;
    HOTENNV nhanvien.hoten_nv%TYPE;
    NGAYVAO nhanvien.ngay_vao_lam%TYPE;
    SDT nhanvien.sdt_nv%TYPE;
BEGIN
    select ma_nv,hoten_nv,ngay_vao_lam,sdt_nv
    into MNV,HOTENNV,NGAYVAO,SDT
    from nhanvien
    where ma_nv = ma_NVIEN;
    dbms_output.put_line('Thông tin : Mã nhân viên: ' ||MNV ||', H? và Tên: ' || HOTENNV||', Ngày vào làm: ' ||NGAYVAO||', S? ?i?n tho?i: ' ||SDT);
END;
--MDH_DonHang,MKH_DonHang,MNV_DonHang,MSP_DonHang,SL_DonHang
--EXECUTE EMPLOYEE_GET_ORDER_DETAILS('NV01');



 CREATE OR REPLACE PROCEDURE EMPLOYEE_GET_CONTRACTS 
(ma_HDONG nvarchar2) 
IS
    MHD hopdong.ma_hd%TYPE;
    MDT Hopdong.ma_dt%TYPE;
    NGAYHD hopdong.ngay_hd%TYPE;
    NGAYKETTHUC hopdong.ngay_ket_thuc_hd%TYPE;
    SOCHINHANH hopdong.so_chi_nhanh_dangky%TYPE;
    
BEGIN
    select ma_hd,ma_dt,ngay_hd,ngay_ket_thuc_hd,so_chi_nhanh_dangky
    into MHD,MDT,NGAYHD, NGAYKETTHUC,SOCHINHANH
    from hopdong
    where ma_hd = ma_HDONG;
    dbms_output.put_line('Thông tin : Mã h?p ??ng: ' ||MHD ||', Mã ??i tác: ' || MDT||', Ngày ký h?p ??ng: ' ||NGAYHD||', Ngày k?t thúc: ' ||NGAYKETTHUC||', S? chi nhánh ??ng ký: ' ||SOCHINHANH);
END;
--MDH_DonHang,MKH_DonHang,MNV_DonHang,MSP_DonHang,SL_DonHang
--EXECUTE EMPLOYEE_GET_CONTRACTS('HD01');

CREATE OR REPLACE PROCEDURE ADMIN_ADD_ADMIN_ACCOUNT 
 (user in taikhoan.username%TYPE,
    pass in taikhoan.password%TYPE)
    is
BEGIN
    insert into taikhoan values (user,pass,'admin','not actived');
    dbms_output.put_line('added');
END;

--EXECUTE ADMIN_ADD_ADMIN_ACCOUNT('admin1','admin1');

CREATE OR REPLACE PROCEDURE ADMIN_REMOVE_ADMIN_ACCOUNT 
 (user nvarchar2) 
    is
BEGIN
    delete from taikhoan where username = user;
    dbms_output.put_line('removed');
END;

--EXECUTE ADMIN_REMOVE_ADMIN_ACCOUNT('admin1');

CREATE OR REPLACE PROCEDURE ADMIN_ADD_EMPLOYEE_ACCOUNT 
 (user in taikhoan.username%TYPE,
    pass in taikhoan.password%TYPE
    )
    is
BEGIN
    insert into taikhoan values (user,pass,'NV');
    dbms_output.put_line('added');
END;
--EXECUTE ADMIN_ADD_EMPLOYEE_ACCOUNT('DT06', 'DT06');

CREATE OR REPLACE PROCEDURE ADMIN_REMOVE_EMPLOYEE_ACCOUNT 
 (user nvarchar2) 
    is
BEGIN
    delete from taikhoan where username = user;
    dbms_output.put_line('removed');
END;
--EXECUTE ADMIN_REMOVE_EMPLOYEE_ACCOUNT('DT06');


CREATE OR REPLACE PROCEDURE PARTNER_REGISTATION
    (MDT in doitacVC.ma_dt%TYPE,
    MST in doitacVC.ma_so_thue%TYPE,
    TDT in doitacVC.ten_dt%TYPE,
    NDD in doitacVC.nguoi_dai_dien%TYPE,
    SCNHANH in doitacVC.so_chi_nhanh%TYPE,
    TP in doitacVC.thanh_pho%TYPE,
    Q in doitacVC.quan%TYPE,
    MLH in doitacVC.ma_loai_hang_vc%TYPE,
    DCKD in doitacVC.dia_chi_kinh_doanh%TYPE,
    SDT in doitacVC.sdt_vc%TYPE,
    EMAIL in doitacVC.email_vc%TYPE,
    SLDH in doitacVC.sl_dh_moi_ngay%TYPE)
    is
BEGIN
    insert into doitacVC values (MDT,MST,TDT,NDD,SCNHANH,TP,Q,MLH,DCKD,SDT,EMAIL,SLDH);
    dbms_output.put_line('added');
END;

--EXECUTE PARTNER_REGISTATION('DT06','DT06GHTL',N'Giao hàng ti?n l?i',N'Hu?nh Tri?u V', 1, 'TP HCM', N'Qu?n 3',N'LH01', N'2 Nguy?n Khoa', 901116, 'ghtl@gmail.com',20);

CREATE OR REPLACE PROCEDURE CUSTOMER_REGISTRATION 
    (user in taikhoan.username%TYPE,
    pass in taikhoan.password%TYPE,
    MKH in khachhang.ma_kh%TYPE,
    HT in khachhang.ho_ten%TYPE,
    DC in khachhang.dia_chi_kh%TYPE,
    SDT in khachhang.sdt_kh%TYPE,
    EMAIL in khachhang.email_KH%TYPE)
    is
BEGIN
    insert into taikhoan values (user, pass,'KH','Actived');
    insert into khachhang values (MKH,HT,DC,SDT,EMAIL);
    dbms_output.put_line('added');
END;

CREATE OR REPLACE PROCEDURE DRIVER_RECEIVE_ORDER   
   as    
    MTX taixedh.ma_sp%TYPE;
    MDH taixedh.ma_dh%TYPE;
    gas taixedh.phi_vc%TYPE;
    
    CURSOR c1 IS

    select ma_sp,ma_dh, phi_vc
    into MTX,MDH, gas
    from taixedh;
begin
open c1;
loop
fetch c1 into MTX,MDH, gas;
EXIT WHEN c1%NOTFOUND;
    dbms_output.put_line('Thong tin: Ma TX: '||MTX ||', Ma loai hang: ' ||MDH||', Phí: ' || gas);
    end loop;
  close c1;
END;
--EXECUTE DRIVER_RECEIVE_ORDER;



CREATE OR REPLACE PROCEDURE PARTNER_UPDATE_PRODUCTS_DETAILS
        (MSP in sanPham.ma_sp%TYPE,
        TSP in sanpham.ten_san_pham%TYPE,
        MNCC in sanpham.ma_nha_cung_cap%TYPE,
        MLH in sanpham.ma_loai_hang%TYPE,
        GNhap in sanPham.gia_nhap%TYPE,
         GBan in sanPham.gia_ban%TYPE)
IS
BEGIN
    update sanPham
    set ten_san_pham=TSP, ma_nha_cung_cap= MNCC, ma_loai_hang =MLH, gia_nhap=GNhap, gia_ban= GBan
    where ma_sp = MSP;
    dbms_output.put_line('Updated');
END;
--EXECUTE PARTNER_UPDATE_PRODUCTS_DETAILS('SP01',N'Qu?n Jean', 'DT01', 'LH01', 200, 430);


CREATE OR REPLACE PROCEDURE PARTNER_PRINT_PRODUCTS_DETAILS (in_MSP nvarchar2)
   IS     MSP sanPham.ma_sp%TYPE;
        TSP sanpham.ten_san_pham%TYPE;
        MNCC sanpham.ma_nha_cung_cap%TYPE;
        MLH sanpham.ma_loai_hang%TYPE;
        GNhap sanPham.gia_nhap%TYPE;
         GBan sanPham.gia_ban%TYPE;

BEGIN
    SELECT ma_sp, ten_san_pham, ma_nha_cung_cap, ma_loai_hang, gia_nhap, gia_ban
    INTO MSP, TSP, MNCC, MLH, GNHAP, GBAN
    FROM sanPham
    where ma_sp = in_MSP;
    dbms_output.put_line('Thong tin: Ma sp: '||MSP ||', TÊN S?N PH?M: ' ||TSP||', Ma nha cung cap: ' || MNCC||', Ma loai hang: ' ||MLH||', Gia Nhap: ' ||GNHAP||', Gia Ban: ' ||GBAN);
END;
--EXECUTE PARTNER_PRINT_PRODUCTS_DETAILS('SP01');
create or replace function CHECK_IS_ACCOUNT_IS_ACTIVE(in_user nvarchar2)
return nvarchar2
as userN taikhoan.username%TYPE;
   rol taikhoan.role%TYPE;
begin	
  select username 
  into userN
  from taikhoan 
  where taikhoan.username=in_user
  and taikhoan.status = 'Actived';
  if userN IS not NULL THEN
  return 'true';
END IF ;
return 'false';
end;

set serveroutput on;
  begin  
   dbms_output.put_line(CHECK_IS_ACCOUNT_IS_ACTIVE('DT01'));
end;


