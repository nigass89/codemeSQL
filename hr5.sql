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

delete from  where location_id=(select d.location_id from departments d, employees e where not d.department_id=e.department_id group by d.department_id);--departamenty bez pracownikow

select d.department_id from departments d, employees e where d.department_id=e.department_id group by d.department_id;

select * from locations where location_id in (select location_id from locations); --miasta bez departamentow

--zwolnij drozsza polowe pracownikow z departamentu czlowieka o naziwsku Sully
update pracownicy set department_id='' where salary>(select avg(salary) from employees where department_id=(select department_id from employees where last_name like 'Sully'));

insert into pracownicy(employee_id,first_name,last_name,email,hire_date,job_id) values (207,'Antonii','Macierewicz','antoni@mon.gov.pl','05/09/30','GOD');



select manager_id,count(*) from employees group by manager_id order by manager_id desc;



commit;
rollback;