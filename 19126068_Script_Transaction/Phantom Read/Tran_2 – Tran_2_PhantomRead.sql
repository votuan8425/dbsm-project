 SET TRANSACTION 
ISOLATION LEVEL 
READ COMMITTED;

begin
YUN.PARTNER_ADD_PRODUCT('SP99',N'Qu?n AiB', 'DT01', 'LH01', 200, 1000);
end;
select * from YUN.sanPham;
commit;

