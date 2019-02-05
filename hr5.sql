select employee_id,department_id,job_id from employees
intersect
select employee_id,department_id,job_id from job_history;

update employees set salary=8000 where employee_id=115;

select * from employees where employee_id=115;



create table pracownicy as (select * from employees); --kopia tabeli
create table historia_prac as (select * from job_history);


update pracownicy set SALARY=SALARY+(SALARY*1.15) where commission_pct is null;

update pracownicy set employee_id=666 where first_name like 'Steven' and last_name like 'King';

update pracownicy set salary=8000 where employee_id=116 and salary<6000;



commit;
rollback;