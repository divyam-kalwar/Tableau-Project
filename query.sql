CREATE TABLE product_table AS 
select p.*,pc.* from product as p
left join (SELECT 
    			a.productcategorykey AS category_key,
    			a.englishproductcategoryname AS category_name,
    			b.englishproductsubcategoryname AS subcategory_name,
    			b.productsubcategorykey AS subcategory_key
			FROM productcategory AS a
			LEFT JOIN productsubcategory AS b 
			ON a.productcategorykey = b.productcategorykey) as pc
on p.productsubcategorykey=pc.subcategory_key
order by productkey;

select * from internetsales as ints
left join product_table as pt
on ints.productkey=pt.productkey
order by ints.productkey;