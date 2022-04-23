 SET TRANSACTION 
ISOLATION LEVEL 
READ COMMITTED;


insert into YUN.KhuyenMai(ma_KM, ten_KM, gia_tri_toi_thieu, chiet_khau, Ngay_bat_dau, Ngay_het_han)
                values('KM03', N'Khuy?n Mãi 3', 1500, 100, TO_DATE('12/04/2022', 'DD/MM/YYYY'), TO_DATE('28/05/2022', 'DD/MM/YYYY'));
select * from YUN.KhuyenMai;

commit;

rollback;