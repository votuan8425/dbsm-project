--Session 2
BEGIN 
 YUN.PARTNER_UPDATE_PRODUCTS_DETAILS('SP02',N'?o Da Beo', 'DT01', 'LH01', 200, 700);
end;


BEGIN 
 YUN.PARTNER_UPDATE_PRODUCTS_DETAILS('SP01',N'Qu?n Jean', 'DT01', 'LH01', 200, 389);
end;
commit;

rollback;