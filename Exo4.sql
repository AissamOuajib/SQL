-- Exercice1 -----------
DECLARE 
    num1 int := 15;
    num2 int := 30;
    tmp_num int;
BEGIN
    dbms_output.put_line('Les valeurs des deux nombres avant la permutations sont : number1 = ' || num1 || ' , number2 = ' || num2 );
    tmp_num := num1;
    num1 := num2;
    num2 := tmp_num;
    dbms_output.put_line('Les valeurs des deux nombres aprés la permutations sont : number1 = ' || num1 || ' , number2 = ' || num2 );
END;
-- Exercice2 -------------
DECLARE 
    v_a int := 10;
    factoriel int := 1;
BEGIN
    WHILE v_a > 1 LOOP 
    factoriel := factoriel * v_a;
    v_a := v_a -1;
    END LOOP;
    dbms_output.put_line('Factoriel de 10 est ' || factoriel);
END;
-- Exercice3 --------------
DECLARE
 max_num int :=0;
BEGIN
    select max(department_id)+10 into max_num from departments;
    insert into departments(department_id,department_name,manager_id,location_id) values(max_num,'New Department',280,2000);

END;

-- Exercice4 -------------

DECLARE
 max_id int :=0;
BEGIN
    select max(department_id) into max_id from departments;
    dbms_output.put_line('La grand valeur des departments is est : ' || max_id);

END;

-- Exercice5 --------------

DECLARE
 line_added departments%ROWTYPE;
 max_id int := 0;
BEGIN
    select max(department_id) into max_id from departments;
    select * into line_added from departments where department_id = max_id;
    dbms_output.put_line('Les infromations de ligne ajoutés sont : department_id = ' || to_char(line_added.department_id) || ' department_name = ' || to_char(line_added.department_name) || ' Manager_id = ' || to_char(line_added.manager_id) || ' Location_Id = ' || to_char(line_added.location_id)) ;

END;

-- Exercice6 ---------------

DECLARE
 max_id int := 0;
BEGIN
    select max(department_id) into max_id from departments;
    update departments 
    set department_id = 2500 where department_id = max_id;
    dbms_output.put_line(sql%rowcount);
END;

-- Exercice7 ------------------

accept last_name varchar(50) prompt 'Veuillez saisir last name: ';
DECLARE
 v_last_name varchar(50) := '&last_name';
 v_manager_id int := 0;
BEGIN
    select manager_id into v_manager_id from departments where last_name = v_last_name;
    dbms_output.put_line('Manager Id : ' || v_manager_id);
END;

-- Exercice8 ----------------

DECLARE
v_empno employees.employee_id%TYPE;
v_ename employees.last_name%TYPE;
v_ehiredate employees.hire_date%TYPE;

CURSOR employee_cursor IS
SELECT employee_id, last_name, hire_date
FROM employees
ORDER BY hire_date DESC;
BEGIN
OPEN employee_cursor;
LOOP
FETCH employee_cursor INTO v_empno, v_ename, v_ehiredate;
EXIT WHEN employee_cursor%ROWCOUNT > 10 OR
employee_cursor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE ('ID : ' || TO_CHAR(v_empno)
||' Name : '|| v_ename || ' HireDate :' || v_ehiredate);

END LOOP;
CLOSE employee_cursor;

END ;

-- Exercice9 ------------
declare
employee_count int :=0;
begin 
    select count(employee_id) into employee_count from employees where department_id = 30;
    dbms_output.put_line('Nombre des emplyees dans departement 30 est : ' || employee_count);
end;
-- Exercice10 ----------------

declare 
v_salary employees.salary%type;
v_last_name employees.last_name%type;
v_first_name employees.first_name%type;
v_employee_id employees.employee_id%type;
cursor employees_cursor is select employee_id,first_name, last_name, salary from employees;
begin
    open employees_cursor;
    loop
    fetch employees_cursor into v_employee_id,v_first_name,v_last_name,v_salary;
    if v_salary<3000 
    then 
    update employees 
    set salary = v_salary + 500
    where employee_id = v_employee_id;
    dbms_output.put_line(v_first_name || ' ' || v_last_name || '''' || 's salary updated');
    else 
    dbms_output.put_line(v_first_name || ' ' || v_last_name || ' earns ' || v_salary);
    end if;
    exit when employees_cursor%notfound;
    end loop;
    close employees_cursor;
end;

-- Exercice 11 --------------------
-------------Part1--------------
-- 1)   
select NomS, Horaire from Salle where titre = 'Les misérables'
-- 2)
select acteur from Film 
group by acteur 
having  count(Titre) = (select count(titre) from Film);
-- 3)
select spectateur from Vu v group by spectateur 
having count(titre) = (select count(titre) from Aime where v.spectateur = Amateur);
-------------Part2-------------------
declare 
n_film int =: 0;
v_realisateur Producteur.Producteur%TYPE;
cursor realisateurs_cursor is select distinct Realisateur from realisateur;
begin
    open realisateurs_cursor;
    if realisateurs_cursor%notfound
    then 
    dbms_output.put_line('Pas de films disponibles !!');
    else 
    loop
        fetch realisateurs_cursor into v_realisateur;
        select count(Titre) into n_film from Film f1 where exists(select * from Film f2 where f1.realisateur = f2.realisateur);
        dbms_output.put_line('Le réalisateur :' || v_realisateur || ' à réalisé ' || n_film || 'films ');
    exit when realisateurs_cursor%notfound;
    end loop;
    end if;
    
end;


