--declare
begin
dbms_output.put_line('I like PLSQL');
end;
/
set serveroutput on;


declare
x number;
begin
dbms_output.put_line('I like PLSQL');
dbms_output.put_line('Value of x is: ' || x);
end;

----star pattern by using PLSQL
DECLARE
-- declare variable n,
--I AND J of datatype number
N NUMBER := 7;
I NUMBER;
J NUMBER;
BEGIN
-- loop from 1 to n
FOR I IN 1..N
LOOP
	FOR J IN 1..I
	LOOP
	DBMS_OUTPUT.PUT('*') ; -- printing *
	END LOOP;
	DBMS_OUTPUT.NEW_LINE; -- for new line
END LOOP;
END;

--number into words
DECLARE

	-- declare variable are num, num_to_word, str, len, c
	-- and in above declare variable num, len, c are integer datatype
	-- and num_to_word and str are varchar datatype
	num		 INTEGER;
	num_to_word VARCHAR2(100);
	str		 VARCHAR2(100);
	len		 INTEGER;
	c		 INTEGER;
BEGIN
	num := 123456;

	len := Length(num);

	dbms_output.Put_line('Entered Number is: '
						||num);

	FOR i IN 1..len LOOP
		c := Substr(num, i, 1);

		SELECT Decode(c, 0, 'Zero ',
						1, 'One ',
						2, 'Two ',
						3, 'Three ',
						4, 'Four ',
						5, 'Five ',
						6, 'Six ',
						7, 'Seven ',
						8, 'Eight ',
						9, 'Nine ')
		INTO str
		FROM dual;

		num_to_word := num_to_word
					||str;
	END LOOP;

	dbms_output.Put_line('Number to words: '
						||num_to_word);
END;


--
--number into words
DECLARE

	-- declare variable are num, num_to_word, str, len, c
	-- and in above declare variable num, len, c are integer datatype
	-- and num_to_word and str are varchar datatype
	num		 INTEGER;
	num_to_word VARCHAR2(100);
	str		 VARCHAR2(100);
	len		 INTEGER;
	c		 INTEGER;
BEGIN
	num := 123456;

	len := Length(num);

	dbms_output.Put_line('Entered Number is: '
						||num);

	FOR i IN 1..len LOOP
		c := Substr(num, i, 1);

		SELECT Decode(c, 0, 'Zero ',
						1, 'One ',
						2, 'Two ',
						3, 'Three ',
						4, 'Four ',
						5, 'Five ',
						6, 'Six ',
						7, 'Seven ',
						8, 'Eight ',
						9, 'Nine ')
		INTO str
		FROM dual;

		num_to_word := num_to_word
					||str;
	END LOOP;

	dbms_output.Put_line('Number to words: '
						||num_to_word);
END;
--
/*  GCD of two numbers with anonymous block using plsql
*/

create or replace function lcm(num1 in number, num2 in number) return number is
begin
return (num1*num2)/gcd(num1,num2);
* end;

select lcm(64,40) from dual;
--
/* Factorial number
*/

Declare  
num   number:= #  
fact number:= 1;  
temp number;  
begin  
  temp := num;  
   while (num > 0)
loop
    fact := fact * num;  
    num   := num - 1;  
end loop;
  Dbms_Output.Put_line('factorial of ' || temp ||  '  is ' || fact);  
end;
-----
SET SERVEROUTPUT ON;

-- statements between THEN and END IF run if and only if the value of sales is greater than quota+200.
DECLARE 
    quota number;
    sales number;
BEGIN 
    sales := 10100;
    quota := 10000;
    IF sales > (quota+200) THEN 
      DBMS_OUTPUT.PUT_LINE( 'Sales Quota Reaches' ); 
    END IF; 
END;

--statement between THEN and ELSE runs if and only if the value of sales is greater than quota+200; otherwise, the statement between ELSE and END IF runs.
DECLARE 
    quota number;
    sales number;
BEGIN 
    sales := 10100;
    quota := 10000;
    IF sales > (quota+200) THEN 
      DBMS_OUTPUT.PUT_LINE( 'Sales Quota Reached' ); 
    ELSE
    DBMS_OUTPUT.PUT_LINE( 'Sales Quota not Reached' );
    END IF;
END;

--statement between THEN and ELSE runs if and only if the value of sales is greater than quota+200; otherwise, Nested IF THEN ELSE Statements run.
DECLARE 
    quota number;
    sales number;
BEGIN 
    sales := 10100;
    quota := 10000;
    IF quota >= 10000 THEN 
        IF sales > (quota+200) THEN 
            DBMS_OUTPUT.PUT_LINE( 'Sales Quota Reached' ); 
        ELSE
            DBMS_OUTPUT.PUT_LINE( 'Sales Quota not Reached' );
        END IF;
    ELSIF quota < 10000 THEN
        DBMS_OUTPUT.PUT_LINE( 'Quota is less than 10000' );
    ELSE
        DBMS_OUTPUT.PUT_LINE( 'Quota should be greater than 10000' );
    END IF;
END;

/*
if supplier_name field is IBM and the supplier_type field is Hardware, then the CASE statement
will return to the North office. If the supplier_name field is IBM and the supplier_type is Software, the CASE statement will return to the South office.
*/
DECLARE
  supplier_name  VARCHAR2(20) := 'IBM';
  supplier_field VARCHAR2(20) := 'Software';
BEGIN
    IF supplier_name = 'IBM' THEN
        CASE supplier_field
            WHEN 'Hardware' THEN
                DBMS_OUTPUT.PUT_LINE('IBM: North Office');
            WHEN 'Software' THEN
                DBMS_OUTPUT.PUT_LINE('IBM: South Office');
            ELSE
                DBMS_OUTPUT.PUT_LINE('No Such Supplier Field');  
        END CASE;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No Such Supplier Name');
    END IF;
END;

--for loop to retrieve all the data from table 'BANKACCOUNT'.
Declare
--type <TypeName> is varray(size) of <datatype>
    type customerNameList is varray(10) of varchar2(20);
    type bankAccountList is varray(10) of number;
    accountNumber bankAccountList;
    customerName customerNameList;
begin
    select customername, bankaccountnumber bulk collect into customerName, accountNumber from bankaccount; --table name is bankaccount
    for i in 1..accountNumber.count loop
        dbms_output.put_line('Customer Name: '||customerName(i)||', Bank Account Number: '||accountNumber(i));
    end loop;
end;

--While loop to retrieve all the data from table 'BANKACCOUNT'.
Declare
    TYPE customerNameList IS TABLE OF VARCHAR2(20);
    TYPE bankAccountList IS TABLE OF number;
    accountNumber bankAccountList;
    customerName customerNameList;
    a INTEGER := 1;
begin
    select customername, bankaccountnumber bulk collect into customerName, accountNumber from bankaccount;
    WHILE a<=accountNumber.count LOOP
        dbms_output.put_line('Customer Name: '||customerName(a)||', Bank Account Number: '||accountNumber(a));
        a := a+1;
    END LOOP;   
end;


--Inserting and get table
insert into bankaccount values('ppm',876345955);

SELECT * FROM bankaccount;






------


SET SERVEROUTPUT ON;

-- Bank Data retrieval by Varray
Declare
--type <TypeName> is varray(size) of <datatype>
    type bankAccountList is varray(10) of number;
    accountNumber bankAccountList;
begin
    select bankaccountnumber bulk collect into accountNumber from bankaccount;
    dbms_output.put_line(accountNumber(1));
end;


--Bank Data retrieval by Nested Table
Declare
/*
TYPE type_name IS TABLE OF element_type [NOT NULL]; 
table_name type_name;
*/
TYPE name_table IS TABLE OF varchar2(20);
TYPE accNumber_table IS TABLE OF number;
c_names name_table;
accNumber accNumber_table;
total integer;
begin
    c_names := name_table('Prachi Mohanty', 'prachi');
    accNumber := accNumber_table(563765365, 865484746);
    total := c_names.count; --collections method
    FOR i IN 1 .. total 
    LOOP 
      dbms_output.put_line('Customer Name: '||c_names(i)||', Bank Account Number:' || accNumber(i)); 
   end loop; 
end;

--Bank Data retrieval (Already created table 'BANKACCOUNT') by Nested Table
Declare
TYPE bankAccountList IS TABLE OF number;
accNumber bankAccountList;
begin
    select bankaccountnumber bulk collect into accNumber from bankaccount;
    dbms_output.put_line(accNumber(2));
end;

--Using index by table
declare
    TYPE accNumberList IS TABLE OF NUMBER INDEX BY VARCHAR2(20); 
    accNumber accNumberList;
    indexValue varchar2(50);
begin
    accNumber('rajesh') := 431345364;
    accNumber('sirsha') := 395465344;
    indexValue := accNumber.first;
    dbms_output.put_line(accNumber('Rajesh'));
    for i in 1..accNumber.count
    loop
        dbms_output.put_line(indexValue);
        indexValue := accNumber.next(indexValue);
    end loop;
end;
    