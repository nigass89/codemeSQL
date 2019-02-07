-- 3 najwyzsze zarobki do zwolnienia
delete from pracownicy where employee_id=(select employee_id from (SELECT employee_id FROM (SELECT * FROM pracownicy ORDER BY Salary desc) WHERE rownum <= 3 ORDER BY Salary) where rownum=1);


--z dwoch managerow z najmniejsza iloscia zrobic zespol i jednego z nich dac pod niego
select * from (select manager_id,count(*) from employees where manager_id is not null group by manager_id order by count(*)) where rownum<=2;

--zwolnij drozsza polowe pracownikow z departamentu czlowieka o naziwsku Sully
update pracownicy set department_id='' where salary>(select avg(salary) from employees where department_id=(select department_id from employees where last_name like 'Sully'));

--tworzenie widoku
create view prac_dep as select e.first_name, e.last_name, d.department_name from employees e, departments d where e.department_id=d.department_id;

create view suma_plac as select d.department_name, sum(e.salary) from departments d, employees e where d.department_id=e.department_id group by d.department_name;

create view bez_danych_os as select employee_id, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, plec, inicialy, zaszeregowanie from pracownicy;

create view anon_emp_dept as select b.employee_id, b.phone_number, b.hire_date, b.job_id, b.salary, b.commission_pct, b.manager_id,b.department_id, b.plec, b.inicialy, b.zaszeregowanie, d.department_name, d.location_id from bez_danych_os b, dept_anon d where b.department_id=d.department_id;

select * from anon_emp_dept;

--refresh
begin dbms_mview.refresh('widoczek2'); end; 
/

create materialized view widoczek2 as select l.city, c.country_name, r.region_name from lokalizacje l, kraje c, regiony r where l.country_id=c.country_id and c.region_id=r.region_id;

delete from regiony where region_id=3;

drop materialized view widoczek;

rollback;
