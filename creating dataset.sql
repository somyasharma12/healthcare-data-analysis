--creating a database
create database healthcare_analysis
use healthcare_analysis

--creating a schema
create schema hca

--creating a patient table
CREATE TABLE hca.patients
(
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    blood_group VARCHAR(5),
    registration_date DATE,
    insurance_status VARCHAR(20)
);

ALTER TABLE hca.patients
ADD insurance_id INT NULL;

ALTER TABLE hca.patients
ADD CONSTRAINT FK_Patients_Insurance
FOREIGN KEY (insurance_id)
REFERENCES hca.insurance(insurance_id);

UPDATE hca.patients
SET insurance_id =
    ((patient_id - 1) % 10) + 1;
--inserting values
INSERT INTO hca.patients
VALUES
(1,'Aarav Sharma','Male',32,'Noida','B+','2026-01-05','Insured'),
(2,'Ananya Gupta','Female',28,'Delhi','O+','2026-01-06','Insured'),
(3,'Rohan Verma','Male',45,'Ghaziabad','A+','2026-01-08','Uninsured'),
(4,'Priya Singh','Female',35,'Noida','AB+','2026-01-10','Insured'),
(5,'Rahul Kumar','Male',52,'Delhi','B+','2026-01-12','Insured'),
(6,'Sneha Sharma','Female',24,'Greater Noida','O+','2026-01-15','Uninsured'),
(7,'Aditya Mehta','Male',39,'Noida','A-','2026-01-17','Insured'),
(8,'Kavya Agarwal','Female',31,'Ghaziabad','B+','2026-01-20','Insured'),
(9,'Vivek Kapoor','Male',61,'Delhi','O-','2026-01-22','Insured'),
(10,'Neha Verma','Female',42,'Noida','A+','2026-01-25','Uninsured'),

(11,'Arjun Malhotra','Male',29,'Noida','B+','2026-01-28','Insured'),
(12,'Pooja Gupta','Female',37,'Delhi','O+','2026-02-01','Insured'),
(13,'Kunal Sharma','Male',48,'Ghaziabad','A+','2026-02-03','Uninsured'),
(14,'Simran Kaur','Female',26,'Noida','B-','2026-02-05','Insured'),
(15,'Manish Arora','Male',55,'Delhi','AB+','2026-02-07','Insured'),
(16,'Riya Mehta','Female',30,'Greater Noida','O+','2026-02-09','Uninsured'),
(17,'Nitin Kumar','Male',44,'Noida','A+','2026-02-11','Insured'),
(18,'Isha Singh','Female',22,'Ghaziabad','B+','2026-02-13','Insured'),
(19,'Varun Gupta','Male',67,'Delhi','O+','2026-02-15','Insured'),
(20,'Shreya Kapoor','Female',33,'Noida','AB+','2026-02-18','Uninsured'),

(21,'Mohit Sharma','Male',41,'Noida','B+','2026-02-20','Insured'),
(22,'Nisha Verma','Female',29,'Delhi','O+','2026-02-22','Insured'),
(23,'Deepak Singh','Male',58,'Ghaziabad','A+','2026-02-24','Uninsured'),
(24,'Aditi Gupta','Female',36,'Noida','B+','2026-02-26','Insured'),
(25,'Saurabh Kumar','Male',47,'Delhi','O-','2026-03-01','Insured'),
(26,'Tanya Mehta','Female',25,'Greater Noida','A+','2026-03-03','Uninsured'),
(27,'Harsh Agarwal','Male',34,'Noida','B+','2026-03-05','Insured'),
(28,'Muskan Sharma','Female',40,'Ghaziabad','O+','2026-03-07','Insured'),
(29,'Akash Verma','Male',63,'Delhi','AB+','2026-03-09','Insured'),
(30,'Komal Singh','Female',27,'Noida','A+','2026-03-11','Uninsured'),

(31,'Yash Kapoor','Male',38,'Noida','B+','2026-03-13','Insured'),
(32,'Nandini Gupta','Female',45,'Delhi','O+','2026-03-15','Insured'),
(33,'Abhishek Sharma','Male',51,'Ghaziabad','A+','2026-03-17','Uninsured'),
(34,'Sakshi Mehta','Female',32,'Noida','B-','2026-03-19','Insured'),
(35,'Gaurav Kumar','Male',60,'Delhi','O+','2026-03-21','Insured'),
(36,'Ritika Singh','Female',28,'Greater Noida','A+','2026-03-23','Uninsured'),
(37,'Aman Gupta','Male',43,'Noida','B+','2026-03-25','Insured'),
(38,'Shalini Verma','Female',39,'Ghaziabad','O+','2026-03-27','Insured'),
(39,'Rakesh Arora','Male',56,'Delhi','A+','2026-03-29','Insured'),
(40,'Pallavi Sharma','Female',34,'Noida','AB+','2026-03-31','Uninsured'),

(41,'Ravi Mehta','Male',49,'Noida','B+','2026-04-02','Insured'),
(42,'Swati Gupta','Female',23,'Delhi','O+','2026-04-04','Insured'),
(43,'Tarun Singh','Male',36,'Ghaziabad','A+','2026-04-06','Uninsured'),
(44,'Megha Kapoor','Female',41,'Noida','B+','2026-04-08','Insured'),
(45,'Sachin Verma','Male',65,'Delhi','O-','2026-04-10','Insured'),
(46,'Divya Sharma','Female',30,'Greater Noida','A+','2026-04-12','Uninsured'),
(47,'Rishabh Kumar','Male',46,'Noida','B+','2026-04-14','Insured'),
(48,'Payal Singh','Female',37,'Ghaziabad','O+','2026-04-16','Insured'),
(49,'Ashish Gupta','Male',53,'Delhi','AB+','2026-04-18','Insured'),
(50,'Monika Mehta','Female',29,'Noida','A+','2026-04-20','Uninsured');

-- creating a doctor table
CREATE TABLE hca.doctors
(
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    specialization VARCHAR(100),
    department_id INT,
    experience_years INT,
    consultation_fee DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES hca.departments(department_id)
);

--inserting values in doctor table
INSERT INTO hca.doctors
VALUES
(1,'Dr. Rajesh Sharma','Male','Cardiologist',1,15,1200),
(2,'Dr. Priya Verma','Female','Gynecologist',2,10,1000),
(3,'Dr. Amit Kapoor','Male','Orthopedic',3,12,900),
(4,'Dr. Neha Gupta','Female','Dermatologist',4,8,800),
(5,'Dr. Rahul Mehta','Male','Neurologist',5,18,1500),
(6,'Dr. Anjali Singh','Female','Pediatrician',6,7,700),
(7,'Dr. Vikram Malhotra','Male','General Physician',7,14,600),
(8,'Dr. Sneha Agarwal','Female','ENT Specialist',8,9,750),
(9,'Dr. Karan Arora','Male','Gastroenterologist',9,11,1100),
(10,'Dr. Meera Joshi','Female','Endocrinologist',10,13,1300);

--creating department table
CREATE TABLE hca.departments
(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    floor_no INT,
    department_type VARCHAR(50)
);

--inserting values in department table
INSERT INTO hca.departments
VALUES
(1, 'Cardiology', 2, 'Specialized'),
(2, 'Gynecology', 3, 'Specialized'),
(3, 'Orthopedics', 2, 'Specialized'),
(4, 'Dermatology', 1, 'Specialized'),
(5, 'Neurology', 4, 'Specialized'),
(6, 'Pediatrics', 1, 'Specialized'),
(7, 'General Medicine', 1, 'General'),
(8, 'ENT', 3, 'Specialized'),
(9, 'Gastroenterology', 4, 'Specialized'),
(10, 'Endocrinology', 4, 'Specialized');

--creating staff table
CREATE TABLE hca.staff
(
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    gender VARCHAR(10),
    role VARCHAR(50),
    department_id INT,
    shift VARCHAR(20),
    salary DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES hca.departments(department_id)
);

--insert values into staff table
INSERT INTO hca.staff
VALUES
(1,'Ramesh Kumar','Male','Nurse',1,'Morning',35000),
(2,'Sunita Sharma','Female','Nurse',2,'Night',36000),
(3,'Pankaj Singh','Male','Nurse',3,'Evening',34000),
(4,'Kiran Gupta','Female','Receptionist',7,'Morning',28000),
(5,'Amit Verma','Male','Lab Technician',7,'Morning',32000),
(6,'Ritu Kapoor','Female','Nurse',5,'Night',37000),
(7,'Sandeep Mehta','Male','Pharmacist',7,'Evening',30000),
(8,'Nisha Sharma','Female','Receptionist',8,'Morning',27500),
(9,'Manoj Kumar','Male','Lab Technician',9,'Evening',33000),
(10,'Poonam Singh','Female','Nurse',10,'Morning',35000),
(11,'Deepa Gupta','Female','Nurse',6,'Morning',34000),
(12,'Rajiv Sharma','Male','Admin',7,'Morning',40000),
(13,'Meena Verma','Female','Nurse',4,'Night',36000),
(14,'Vikas Arora','Male','Lab Technician',5,'Evening',33500),
(15,'Anita Mehta','Female','Receptionist',7,'Evening',29000);

--creating appointment table
CREATE TABLE hca.appointments
(
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    department_id INT,
    appointment_date DATE,
    appointment_type VARCHAR(30),
    appointment_status VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES hca.patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES hca.doctors(doctor_id),

    FOREIGN KEY (department_id)
        REFERENCES hca.departments(department_id)
);

--inserting values in appointment table
INSERT INTO hca.appointments
VALUES
(1,1,1,1,'2026-01-10','Consultation','Completed'),
(2,2,2,2,'2026-01-11','Consultation','Completed'),
(3,3,3,3,'2026-01-12','Follow-up','Completed'),
(4,4,4,4,'2026-01-13','Consultation','Completed'),
(5,5,5,5,'2026-01-15','Consultation','Completed'),
(6,6,6,6,'2026-01-16','Consultation','Cancelled'),
(7,7,7,7,'2026-01-18','Consultation','Completed'),
(8,8,8,8,'2026-01-20','Follow-up','Completed'),
(9,9,9,9,'2026-01-21','Consultation','Completed'),
(10,10,10,10,'2026-01-22','Consultation','Completed'),

(11,11,1,1,'2026-01-25','Follow-up','Completed'),
(12,12,2,2,'2026-01-27','Consultation','Completed'),
(13,13,3,3,'2026-01-29','Consultation','Cancelled'),
(14,14,4,4,'2026-02-01','Consultation','Completed'),
(15,15,5,5,'2026-02-03','Follow-up','Completed'),
(16,16,6,6,'2026-02-05','Consultation','Completed'),
(17,17,7,7,'2026-02-07','Consultation','Completed'),
(18,18,8,8,'2026-02-09','Consultation','Completed'),
(19,19,9,9,'2026-02-11','Follow-up','Completed'),
(20,20,10,10,'2026-02-13','Consultation','Completed');

--creating table admissions
CREATE TABLE hca.admissions
(
    admission_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    department_id INT,
    admission_date DATE,
    discharge_date DATE,
    room_type VARCHAR(30),
    bed_number VARCHAR(10),
    admission_type VARCHAR(30),
    admission_status VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES hca.patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES hca.doctors(doctor_id),

    FOREIGN KEY (department_id)
        REFERENCES hca.departments(department_id)
);

--inserting values in admission table
INSERT INTO hca.admissions
VALUES
(1,1,1,1,'2026-01-10','2026-01-14','Private','A101','Emergency','Discharged'),
(2,3,3,3,'2026-01-12','2026-01-17','Semi-Private','B202','Planned','Discharged'),
(3,5,5,5,'2026-01-15','2026-01-20','Private','C301','Emergency','Discharged'),
(4,7,7,7,'2026-01-18','2026-01-20','General','D101','Planned','Discharged'),
(5,9,9,9,'2026-01-22','2026-01-27','Private','E201','Emergency','Discharged'),
(6,12,2,2,'2026-02-01','2026-02-04','Private','F101','Planned','Discharged'),
(7,15,5,5,'2026-02-07','2026-02-12','Semi-Private','C302','Emergency','Discharged'),
(8,17,7,7,'2026-02-11','2026-02-14','General','D102','Planned','Discharged'),
(9,19,9,9,'2026-02-15','2026-02-19','Private','E202','Emergency','Discharged'),
(10,21,1,1,'2026-02-20','2026-02-25','Private','A102','Planned','Discharged');


--creating table of entry/exit
CREATE TABLE hca.entry_exit
(
    entry_exit_id INT PRIMARY KEY,
    patient_id INT,
    admission_id INT,
    entry_time DATETIME,
    exit_time DATETIME,
    entry_type VARCHAR(30),
    exit_type VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES hca.patients(patient_id),

    FOREIGN KEY (admission_id)
        REFERENCES hca.admissions(admission_id)
);


-- inserting values in entry/exit table
INSERT INTO hca.entry_exit
VALUES
(1,1,1,'2026-01-10 09:30:00','2026-01-14 15:00:00','Admission','Discharge'),
(2,3,2,'2026-01-12 11:00:00','2026-01-17 13:30:00','Admission','Discharge'),
(3,5,3,'2026-01-15 08:45:00','2026-01-20 16:00:00','Admission','Discharge'),
(4,7,4,'2026-01-18 10:00:00','2026-01-20 12:00:00','Admission','Discharge'),
(5,9,5,'2026-01-22 14:00:00','2026-01-27 11:30:00','Admission','Discharge'),
(6,12,6,'2026-02-01 09:15:00','2026-02-04 14:00:00','Admission','Discharge'),
(7,15,7,'2026-02-07 12:30:00','2026-02-12 15:30:00','Admission','Discharge'),
(8,17,8,'2026-02-11 10:30:00','2026-02-14 13:00:00','Admission','Discharge'),
(9,19,9,'2026-02-15 09:00:00','2026-02-19 16:30:00','Admission','Discharge'),
(10,21,10,'2026-02-20 11:45:00','2026-02-25 14:30:00','Admission','Discharge');

--creating table diagnosis
CREATE TABLE hca.diagnoses
(
    diagnosis_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_id INT,
    diagnosis_name VARCHAR(100),
    diagnosis_date DATE,
    severity VARCHAR(20),

    FOREIGN KEY (patient_id)
        REFERENCES hca.patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES hca.doctors(doctor_id),

    FOREIGN KEY (appointment_id)
        REFERENCES hca.appointments(appointment_id)
);

--inserting values in diagnosis table
INSERT INTO hca.diagnoses
VALUES
(1,1,1,1,'Hypertension','2026-01-10','Moderate'),
(2,2,2,2,'PCOS','2026-01-11','Moderate'),
(3,3,3,3,'Arthritis','2026-01-12','Severe'),
(4,4,4,4,'Acne','2026-01-13','Mild'),
(5,5,5,5,'Migraine','2026-01-15','Moderate'),
(6,6,6,6,'Viral Fever','2026-01-16','Mild'),
(7,7,7,7,'Diabetes','2026-01-18','Moderate'),
(8,8,8,8,'Sinusitis','2026-01-20','Mild'),
(9,9,9,9,'Gastritis','2026-01-21','Moderate'),
(10,10,10,10,'Thyroid Disorder','2026-01-22','Moderate'),

(11,11,1,11,'Hypertension','2026-01-25','Mild'),
(12,12,2,12,'PCOS','2026-01-27','Moderate'),
(13,14,4,14,'Dermatitis','2026-02-01','Mild'),
(14,15,5,15,'Migraine','2026-02-03','Severe'),
(15,16,6,16,'Viral Fever','2026-02-05','Mild'),
(16,17,7,17,'Diabetes','2026-02-07','Moderate'),
(17,18,8,18,'Ear Infection','2026-02-09','Mild'),
(18,19,9,19,'Acid Reflux','2026-02-11','Moderate'),
(19,20,10,20,'Thyroid Disorder','2026-02-13','Moderate');

--create treatment table
CREATE TABLE hca.treatments
(
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis_id INT,
    treatment_name VARCHAR(100),
    treatment_date DATE,
    treatment_cost DECIMAL(10,2),
    treatment_status VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES hca.patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES hca.doctors(doctor_id),

    FOREIGN KEY (diagnosis_id)
        REFERENCES hca.diagnoses(diagnosis_id)
);

--inserting values in treatment table
INSERT INTO hca.treatments
VALUES
(1,1,1,1,'Blood Pressure Management','2026-01-10',2500,'Completed'),
(2,2,2,2,'Hormonal Treatment','2026-01-11',3000,'Completed'),
(3,3,3,3,'Joint Therapy','2026-01-12',4500,'Completed'),
(4,4,4,4,'Acne Treatment','2026-01-13',1800,'Completed'),
(5,5,5,5,'Migraine Treatment','2026-01-15',3500,'Completed'),
(6,6,6,6,'Fever Treatment','2026-01-16',1200,'Completed'),
(7,7,7,7,'Diabetes Management','2026-01-18',2800,'Ongoing'),
(8,8,8,8,'Sinus Treatment','2026-01-20',1600,'Completed'),
(9,9,9,9,'Gastritis Treatment','2026-01-21',2200,'Completed'),
(10,10,10,10,'Thyroid Management','2026-01-22',3200,'Ongoing');


--creating table bills
CREATE TABLE hca.bills
(
    bill_id INT PRIMARY KEY,
    patient_id INT,
    admission_id INT NULL,
    bill_date DATE,
    consultation_charges DECIMAL(10,2),
    medicine_charges DECIMAL(10,2),
    lab_charges DECIMAL(10,2),
    room_charges DECIMAL(10,2),
    treatment_charges DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    bill_status VARCHAR(30),

    FOREIGN KEY (patient_id)
        REFERENCES hca.patients(patient_id),

    FOREIGN KEY (admission_id)
        REFERENCES hca.admissions(admission_id)
);

--inserting values into bills table
INSERT INTO hca.bills
VALUES
(1,1,1,'2026-01-14',1200,2500,1200,5000,2500,12400,'Paid'),
(2,3,2,'2026-01-17',900,3000,1500,4500,4500,14400,'Paid'),
(3,5,3,'2026-01-20',1500,3500,2000,6000,3500,16500,'Paid'),
(4,7,4,'2026-01-20',600,2800,1000,2500,2800,9700,'Pending'),
(5,9,5,'2026-01-27',1100,2200,1800,5500,2200,12800,'Paid'),
(6,12,6,'2026-02-04',1000,3000,1500,4500,3000,13000,'Paid'),
(7,15,7,'2026-02-12',1500,3500,2000,6000,3500,16500,'Pending'),
(8,17,8,'2026-02-14',600,2800,1000,3000,2800,10200,'Paid'),
(9,19,9,'2026-02-19',1100,2200,1600,5000,2200,12100,'Paid'),
(10,21,10,'2026-02-25',1200,3000,1800,6000,2500,14500,'Pending');


--creating payments table
CREATE TABLE hca.payments
(
    payment_id INT PRIMARY KEY,
    bill_id INT,
    patient_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),

    FOREIGN KEY (bill_id)
        REFERENCES hca.bills(bill_id),

    FOREIGN KEY (patient_id)
        REFERENCES hca.patients(patient_id)
);

--inserting values into payment table
INSERT INTO hca.payments
VALUES
(1,1,1,'2026-01-14',12400,'UPI','Completed'),
(2,2,3,'2026-01-17',14400,'Credit Card','Completed'),
(3,3,5,'2026-01-20',16500,'Cash','Completed'),
(4,4,7,'2026-01-20',5000,'UPI','Partial'),
(5,5,9,'2026-01-27',12800,'Debit Card','Completed'),
(6,6,12,'2026-02-04',13000,'UPI','Completed'),
(7,7,15,'2026-02-12',8000,'Cash','Partial'),
(8,8,17,'2026-02-14',10200,'UPI','Completed'),
(9,9,19,'2026-02-19',12100,'Credit Card','Completed'),
(10,10,21,'2026-02-25',7000,'UPI','Partial');

--create insurance table
CREATE TABLE hca.insurance
(
    insurance_id INT PRIMARY KEY,
    company VARCHAR(100) NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    insurance_limit DECIMAL(12,2) NOT NULL
);

--inserting values into insurance table
INSERT INTO hca.insurance
VALUES
(1, 'Star Health', 'Family Health Optima', 15000),
(2, 'HDFC ERGO', 'Optima Secure', 17000),
(3, 'ICICI Lombard', 'Complete Health Insurance', 20000),
(4, 'Niva Bupa', 'ReAssure 2.0', 28000),
(5, 'Aditya Birla Health', 'Activ Health Platinum', 26000),
(6, 'Care Health Insurance', 'Care Supreme', 35000),
(7, 'Bajaj Allianz', 'Health Guard Gold', 25000),
(8, 'ManipalCigna', 'ProHealth Prime', 27000),
(9, 'Tata AIG', 'Medicare Premier', 30000),
(10, 'New India Assurance', 'Mediclaim Policy', 32000);
