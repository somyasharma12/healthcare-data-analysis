use healthcare_analysis

--total no. of patients
select count(patient_id) as total_patients
from hca.patients

--patient count by gender
select COUNT(patient_id) as total_patients ,gender
from hca.patients
group by gender

--avg patient age
select AVG(age) as avg_patient_age from hca.patients

--total doctors by department
select d.department_name, COUNT(doc.doctor_id) as total_doctors
from hca.departments d
left join hca.doctors doc 
on d.department_id = doc.department_id
group by d.department_name

--doctor wise appointment
select doc.doctor_name,COUNT(a.appointment_id) as total_appointment
from hca.doctors doc
left join hca.appointments a
on doc.doctor_id = a.doctor_id
group by doc.doctor_name

--department wise admissions
select d.department_name , COUNT(a.admission_id) as total_admissions
from hca.departments d
join hca.admissions a
on d.department_id=a.department_id
group by d.department_name
order by total_admissions desc

--most common diagnoses
select diagnosis_name, count(*) as diagnoses_count
from hca.diagnoses
group by diagnosis_name
order by diagnoses_count desc

--diagnoses severity analysis
select severity , COUNT(*) as diagnoses_count 
from hca.diagnoses
group by severity
order by diagnoses_count desc

--treatment status analysis
select treatment_status , COUNT(*) as total_treatments
from hca.treatments
group by treatment_status

--total healthcare revenue
select sum(total_amount) as total_revenue
from hca.bills

--total payment received
select sum(payment_amount) as total_payments
from hca.payments

--outstanding amount
select SUM(b.total_amount) -
(select SUM(payment_amount) from hca.payments) as outstanding_amount
from hca.bills b

--payment method analysis
select payment_method,SUM(payment_amount) as total_payment
from hca.payments
group by payment_method
order by total_payment desc

--paid vs pending bills
select bill_status , count(*) as total_bills from
hca.bills
group by bill_status

--avg bill amount
select avg(total_amount) as avg_bill_amount
from hca.bills

