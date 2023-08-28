/*Qual o departamento com maior número de pessoas? 
Quais são os departamentos por cidade? 
Relação de empregados por departamento?
*/
 show databases;
 use company_constraints2;
 show tables;
 --------------------------------------------------------
 -- Qual o departamento com maior número de pessoas? 
 select Dno, count(Ssn) from employee group by Dno order by Dno desc Limit 1;
 -- secundary index DNO
 alter table company_constraints2.employee add index index_Dno (Dno);
 
-- Quais são os departamentos por cidade? 
select Dnumber, Dlocation from dept_locations; 
 -- Não precisaria, mas poderia ser feito mum secundario com ambas colunas no caso de aumento dos dados exemplo: ' Create index idx_Dnumber_Docation on dept_locations(Dnumber, Dlocation) '
 
-- Relação de empregrados por departamento 
select Dname, count(Ssn) as Qtt_Employees from employee 
inner join department 
on Dno = Dnumber 
group by Dno 
order by Dno desc;
-- secundario com Dnumber e Dno, como o Dno ja foi criado precisamos apenas do Dnumber
alter table company_constraints2.department add index index_Dnumber (Dnumber);

select * from employee;
select * from department;

-------------------------------------------------------------------------

