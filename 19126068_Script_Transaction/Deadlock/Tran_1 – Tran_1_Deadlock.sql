--Session 1
BEGIN 
 YUN.PARTNER_UPDATE_PRODUCTS_DETAILS('SP01',N'Qu?n Jean', 'DT01', 'LH01', 200, 330);
end;

BEGIN 
 YUN.PARTNER_UPDATE_PRODUCTS_DETAILS('SP02',N'�o Da Beo', 'DT01', 'LH01', 200, 100);
end;


commit;

select * from YUN.sanpham;

rollback;