

/******** FUN-1 get total purchese of customer*******/
use Book_Store
go
CREATE FUNCTION fnGetCustomerPurchese (@Id_num int)
RETURNS @t table (CID int,id int,Book_name varchar(50))
BEGIN
insert into @t
select P.CID , B.BOOK_ID, B.BOOK_title
FROM Book AS B JOIN Purchases AS P ON B.BOOK_Id=P.BOOK_ID 
where @Id_num=CID
RETURN
END
go
SELECT * FROM dbo.fnGetCustomerPurchese (1)
/***************** FUN-2 get emplyees info by maneger**********************/
use Book_Store
go
CREATE FUNCTION fnGetEmplyeee (@Id_num int)
RETURNS @t table (id int,STAFF_name varchar(50))
BEGIN
insert into @t
select S.S_id,S.STAFF_name
FROM Staff_emplyees AS S JOIN Branch AS B ON B.BRANCH_id=S.BRANCH_id 
where B.BRANCH_manager_id=@Id_num
RETURN
END
go
SELECT * FROM dbo.fnGetEmplyeee (5)
/******************* FUN-3 get number of books in some branch**************************/

CREATE FUNCTION fnBranchNBooks(@bnum int)
   RETURNS int
      BEGIN
         DECLARE @Nbooks int
         SELECT @Nbooks = COUNT(BOOK_ID)
         FROM BRANCH_BOOK_COPIES 
         WHERE BRANCH_NUM = @bnum
         RETURN @Nbooks
  
     END
	 select * from BRANCH_BOOK_COPIES

 print(dbo.fnBranchNBooks(2))

/*************************** fun-4 to get the number of spicfied book from a branch ***************************/
CREATE FUNCTION BranchCopiesOfABook(@branchId int, @BID int)
RETURNS int
BEGIN
	declare @nocopies int 
	select @nocopies = COPIES
	from BRANCH_BOOK_COPIES
	where @BID=BOOK_ID and @branchId =BRANCH_NUM
	return @nocopies
END

select dbo.BranchCopiesOfABook(3, 18);
select dbo.BranchCopiesOfABook(1, 18);
/*************************** fun-6  get books from branch ***************************/
CREATE FUNCTION fnBranchBooks(@bnum int)
    RETURNS table
    AS
       RETURN
       (
        SELECT B.BOOk_Id, B.BOOK_title,B.BOOK_price, B.BOOK_publisherName, C.COPIES
        FROM Book B, BRANCH_BOOK_COPIES C
        WHERE B.BOOK_Id = C.BOOK_ID AND C.BRANCH_NUM = @bnum
        
       )
  
select * from dbo.fnBranchBooks(3);
/***********************fun-7*****************************/
CREATE FUNCTION fnIsAvailable(@bname varchar(50))
   RETURNS bit
      BEGIN
         DECLARE @found bit
         IF (@bname = ANY(select BOOK_title
                          from Book))
         SET @found = 1
         ELSE
         SET @found = 0
         RETURN @found 
      END
















/*********purchuse trriger using try catch ***************/
CREATE TRIGGER TInsertPurchase
ON Purchases
INSTEAD OF insert
AS
BEGIN
	DECLARE @BID int
	DECLARE @BRID int;

	select @BID = i.BOOK_ID
	from inserted as i
	select @BRID = i.BRANCH_ID
	from inserted as i
	if (dbo.BranchCopiesOfABook(@BRID, @BID) > 0)
		BEGIN
		update BRANCH_BOOK_COPIES
		set COPIES = COPIES - 1
0		where BRANCH_NUM = @BRID and BOOK_ID = @BID;
		END
	else
		BEGIN
		DECLARE @CRID int
		DECLARE @BN varchar(20)

		select @CRID = i.CID
		from inserted as i

		select @BN = b.title
		from Books b
		where b.BOOK_Id = @BID
		Begin try
				insert into requst 
				(CID,book_name)
				values
				(@CRID, @BN)
		End try
		begin catch
			
		end catch

	
		END
	
END















/*############### PRO-1 to add a new request #####################*/
create procedure newRequest
 @CUS_ID INT ,
 @Book_num Varchar(50),
 @Expected_arrival_date date
as
begin 
insert into requst 
values(@CUS_ID,@Book_num,@Expected_arrival_date)
end 
/***************************/
select *from requst
execute DBO.newRequest @CUS_ID=2,@Book_num='the orgin of',@Expected_arrival_date='2023-01-30'
select *from requst











/******************PRO-1 to rate the emplyees*********************/
use Book_Store
go
select procedure RateStaffMember
 @Staff_ID INT ,
 @New_rate INT 
as

begin 
update  Staff_emplyees
set  RATE=@New_rate where S_id=@Staff_id
select *from Staff_emplyees
end 


go
execute DBO.RateStaffMember @Staff_ID=3,@New_rate=6
go
select * from Staff_emplyees
/*##########TRI-2 to decline the salary of the emplyee ########*/
create trigger RateMember
on Staff_emplyees
after update
as 
begin 
    declare @Rate int;
	declare @staff_id int;
	select @Rate=i.RATE,@staff_id=i.S_id
	from inserted i;
	if @Rate<=3
	  update Staff_emplyees  set SALARY=SALARY-100 where @staff_id=S_id;
end
GO
select *from Staff_emplyees
go
execute DBO.RateStaffMember @Staff_ID=3,@New_rate=3
execute DBO.RateStaffMember @Staff_ID=6,@New_rate=4
go
select *from Staff_emplyees
/*********************************************/















			/*###################################################*/

/***************************************************trnasction***************************************************************/
begin try 
	begin transaction 

	INSERT Staff_emplyees (STAFF_name, SALARY, AGE,Branch_id, SINCE,LEADER_id)
	values ('mohamed zakarya',2000,18,5,'2022-12-30',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta')),
			('Khaled Ali',2000,32,5,'2022-12-28',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta')),
			('Israa ELgamal',2000,22,7/*here is an error */,'2023-01-02',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta'))

	commit
end try
begin catch
	rollback
end catch



SELECT *
FROM

begin try 
	begin transaction 

	INSERT Staff_emplyees (STAFF_name, SALARY, AGE,Branch_id, SINCE,LEADER_id)
	values ('mohamed zakarya',2000,18,5,'2022-12-30',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta')),
			('Khaled Ali',2000,32,5,'2022-12-28',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta')),
			('Israa ELgamal',2000,22,7/*here is an error */,'2023-01-02',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta'))

	commit
end try
begin catch
	rollback
end catch


/*###############  4    A VIEW TO SHOW TOP BOOKS RECOMENDED FOR CUSTOMERS       ####################################*/

create view Top_Books as 
select*,
CASE
 when BOOK_Rate>=8 THEN 'RECOMENDED'
 when BOOK_Rate between 5 and 8 then 'medium rate'
 ELSE 'NOT RECOMENDED'
 END AS 'book_Recomendation'
from Book 


select *
from Top_Books




/*create view to find branch name total salary city ,street */

create view total_salaries_to_branchs as 
select b.BRANCH_name,b.BRANCH_rate, sum(s.SALARY)  as TES,(b.BRANCH_city  +'   ' + b.BRANCH_street) as branch_address,
CASE
 when b.BRANCH_rate>=6 THEN 'good performance'
 when b.BRANCH_rate between 4 and 5 then ' need to improve'
 ELSE ' Useless  branch'
 END AS 'branch performance'
from Branch b, Staff_emplyees s 
where b.BRANCH_id = s.Branch_id
group by b.BRANCH_rate,b.BRANCH_name, b.BRANCH_id,b.BRANCH_city ,b.BRANCH_street


select *
from total_salaries_to_branchs








/*   view  names of the employees how works in  some branch, whose rating is more than 5,  and show their salaries
									 giving the one, how have higer rate (a bonous)   */

create view giving_Bonous as 

select staff.STAFF_name,Staff.RATE ,B.BRANCH_rate , Staff.SALARY,

case 
when Staff.RATE>7  then 'have a bonous'  
ELSE 'have no bonous'
end as 'bonous'


from Staff_emplyees as Staff ,Branch as  B  
where B.BRANCH_rate>5 and Staff.BRANCH_id=B.BRANCH_id
group by Staff.SALARY ,staff.STAFF_name,B.BRANCH_rate,Staff.RATE

 


select *
from giving_Bonous
 








/*#####################*/

/*********************************************************************************************************************/

/*    Query (1)     GIVES A bounus to the managers of branches which gives rating more than 5 = 500 LE*/


select B.BRANCH_manager_id  ,  S.STAFF_name , (S.SALARY+500) as new_salary 
from Branch B,Staff_emplyees as S
WHERE B.BRANCH_rate>5 AND B.BRANCH_id=S.S_id



SELECT*
FROM Branch
			/*###################################################*/





/*   Query (2) for some customer needs  TO show phones of "dar elnashr" publisher  */

select *
from Publisher_phone
where PUBLISHER_name like'D%' or PUBLISHER_name like'%nashr%'


/*###################################################*/




/*   Query (3)  NEW branch is opened needs for employees and for manager vacancy from the old employees who has the higest rating and not a manager */

insert into Branch (BRANCH_name,BRANCH_city,BRANCH_street,BRANCH_phone,BRANCH_manager_id)
values ('South delta','Tanta','stadium street','040355221',(SELECT ST.S_id 
															FROM Staff_emplyees as ST
															WHERE ST.RATE=(select TOP(1) S.RATE from Staff_emplyees as S  WHERE   S.S_id<>S.LEADER_id   group by S.RATE ORDER BY S.RATE DESC)))


SELECT S_id,STAFF_name,RATE,LEADER_id
FROM Staff_emplyees



INSERT Staff_emplyees (STAFF_name, SALARY, AGE,Branch_id, SINCE,LEADER_id)
values ('mohamed zakarya',2000,18,5,'2022-12-30',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta'))

INSERT Staff_emplyees (STAFF_name, SALARY, AGE,Branch_id, SINCE,LEADER_id)
	values	('Khaled Ali',2000,32,6,'2022-12-28',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta'))

INSERT Staff_emplyees (STAFF_name, SALARY, AGE,Branch_id, SINCE,LEADER_id)
		values('Israa ELgamal',2000,22,7,'2023-01-02',(select B.BRANCH_manager_id FROM Branch B WHERE B.BRANCH_name='South delta'))


SELECT *
FROM Staff_emplyees

SELECT *
FROM Branch

	/*###################################################*/



/*   Query (4)  Find the names of all employees who have a higher salary than some employee that has a salary <=2000 LE */

select distinct SE.STAFF_name,SE.SALARY 
from Staff_emplyees as SE, Staff_emplyees as S 
where SE.SALARY >2000 AND S.SALARY>(SELECT TOP(1) SE.SALARY FROM Staff_emplyees as SE ORDER BY SE.AGE ASC ) 


select * 
from Staff_emplyees

/*###################################################*/




/*  *************** Query (5)  how bought in some date and how much  did he/she  purchased *****************************/

select  distinct  C.CUSTOMER_ID , sum(B.BOOK_price) as payed
from Customer as C , Purchases as P , Book AS B
where month(p.Purchase_DATE_time) ='10' and C.CUSTOMER_ID=P.CID and P.BOOK_ID=B.BOOK_Id
GROUP BY C.CUSTOMER_ID



select p.CID , p.BOOK_ID ,b.BOOK_price 
from Customer  c , Purchases p  , Book b
where p.CID=c.CUSTOMER_ID and p.BOOK_ID=b.BOOK_Id and month(p.Purchase_DATE_time)='10'
order by p.CID

/*###################################################*/
 select * from Book
select * from Book_authors
 /*****************books of the author************/
 alter procedure author_name
 @name varChar(20)
as
begin 
select COUNT(*) from Book_authors as A join Book as B on A.BOOK_id=B.BOOK_Id
WHERE A.AUTHOR_Name='julius'
group by  A.AUTHOR_Name
end 
execute author_name @name='juliuse'