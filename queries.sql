use rand;

select * from physician;

select * from person;

#---------------------Drop All---------------

drop table works_in cascade;
drop table schedules cascade;
drop table out_patient cascade;
drop table in_patient cascade;
drop table responsible cascade;
drop table physician cascade;
drop table patient cascade;
drop table volunteer cascade;
drop table nurse cascade;
drop table staff cascade;
drop table technician cascade;
drop table laboratory cascade;
drop table visits cascade;
drop table if exists person_emp_info; 
drop table employee cascade;
drop table person cascade;
#i)>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Person Table(5)<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

create table person(p_id int primary key,name varchar(60) NOT NULL,bdate date NOT NULL,ph_no bigint check (length(ph_no)=10 and ph_no BETWEEN 1000000000 and 9999999999) NOT NULL,
st_address varchar(255) NOT NULL,city varchar(60) NOT NULL,state varchar(60) NOT NULL,zipcode bigint check(length(zipcode)=5) NOT NULL);
#1.Physician Table

create table physician(pager_no varchar(10) primary key,p_id int,FOREIGN KEY(p_id) REFERENCES person(p_id),specialization varchar(255));
#2.Patient Table

create table patient(patient_id varchar(30) primary key,p_id int,FOREIGN KEY (p_id) REFERENCES person(p_id),patient_type varchar(255) );
#3.Volunteer table

create table volunteer(p_id int,FOREIGN KEY (p_id) REFERENCES person(p_id),skills varchar(255) NOT NULL );


create table responsible(pager_no varchar(10),foreign key(pager_no) references physician(pager_no),patient_id varchar(255) references patient_id(patient));

#ii)>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Employee table(6)<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#drop table employee;
create table employee(emp_id int primary key,job_type varchar(255),date_hired date ,p_id int,foreign key(p_id) references person(p_id));
#1.Nurse table
#drop table nurse;
create table nurse(emp_id int,foreign key(emp_id) references employee(emp_id),certificate varchar(255));
#2.Staff table----Reciptionist Anesthesiologist Physician assistant Information technology specialist-----------------
#drop table staff;
create table staff(emp_id int,foreign key(emp_id) references employee(emp_id),job_class varchar(255));
#3.Technician table
#drop table technician;
create table technician(emp_id int,foreign key(emp_id) references employee(emp_id),skills varchar(255));
#4.Laboratory table
#drop table laboratory;
create table laboratory(lab_name varchar(255) primary key,location varchar(255));
#5.Works in relation table(Technician<-> Laboratory)
#drop table works_in;
create table works_in(lab_name varchar(255) references laboratory(lab_name),emp_id int references technician(emp_id));

#ii)>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Patient Subclass and Generalization tables(6)<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#inpatient Table
create table in_patient(patient_id varchar(30),foreign key(patient_id) references patient(patient_id),date_admitted date);


#Outpatient Table
create table out_patient(patient_id varchar(30),foreign key(patient_id) references patient(patient_id));

#visits Table
create table visits (patient_id varchar(30),foreign key(patient_id) references out_patient(patient_id),date date NOT NULL,comments varchar(255));
#--------------------Inserting values in person table---------------------

INSERT INTO person VALUES (100, "Jonathan","1984-04-26",9434344343,"2103 Peck Street","Newport","New Hampshire",33773); #inpatient
INSERT INTO person VALUES (101, "Thomas","1975-04-26",4233852576,"3784 Public Works Drive","Chattanooga","Tennessee",37408); #phy
INSERT INTO person VALUES (102, "Kevin","1988-03-19",7205408641,"2618 Clay Lick Road","Westminster","Colorado",80030); #nurse
INSERT INTO person VALUES (103, "Smith" ,"1999-01-15",9062332635,"2966 Railroad Street","Escanaba","Michigan",49829); #phy
INSERT INTO person VALUES (104, "Odessa" ,"1982-08-29",4197783228,"1786 Hill Street","Celina","Ohio",45822); #phy
INSERT INTO person VALUES (105, "George" ,"1993-04-12",9434344343,"4321 Charles Street","Plymouth","Michigan",48170); #phy
INSERT INTO person VALUES (106, "Kathryn" ,"1968-06-22",2094893732,"4321 Charles Street","Plymouth","Michigan",48170); #inpatient 
INSERT INTO person VALUES (107, "Steve" ,"1972-03-04",5732324921,"388 Oral Lake Road","New Market","Minnesota",55054); #outpatient
INSERT INTO person VALUES (108, "Steve" ,"1994-12-03",9424344343,"240 Emerson Road","Shreveport","Louisiana",71101); #nurse
INSERT INTO person VALUES (109, "Betty" ,"1987-03-12",4253852576,"2294 Worley Avenue","Charlottesville","Virginia",22903); #staff
INSERT INTO person VALUES (110, "Laura" ,"1997-05-25",5732324921,"4952 Braxton Street","Vernon Hills","Illinois",60061); #staff
INSERT INTO person VALUES (111, "Jones" ,"1994-04-15",4198783228,"4521 Ridge Road","Girard","Kanses",66743); #staff
INSERT INTO person VALUES (112, "Mike" ,"1985-03-18",7205438641,"3260 Twin Oaks Drive","Brethren","Michigan",49619); #staff
INSERT INTO person VALUES (113,"Natalie M Ramos","1999-12-15",5403725342,"1124 Hurry Street","Fredericksburg","Virginia",22401); #phy volunteer d
INSERT INTO person VALUES(114,"Erin G Williams","1994-04-23",7038248006,"4558 Perine Street","Arlington","Virginia",22206); #tech
INSERT INTO person VALUES(115,"Claude R Stephens","1961-08-23",8046088524,"2143 Biddie Lane","Richmond","Virginia",23228); #outpatient
INSERT INTO person VALUES(116,"Saul H Emanuel","1977-02-06",7032991048,"1099 Lawman Avenue","Alexandria","Virginia",22301); #tech
INSERT INTO person VALUES(117,"Kathleen A Brungardt","1956-12-23",4349475946,"3181 North Street","Lynchburg","Virginia",24504);#inpatient
INSERT INTO person VALUES(118,"Gwenda M Murphy","1982-11-28",7573661021,"1541 Pinchelone Street","Virginia Beach","Virginia",23464); #nurse
INSERT INTO person VALUES(119,"Earleen C Moore","1980-12-31",7865068486,"4790 Rinehart Road","DULLES","Virginia",20101); #staff
INSERT INTO person VALUES(120,"Celeste","1981-11-05",7572000212,"4226 Kildeer Drive","Norfolk","Virginia",23502); #outpatient volunteer d
INSERT INTO person VALUES(121,"Irene F Parks","1982-09-10",9178099436,"1139 Settlers Lane","DULLES","Virginia",20101); #nurse
INSERT INTO person VALUES (122,"Robert","1980-12-12",8033826534,"3412 Brooklyn Street","Edinburg","Virginia",22824);  #phy volunteer
INSERT INTO person VALUES (123,"Benjamin","1993-04-03",9213816534,"2129 Bear Drive","Dulles","Virginia",20103);   #patient-out 
INSERT INTO person VALUES (124,"Henry","1991-12-05",8046916534,"4477 Fleming Way","Richmond","Virginia",23222); #patient-in vol
INSERT INTO person VALUES (125,"James","1965-07-07",7013516534,"623 Armory Road","Dulles","Virginia",20102);    #staff
INSERT INTO person VALUES (126,"Doris","1994-05-02",6375216534,"1122 Melody Lane","Richmond","Virginia",22034);   #phy
INSERT INTO person VALUES (127,"Cathy D Jernigan","1985-10-10",8043706534,"927 Fleming Way","Chester","Virginia",23821); #nurse
INSERT INTO person VALUES (128,"Tonya","1985-03-06",6789816534,"6021 Oral Lane","Dulles","Virginia",20102);    #nurse
INSERT INTO person VALUES (129,"Yoshie","2000-05-05",9703016534,"2482 Queens Lane","Fork Union","Virginia",23055); #nurse
INSERT INTO person VALUES (130,"Sylvester","1993-08-05",6738456789,"4739 Patterson Street","Dulles","Virginia",20101);#patient-out vol
INSERT INTO person VALUES (131,"Michael","1990-10-12",5780932121,"6021 Oral Lane","Dulles","Virginia",20102);  #staff
INSERT INTO person VALUES (132,"Samuel","1983-04-06",5408437557,"63890 Meadowview Drive","Luray","Virginia",22835); #patient-in
select * from person;
#--------------------Inserting values in Physician table-------------
INSERT INTO physician VALUES (1122334455,101,"ENT");
INSERT INTO physician VALUES (6732627754,103,"Anesthesiology"); 
INSERT INTO physician VALUES (3581285987,104,"ENT");
INSERT INTO physician VALUES (2481234567,105,"Dermatology"); 
INSERT INTO physician VALUES (2984903563,122,"Neurology"); 
INSERT INTO physician VALUES (1446323000,123,"Pediatrics"); 
INSERT INTO physician VALUES (5725672579,122,"ENT");  #phy volunteer
INSERT INTO physician VALUES (5725672592,126,"Dermatology");   #phy
select * from physician;
#.-------------------Inserting values in Patient table---------------------
#drop table patient;
insert into patient values ("P1210315601",106,"Inpatient");
insert into patient values ("P1210315602",107,"Outpatient");
insert into patient values ("P1210315603",101,"Inpatient");
INSERT INTO patient VALUES("P1210315604",115,"Outpatient"); #outpatient
INSERT INTO patient VALUES("P1210315605",117,"Inpatient");#inpatient
INSERT INTO patient VALUES("P1210315606",120,"Outpatient"); #outpatient volunteer d
INSERT INTO patient VALUES ("P1210315607",124,"Inpatient"); #patient-in vol
INSERT INTO patient VALUES  ("P1210315608",130,"Outpatient");#patient-out vol
select * from patient;
#--------------------Inserting values in responsible relation table(Physician<->Patient)---------------------
INSERT INTO responsible VALUES (1122334455,"P1210315601");
INSERT INTO responsible VALUES (6732627754,"P1210315602");
INSERT INTO responsible VALUES (6732627754,"P1210315603");
INSERT INTO responsible VALUES (3581285987,"P1210315621");
select * from responsible;
#--------------------Inserting values in volunteer table--------------------
insert into volunteer values(106,"Team Skills"); #patient volunteer #kath
INSERT INTO volunteer VALUES(113,"Communication,Teamwork,Time management"); #phy volunteer
INSERT INTO volunteer VALUES(120,"Teamwork"); #outpatient volunteer celesete
INSERT INTO volunteer VALUES (122,"Leadership");  #phy volunteer
INSERT INTO volunteer VALUES (124,"Team Skills"); #patient-in vol henry
INSERT INTO volunteer VALUES (130,"Leadership,Team Skills");#patient-out vol syl
select * from volunteer;
#--------------------Inserting values in Employee table---------------------
INSERT INTO employee values(1600249,"Nurse","2021-03-06",102);
INSERT INTO employee values(1600250,"Nurse","2021-02-12",108);
INSERT INTO employee values(1600251,"Staff","2021-02-12",109);
INSERT INTO employee values(1600252,"Staff","2020-07-18",110);
INSERT INTO employee values(1600253,"Staff","2021-02-03",111);
INSERT INTO employee values(1600254,"Staff","2019-05-12",112);
INSERT INTO employee values(1600255,"Nurse","2018-12-06",118);
INSERT INTO employee values(1600256,"Nurse","2017-03-15",121);
INSERT INTO employee values(1600257,"staff","2016-08-08",119);
INSERT INTO employee VALUES (1600258,"Nurse","2018-03-13",127); #nurse
INSERT INTO employee VALUES (1600259,"Nurse","2015-06-18",128);   #nurse
INSERT INTO employee VALUES (1600260,"Nurse","2012-05-12",129); #nurse
INSERT INTO employee VALUES (1600261,"Staff","2016-12-10",125); #staff
INSERT INTO employee VALUES (1600262,"Staff","2013-06-08",131); #staff
INSERT INTO employee VALUES (1600263,"Technician","2016-03-12",114); #staff
INSERT INTO employee VALUES (1600264,"Technician","2017-07-15",116); #staff

select * from employee;
#--------------------Inserting values in Nurse table--------------------- GNP  AACRN ACHPN ACRN AOCN AOCNP ENP FNP 
INSERT INTO nurse VALUES (1600249,"RN");
INSERT INTO nurse VALUES (1600250,"RN");
INSERT INTO nurse VALUES(1600255,"ENP"); #nurse
INSERT INTO nurse VALUES(1600256,"AOCN"); #nurse
INSERT INTO nurse VALUES (1600258,"RN"); #nurse
INSERT INTO nurse VALUES (1600259,"Nurse");   #nurse
INSERT INTO nurse VALUES (1600260,"Nurse"); #nurse
select * from nurse;
#2.-----------------Inserting values in Staff table----Reciptionist Anesthesiologist Physician assistant Information technology specialist-----------------
#emp_id,job class
INSERT INTO staff VALUES (1600251, "Reciptionist"); #staff
INSERT INTO staff VALUES (1600252, "Reciptionist"); #staff
INSERT INTO staff VALUES (1600253, "Physician assistant"); #staff
INSERT INTO staff VALUES (1600254, "Physician assistant"); #staff
INSERT INTO staff VALUES("1600257","Anesthesiologist"); #staff
INSERT INTO staff VALUES ("1600261","Anesthesiologist");    #tech
INSERT INTO staff VALUES ("1600262","Reciptionist");  #tech
select * from staff;
#--------------------Inserting values in Technician---------------------
INSERT INTO technician VALUES(1600263,"Equipment calibration"); #tech
INSERT INTO technician VALUES(1600264,"Sterilization,Chemistry techniques"); #tech
select * from technician;
#Inpatient
insert into in_patient values ("P1210315601","2021-04-12");
insert into in_patient values ("P1210315603","2021-04-13");
INSERT INTO in_patient VALUES("P1210315605","2021-04-14");
INSERT INTO in_patient VALUES ("P1210315607","2021-04-15"); 
select * from in_patient;

#outpatient
insert into out_patient values ("P1210315602");
insert into out_patient values ("P1210315604");
INSERT INTO out_patient VALUES("P1210315606");
INSERT INTO out_patient VALUES ("P1210315608"); 
select * from out_patient;
#visits
insert into visits values ("P1210315602","2021-05-12","nice");
insert into visits values ("P1210315604","2021-06-13","thanks");
INSERT INTO visits VALUES("P1210315606","2021-04-14","hello");
INSERT INTO visits VALUES ("P1210315608","2021-02-15","thank you"); 
select * from visits;

#1. Find the hire dates of all nurses who have an RN certificate.
select date_hired from nurse n,employee e where n.emp_id=e.emp_id  and n.certificate = "RN";
#alter
#select date_hired from employee where certification = "RN";
#--------------------------------------------------------------------------------------------------------------
#2. Find the zip codes of all physicians who are specialized in ENT.
select zipcode from physician,person where person.p_id=physician.p_id and physician.specialization = "ENT";
#--------------------------------------------------------------------------------------------------------------
#3. Find the names of all patients who are also volunteers at the hospital.
select name from person,volunteer,patient where person.p_id=volunteer.p_id and patient.p_id=person.p_id;
#--------------------------------------------------------------------------------------------------------------
#4. Find the total number of patients that Dr. Smith is responsible for.
select count(patient_id) as patient_count from physician,responsible,person where physician.pager_no=responsible.pager_no and physician.p_id=person.p_id and person.name="Smith";
#--------------------------------------------------------------------------------------------------------------
#5. For each job class of staff, find the IDs of the youngest staff members belonging to this class.
CREATE TABLE person_emp_info 
 SELECT person.p_id,employee.emp_id,job_class,date_hired,FLOOR(DATEDIFF(current_date(),date_hired)/12) exp_months, FLOOR(DATEDIFF(current_date(),bdate)/365.25) age 
FROM employee
JOIN staff
  ON staff.emp_id = employee.emp_id
JOIN person
  ON employee.p_id = person.p_id;
select p_id,job_class,age from person_emp_info where age in (select min(age) from person_emp_info group by job_class);
#--------------------------------------------------------------------------------------------------------------
#6.Find the pager# of each physician who has not been responsible for any patient yet.
Select pager_no from physician where pager_no not in (select pager_no from responsible);


