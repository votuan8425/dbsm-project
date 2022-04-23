 SET TRANSACTION 
ISOLATION LEVEL 
SERIALIZABLE;

select * from YUN.KhuyenMai;
commit;

rollback;