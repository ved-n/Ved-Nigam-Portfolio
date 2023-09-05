CREATE VIEW patientInfoView AS SELECT roomId, patientId, phoneNumber, address, pharmacy, appointmentId, dateOfBrith, email FROM patient;

CREATE VIEW employeeInfoView AS SELECT firstname, lastname, phoneNumber, dateOfBirth, email FROM employee;

CREATE VIEW nurseInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email, roomId, departmentId FROM nurse, employee WHERE nurse.essn=employee.essn;

CREATE VIEW receptionistInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email, departmentId FROM receptionist, employee WHERE receptionist.essn=employee.essn;

CREATE VIEW administratorInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email FROM administrators, employee WHERE administrators.essn=employee.essn;

CREATE VIEW recordKeeperInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email FROM record_keeper, employee WHERE record_keeper.essn=employee.essn;

CREATE VIEW doctorInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email, departmentId, roomId FROM doctor, employee WHERE doctor.essn=employee.essn;

CREATE VIEW wardBoyInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email, departmentId, roomId FROM word_boy, employee WHERE word_boy.essn=employee.essn

CREATE VIEW labAssistantInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email FROM lab_assistant, employee WHERE lab_assistant.essn=employee.essn;

CREATE VIEW billingSpecialistInfoView AS SELECT DISTINCT firstname, lastname, phoneNumber, dateOfBirth, email FROM billing_specialist, employee WHERE billing_specialist.essn = employee.essn;