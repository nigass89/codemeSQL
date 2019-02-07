-->>>>>>>>>>>>>>>>>>>>>>>>>>>>> DAY6
test



-->>>>>>>>>>>>>>>>>>>>>>>>>>>>> DAY 6.1
-- 3 najwyzsze zarobki do zwolnienia
delete from pracownicy where employee_id=(select employee_id from (SELECT employee_id FROM (SELECT * FROM pracownicy ORDER BY Salary desc) WHERE rownum <= 3 ORDER BY Salary) where rownum=1);


--z dwoch managerow z najmniejsza iloscia zrobic zespol i jednego z nich dac pod niego
select * from (select manager_id,count(*) from employees where manager_id is not null group by manager_id order by count(*)) where rownum<=2;
                                                                                                                        
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DAY 5                                                                                                                         
select employee_id,department_id,job_id from employees
intersect
select employee_id,department_id,job_id from job_history;

update employees set salary=8000 where employee_id=115;

select * from employees where employee_id=115;



create table pracownicy as (select * from employees); --kopia tabeli
create table prace as (select * from jobs);


update pracownicy set SALARY=SALARY+(SALARY*1.15) where commission_pct is null;

update pracownicy set employee_id=666 where first_name like 'Steven' and last_name like 'King';

update pracownicy set salary=8000 where employee_id=116 and salary<6000;

update pracownicy set inicialy=(SUBSTR(first_name,1,1)||'.'||SUBSTR(last_name,1,1))||'.';

update pracownicy set plec='M' where first_name not like '%a';

update pracownicy set phone_number='0048 '||REPLACE(phone_number, '.', ' ');


--zaszeregowanie - officer jesli zarobki wieksze niz srednie w departamencie
update pracownicy p set p.zaszeregowanie='non officer' where p.salary < (select avg(o.salary) from pracownicy o where p.department_id=o.department_id group by o.department_id);

delete from departamenty where manager_id is null;--departamenty bez pracownikow

--zwolnij drozsza polowe pracownikow z departamentu czlowieka o naziwsku Sully
update pracownicy set department_id='' where salary>(select avg(salary) from employees where department_id=(select department_id from employees where last_name like 'Sully'));

insert into pracownicy(employee_id,first_name,last_name,email,hire_date,job_id) values (207,'Antonii','Macierewicz','antoni@mon.gov.pl','05/09/30','GOD');



select manager_id,count(*) from employees group by manager_id order by manager_id desc;



commit;
rollback;
