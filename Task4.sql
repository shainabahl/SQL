use shaina ;

select item_type, AVG(Item_weight),sum(item_weight),count(Item_Type)
from bigmart
where Item_Type LIKE "%Food%" and Item_Fat_Content ="Low Fat"
Group by item_type
order by AVG(Item_weight) desc