-- 1. Нписать запрос получение всех продуктов с типом "СЫР"
select * from product p, type t where t.name='СЫР' AND p.type_id = t.id;

-- 2. Написать запрос получения всех продуктов, у кого в имени есть слово "мороженое"
select * from product where lower(name) like '%мороженое%';

-- 3. Написать запрос, который выводит все продукты, срок годности которых уже истек
select * from product where expired_date<current_date

-- 4. Написать запрос, который выводит самый дорогой продукт. Запрос должен быть универсальный и находить все продукты с максимальной ценой. Например, если в таблице есть продукт типа СЫР с ценой 200 и продукт типа МОЛОКО с ценой 200, и эта цена максимальная во всей таблице, то запрос должен вывести оба этих продукта.
select p1.* from product p1 where p1.price = (select max(p2.price) from product p2);

-- 5. Написать запрос, который выводит для каждого типа количество продуктов к нему принадлежащих. В виде имя_типа, количество
select t.name, count(p.name) from product p join type t on p.type_id=t.id group by t.name;

-- 6. Написать запрос получение всех продуктов с типом "СЫР" и "МОЛОКО"
select p.*, t.name from product p join type t on p.type_id=t.id where t.name in ('МОЛОКО', 'СЫР');

-- 7. Написать запрос, который выводит тип продуктов, которых осталось меньше 10 штук. Под количеством подразумевается количество продуктов определенного типа. Например, если есть тип "СЫР" и продукты "Сыр плавленный" и "Сыр моцарелла", которые ему принадлежат, то количество продуктов типа "СЫР" будет 2. 
select t.name, count(p.name) c from product p join type t on p.type_id=t.id group by t.name having count(p.name)<10;

-- 8. Вывести все продукты и их тип.
select p.*, t.name from product p, type t where p.type_id=t.id