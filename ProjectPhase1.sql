/* For my phase 1 project I decided to make a database table based on a hospital I shadowed at in Lisbon Portugal & Jersey City. I decided to use my 
previous knowledge as a nursing student and thought best to apply previous experience volunteering and shadowing at hospitals 
to build a database that would work best for a healthcare setting*/ 

Create database HospitalProjectPHASE_ONE;

create table PhysicianSpecialties
(SpecialtyID int not null,
SpecialyName varchar(50),
constraint pk_PhysicianSpecialties primary key (SpecialtyID)) 


Create table ZipCodes
(ZipCode varchar(10) not null,
City Varchar(50),
State varchar(5),
Constraint PK_ZipCodes primary key (ZipCode)) 

Create table PhysicianPractices
(PracticeID int not null,
PracticeName varchar(50),
Address varchar(50),
Phone varchar(14),
PracName varchar(50),
Website varchar (50),
ZipCode varchar (10) not null,
constraint PK_PhysicianPractices primary key(PracticeID),
constraint FK_PhysicianPractices_ZipCodes foreign key (ZipCode) references ZipCodes) 


Create table Physicians
(PhysicianID int not null,
FirstName varchar(50),
LastName varchar(50),
PracticeID int not null,
SpecialtyID int not null,
Email varchar(50),
constraint PK_Physicians primary key (PhysicianID),
constraint FK_PhysicianPractices foreign key (PracticeID) references PhysicianPractices,
constraint FK_PhysicianPracticesSpecialities foreign key (SpecialtyID) references PhysicianSpecialties)  


Create table Patients
(PatientID int not null,
FirstName Varchar(50),
LastName Varchar(50),
Address Varchar(50),
Phone varchar(10),
Email varchar(50),
BirthDate date,
constraint PK_Patients primary key (PatientID))  

create table InsuranceCompanies
(InsuranceID int not null,
InsuranceCompany varchar(50),
Phone varchar(15),
email varchar(50),
Address varchar(50),
constraint PK_InsuranceCompanies primary key (InsuranceID))
 

create table PaymentTypes
(PaymentTypeID int not null,
PaymentType varchar(50),
constraint PK_PaymentTypes primary key (PaymentTypeID))  


create table Contracts
(ContractID int not null,
StartDate date,
EndDate date,
NegotiatedRate float,
PaymentTypeID int not null,
InsuranceID int not null,
constraint PK_Contracts primary key (ContractID),
Constraint FK_Contracts_PaymentTypes foreign key (PaymentTypeID) references PaymentTypes,
constraint Fk_Contracts_InsuranceCompanies foreign key (InsuranceID) references InsuranceCompanies)
 

create table Referrals
(ReferralID int not null,
StartDate date,
EndDate date,
PatientID int not null,
PhysicianID int not null,
ContractID int not null,
constraint PK_Referrals primary key (ReferralID),
constraint pk_referrals_Contracts foreign key (ContractID) references Contracts,
constraint FK_Referrals_Patients foreign key (PatientID) references Patients,
constraint FK_Referrals_Physicians foreign key (PhysicianID) references Physicians)  

create table Services
(ServicesID int not null,
ServiceName varchar(50),
Constraint PK_ServiceID primary key (ServicesID))
 

create table Frequencies 
(FrequencyID int not null,
Frequency int,
constraint PK_Frequencies primary key (FrequencyID))
 
 
create table ReferralServices
(ReferralID int not null,
ServicesID int not null,
FrequencyID int not null,
Constraint PK_ReferralServices primary key(ReferralID,ServicesID),
constraint Fk_ReferralServicesReferrals foreign key (ReferralID) references Referrals,
Constraint Fk_ReferralServicesServices foreign key (ServicesID) references Services,
constraint FK_ReferralServicesFrequencies foreign key (FrequencyID) References Frequencies)
 

create table EmployeeTitles
(EmployeeTitleID int not null,
EmployeeTitle varchar(50),
constraint PK_EmployeeTitles primary key (EmployeeTitleId))
 
	
create table EmployeeTypes
(EmployeeTypeID int not null,
EmployeeType Varchar(50),
constraint PK_EmployeeTypes primary key (EmployeeTypeID))
 

create table EmployeeSkillLevels
(SkillLevelID integer not null,
SkillLevel varchar(50),
Constraint PK_EmployeeSkillLevels primary key (SkillLevelID))
 

create table BillingRates
(EmployeeTypeID int not null,
SkillLevelID int not null,
BillingRate float,
Constraint PK_PrimaryKey primary key (EmployeeTypeID, SkillLevelID),
constraint FK_BillingRatesEmployeeTypes foreign key (EmployeeTypeID) references EmployeeTypes,
constraint Fk_BillingRatesEmployeeSkillLevels foreign key (SkillLevelID) references EmployeeSkillLevels)
 

create table EmployeeRanks
(RankID int not null,
EmployeeTypeID int not null,
SkillLevelID int not null,
TitleID int not null,
HourlyRate float,
Salary float,
constraint PK_EmployeeRanks primary key (RankID),
Constraint fk_EmployeeRanksEmployeeTypes foreign key(EmployeeTypeID) references EmployeeTypes,
constraint fk_EmployeeRanksEmployeeTitles foreign key (TitleID) references EmployeeTitles,
constraint fk_EmployeeRanksEmployeeSkillLevels foreign key (SkilllevelId) references EmployeeSkillLevels)
 

create table Employees
(EmployeeID int not null,
FirstName varchar(50),
LastName varchar(50),
Address varchar(50),
HourlyRate float,
Salary float,
RankID int not null,
ZipCode varchar(10) not null,
Phone Varchar(10),
constraint PK_Employees primary key (EmployeeID),
Constraint Fk_emplyoeesZipCode foreign key (ZipCode) references ZipCodes,
constraint Fk_EmployeesEmployeesRanks foreign key (RankID) references EmployeeRanks)
 
 

create table EmployeeShifts
(EmpShiftID integer not null,
EmpShiftName varchar(20),
StartTime time,
EndTime time,
constraint PK_Shifts primary key (EmpShiftID))

create table DaysOfTheWeek
(DaysOfWeekID int not null,
DaysofWeek varchar(20),
Constraint Pk_DaysOfWeek primary key (DaysofWeekID)) 



create table Availability
(EmployeeId int not null,
DayOfWeekID int not null,
TheWeek date,
EmpShiftID int not null,
constraint pk_Availability primary key(EmployeeID, DayOfWeekID, TheWeek, EmpShiftID),
constraint FK_AvailabilityEmployees foreign key(EmployeeID) references Employees,
constraint fk_AvailabilityDaysOfWeek foreign key(DayOfWeekID) references DaysOfTheWeek,
constraint FK_AvailabilityEmpShifts foreign key(EmpShiftID) references EmployeeShifts)
 


Create table MedicalSuppliers
(SupplierID int not null,
MedSupplierName varchar(50),
Address varchar(50),
email varchar(50),
phone varchar(15),
constraint PK_MedicalSuppliers primary key (SupplierID))
 

create table Supplies
(SupplyID int not null,
SupplyDescription varchar(50),
CostOfUnit float,
constraint PK_Supplies primary key (SupplyID))  


create table SupplyInventory
(SupplyID int not null,
SupplierId int not null,
DateReceived date,
PerUnitCost float,
Quantity float,
constraint PK_SupplyInventory primary key (SupplyId, SupplierId, DateReceived),
constraint FK_SupplyInventorySupplies foreign key (SupplyID) references Supplies,
constraint fk_SupplyInventoryMedSupplies foreign key (SupplierId) references MedicalSuppliers)
 

create table Visits
(VisitID int not null,
DateVisited date,
StartTime time,
EndTime time,
EmployeeID int not null,
PatientID int not null,
constraint PK_Visits primary key (VisitID),
Constraint FK_VisitsEmployees foreign key (EmployeeID) references Employees,
constraint FK_VisitsPatients foreign key (PatientID) references Patients)
 
create table VisitDetails
(VisitId int not null,
VisitDetailID int not null,
ServicesID int not null,
SupplyID int not null,
Cost float,
SupplyQuantity int,
constraint PK_VisitDetails primary key (VisitID, VisitDetailID),
constraint FK_VisitDetailsSupplies foreign key (SupplyID) references Supplies,
constraint FK_VisitDetailsServices foreign key (ServicesID) references Services)
