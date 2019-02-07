-- 3 najwyzsze zarobki do zwolnienia
delete from pracownicy where employee_id=(select employee_id from (SELECT employee_id FROM (SELECT * FROM pracownicy ORDER BY Salary desc) WHERE rownum <= 3 ORDER BY Salary) where rownum=1);


--z dwoch managerow z najmniejsza iloscia zrobic zespol i jednego z nich dac pod niego
select * from (select manager_id,count(*) from employees where manager_id is not null group by manager_id order by count(*)) where rownum<=2;
