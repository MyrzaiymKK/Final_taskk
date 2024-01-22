1. Owner_лердин аттарынын арасынан эн коп символ камтыган owner_ди жана анын уйун(House) чыгар
select * from owners o inner join houses h on o.id = h.owner_id order by length(first_name)  desc limit 6;
select * from owners;
-- - 2. Уйлордун баалары 1500, 2000 дин аралыгында бар болсо true чыгар, жок болсо false чыгар.
select furniture from houses where price between '1500' and '2000';
-- - 3. id_лери 5, 6, 7, 8, 9, 10 го барабар болгон адресстерди жана ал адрессте кайсы уйлор бар экенин чыгар.
select * from addresses a inner join houses h on a.id = h.address_id where a.id in ('5','6','7','8','9','10');
-- - 4. Бардык уйлорду, уйдун ээсинин атын, клиенттин атын, агенттин атын чыгар.
select o.first_name,c.first_name,a.name ,h.id  from houses h inner join owners o on o.id = h.owner_id inner join customers c inner join agencies a on
-- - 5. Клиенттердин 10-катарынан баштап 1999-жылдан кийин туулган 15 клиентти чыгар
select * from customers where date_of_birth >= '1999-01-01' offset 10 limit 15;
-- - 6. Рейтинги боюнча уйлорду сорттоп, уйлордун тайптарын, рейтингин жана уйдун ээлерин чыгар.(asc and desc)
select o.first_name,h.house_type,h.rating  from houses h inner join owners o on h.owner_id = o.id order by h.rating desc;
select o.first_name,h.house_type,h.rating  from houses h inner join owners o on h.owner_id = o.id order by h.rating asc;
-- - 7. Уйлордун арасынан квартиралардын (apartment) санын жана алардын баасынын суммасын чыгар.
select count(id) as count_apartment,sum(price) as summa from houses where house_type = 'Apartment';
-- - 8. Агентсволардын арасынан аты ‘My_House’ болгон агентсвоны, агентсвонын адресин жана анын бардык уйлорун, уйлордун адрессин чыгар.
select * from rent_info inner join agencies a on rent_info.agency_id = a.id
                        inner join addresses a2 on a.address_id = a2.id inner join houses h on a2.id = h.address_id where a.name = 'My_House';
-- - 9. Уйлордун арасынан мебели бар уйлорду, уйдун ээсин жана уйдун адрессин чыгар.
select * from houses h inner join addresses a on h.address_id = a.id inner join owners o on h.owner_id = o.id where h.furniture = 'true';
-- - 10.Кленти жок уйлордун баарын жана анын адрессин жана ал уйлор кайсыл агентсвога тийешелуу экенин чыгар.
select * from houses h inner join rent_info ri on h.id = ri.house_id inner join customers c on ri.customer_id = c.id inner join addresses a on h.address_id = a.id where  ri.customer_id is null;
-- - 11.Клиенттердин улутуна карап, улутуну жана ал улуутта канча клиент жашайт санын чыгар.
select nationality,count(id) from customers group by  nationality;
-- - 12.Уйлордун арасынан рейтингтери чон, кичине, орточо болгон 3 уйду чыгар.
select min(rating) from houses ;
select max(rating) from houses ;
select avg(rating) from houses ;
-- - 13.Уйлору жок киленттерди, клиенттери жок уйлорду чыгар.
select * from houses h inner join rent_info ri on h.id = ri.house_id inner join customers c on ri.customer_id = c.id where ri.customer_id is null;
select * from houses h inner join rent_info ri on h.id = ri.house_id inner join customers c on ri.customer_id = c.id where ri.customer_id not null;
-- - 14.Уйлордун бааларынын орточо суммасын чыгар.
select avg(price ) from houses;
-- - 15.‘A’ тамга менен башталган уйдун ээсинин аттарын, клиенттердин аттарын чыгар.
select * from owners a inner join rent_info ri on a.id = ri.owner_id inner join customers c on ri.customer_id = c.id where a.first_name ilike '%A';
-- - 16.Эн уйу коп owner_ди жана анын уйлорунун санын чыгар.
-- - 17.Улуту Kyrgyzstan уй-булолу customerлерди чыгарыныз.