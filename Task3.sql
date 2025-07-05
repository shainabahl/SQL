use shaina ;

select *
from bigmart
where Item_Type LIKE "%Food%" and Item_Fat_Content ="Low Fat"
order by Item_MRP DESC


