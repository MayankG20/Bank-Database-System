drop database if exists BANK;
create database BANK;
use BANK;

drop table if exists TRANSACTIONS;
drop table if exists BRANCH;
drop table if exists BENIFICIARY;
drop table if exists DEPENDENT;
drop table if exists GUARANTOR;
drop table if exists EMPLOYEE;
drop table if exists CUSTOMER;
drop table if exists DEPOSIT;
drop table if exists WITHDRAW; 
drop table if exists CUSTOMER_MBL;
drop table if exists GUARANTOR_MBL;
drop table if exists DEPENDENT_MBL;
drop table if exists BENIFICIARY_MBL;
drop table if exists Security;
drop table if exists Finance;
drop table if exists IT;
drop TABLE if EXISTS LOAN;

create table EMPLOYEE
(
    Fname VARCHAR(30) NOT NULL, 
    Mname VARCHAR(30), 
	Lname VARCHAR(30),
	Id INT, 
    AadharNumber BIGINT,
    Mgr_Id INT,
    BranchNumber INT,
    DeptName VARCHAR(30),
    DateofBirth DATE, 
    Salary FLOAT,
	JoingDate DATE NOT NULL,
    PRIMARY KEY (Id)
);
create table CUSTOMER(
    Fname VARCHAR(30) NOT NULL, 
	Mname VARCHAR(30), 
	Lname VARCHAR(30),
	AccountNumber BIGINT, 
    AadharNumber BIGINT,
    HouseNumber INT,
    StreetNumber INT,
    LandMark varchar(30),
    DateofBirth DATE,
    Balance FLOAT,
    Sex varchar(30),
    PRIMARY KEY (AccountNumber)
);
create table GUARANTOR (

Account_Number BIGINT,
Cus_acc_no BIGINT,
Branch_NO INT,
FOREIGN Key (Cus_acc_no) REFERENCES CUSTOMER(AccountNumber),
Primary Key (Account_Number)

);
create table BRANCH(
    BranchNumber int,
    IFSCcode BIGINT,
    Location varchar(30),
    BMgr_id INT,
    Primary Key (BranchNumber)

	
);
create table TRANSACTIONS(
	Transaction_id INT NOT NULL AUTO_INCREMENT,
    TCust_accnt_number BIGINT,
    TAmount FLOAT,
    TTypes VARCHAR(20),
    Primary Key (Transaction_id)

);
create table DEPENDENTS (
	DE_id INT,
    DName VARCHAR(30),
    DRelationship varchar(20),
    DDateofBirth date ,
    FOREIGN Key (DE_id) REFERENCES EMPLOYEE(Id),
    Primary Key(DName)
);

create table BENIFICIARY (
	BCust_acct_number BIGINT,
    BName VARCHAR(30),
    BRelationship varchar(20),
    BDateofBirth date,
    FOREIGN Key (BCust_acct_number) REFERENCES CUSTOMER(AccountNumber),
    Primary Key(BName)
);

create table BENIFICIARY_MBL(
    B_Cust_acct_number BIGINT,
    B_MobileNumber BIGINT,
    B_Name VARCHAR(30),
    FOREIGN Key (B_Cust_acct_number) REFERENCES CUSTOMER(AccountNumber),
    FOREIGN Key (B_Name) REFERENCES BENIFICIARY(BName)

);

create table GUARANTOR_MBL(
G_acc_no BIGINT,
M_no BIGINT,
G_Account_Number BIGINT,
FOREIGN Key (G_Account_Number) REFERENCES GUARANTOR(Account_Number),
FOREIGN Key (G_acc_no) REFERENCES  CUSTOMER(AccountNumber)

);

create table  DEPENDENTS_MBL(
D_E_Id INT,
D_MobileNumber BIGINT,
D_Name VARCHAR(30), 
FOREIGN Key (D_E_Id) REFERENCES EMPLOYEE(Id),
FOREIGN Key (D_Name) REFERENCES DEPENDENTS(DName)

);

create table CUSTOMER_MBL(
    CCust_acct_number BIGINT,
    CMobileNumber BIGINT,
    FOREIGN Key (CCust_acct_number) REFERENCES CUSTOMER(AccountNumber)
);

create table DEPOSIT( 
    DAccountNumber BIGINT,
    DBranchNumber INT,
    DAmount FLOAT,
    FOREIGN Key (DAccountNumber) REFERENCES CUSTOMER(AccountNumber),
	FOREIGN Key (DBranchNumber) REFERENCES BRANCH(BranchNumber)
);

create table WITHDRAW( 
    
    WAccountNumber BIGINT,
    WBranchNumber INT,
    WAmount FLOAT,
    
    #FOREIGN Key (Transaction_id) REFERENCES TRANSACTIONS(TRANSACTIONID),
    FOREIGN Key (WAccountNumber) REFERENCES CUSTOMER(AccountNumber),
    FOREIGN Key (WBranchNumber) REFERENCES BRANCH(BranchNumber)
     );
create table LOAN(
	LAccountNumber BIGINT,
    LBranch_Number INT,
    LE_ID INT,
    LGuarantee_accnt_no BIGINT,
    LAmount INT,
    LRateofInterest FLOAT,
    LTenure INT,
    FOREIGN Key (LAccountNumber) REFERENCES CUSTOMER(AccountNumber),
    FOREIGN Key (LE_ID) REFERENCES EMPLOYEE(Id),
    FOREIGN Key (LBranch_Number) REFERENCES BRANCH(BranchNumber),
    FOREIGN Key (LGuarantee_accnt_no) REFERENCES GUARANTOR(Account_Number)
);
create table IT(
    IId INT,
    CPSKILLS VARCHAR(30),
    CPLANG VARCHAR(30),
    FOREIGN Key (IId) REFERENCES EMPLOYEE(Id)

);
create table Finance(
    FId INT,
    Qualification VARCHAR(20),
    TypingSpeed INT,
    FOREIGN Key (FId) REFERENCES EMPLOYEE(Id)
);
create table Security(
    SId INT,
    Experience INT,
    FOREIGN Key (SId) REFERENCES EMPLOYEE(Id)
);