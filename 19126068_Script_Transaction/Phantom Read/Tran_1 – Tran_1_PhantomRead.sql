 SET TRANSACTION 
ISOLATION LEVEL 
READ COMMITTED;

select * from YUN.sanPham;

commit;

rollback;
