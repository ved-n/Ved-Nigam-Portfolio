CREATE TABLE patient (
roomID INTEGER(2),
	patientId INTEGER(5),
	username VARCHAR(70),
	password VARCHAR(70),
	phoneNumber VARCHAR(10),
	address VARCHAR(70),
	pharmacy VARCHAR(70),
	reportID INTEGER(5),
	billingInfo VARCHAR(255),
	appointmentId INTEGER(5),
	dateOfBirth VARCHAR(70),
	email VARCHAR(70),
	conditionId INTEGER(3),
	Constraint patientPKConstraint
		PRIMARY KEY (patientId),
	Constraint patientToReportFKConstraint
		FOREIGN KEY (reportID) REFERENCES report(reportID)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	Constraint patientToAppointmentFKConstraint
		FOREIGN KEY (appointmentId) REFERENCES appointment(appointmentId)
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	Constraint patientToConditionFKConstraint
		FOREIGN KEY (conditionId) REFERENCES medical_condition(conditionId)
		ON DELETE SET NULL
		ON UPDATE CASCADE
);

CREATE TABLE employee (
	essn INTEGER(10),
	firstname VARCHAR(70),
    lastname VARCHAR(70),
    username VARCHAR(70),
    password VARCHAR(70),
    phoneNumber VARCHAR(70),
    dateOfBirth VARCHAR(70),
    email VARCHAR(70),
    Constraint employeePKConstraint
    PRIMARY KEY (essn)
);

CREATE TABLE nurse(
    essn INTEGER(10), 
	departmentID INTEGER(2),
    roomID INTEGER(2) NOT NULL DEFAULT 0,
    reportID INTEGER(5) NOT NULL DEFAULT 0,
    Constraint nursePKConstraint
        PRIMARY KEY (essn),
    Constraint nurseToRoomFKConstraint
		FOREIGN KEY (roomID) REFERENCES room(roomID)
               		ON DELETE SET DEFAULT ON UPDATE CASCADE,
    Constraint nurseToReportFKConstraint
		FOREIGN KEY (reportID) REFERENCES report(reportID)
	        ON DELETE SET DEFAULT   ON UPDATE CASCADE
);

CREATE TABLE receptionist(
    	essn VARCHAR(10),
    	departmentID INTEGER(2)  NOT NULL 	DEFAULT 0,
    	appointmentId INTEGER(5),
    	Constraint employeePKConstraint
        		PRIMARY KEY (essn),
    	Constraint departmentFK
            FOREIGN KEY(departmentID) REFERENCES department(departmentID)
		        ON DELETE SET DEFAULT   ON UPDATE CASCADE,
    	Constraint appointmentFK
		    FOREIGN KEY(appointmentId) REFERENCES appointment(appointmentId)
	        		ON DELETE SET NULL  ON UPDATE CASCADE
);

CREATE TABLE administrators(
	essn INTEGER(10),
	Constraint employeePKConstraint
        PRIMARY KEY (essn)
);

CREATE TABLE record_keeper(
	essn INTEGER(10),
	Constraint employeePKConstraint
        	PRIMARY KEY (essn)
);

CREATE TABLE doctor(
	essn INTEGER(10),
	departmentID INTEGER(2),
	roomID INTEGER(2) NOT NULL DEFAULT 0,
	reportID INTEGER(5),
	Constraint employeePKConstraint
        PRIMARY KEY (essn),
	Constraint roomFK
		FOREIGN KEY(roomID) REFERENCES room(roomID)
            ON DELETE SET DEFAULT
            ON UPDATE CASCADE,
	Constraint drToReportFK
		FOREIGN KEY(reportID) REFERENCES report(reportID)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

CREATE TABLE ward_boy(
    essn INTEGER(10),
    departmentID INTEGER(2) NOT NULL DEFAULT 0,
    roomID INTEGER(2) NOT NULL DEFAULT 0,
    reportID INTEGER(5),
    Constraint employeePKConstraint
        PRIMARY KEY (essn),
    Constraint wardboyFKConstraint
    	FOREIGN KEY (departmentID) REFERENCES department(departmentID)
	        ON DELETE SET DEFAULT
            ON UPDATE CASCADE,
    Constraint roomFKConstraint
        FOREIGN KEY (roomID) REFERENCES room(roomID)
            ON DELETE SET DEFAULT
            ON UPDATE CASCADE,
    Constraint wbToReportFKConstraint
        FOREIGN KEY (reportID) REFERENCES report(reportID)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

CREATE TABLE report(
	reportID INTEGER(5),
	labResults VARCHAR(50),
	medicineId INTEGER(7),
    Constraint reportPKConstraint
        PRIMARY KEY (reportID),
    Constraint reportFKConstraint
        FOREIGN KEY (medicineId) REFERENCES medicine(medicineId)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

CREATE TABLE lab_assistant(
    essn INTEGER(2),
    reportID INTEGER(2),
    Constraint employeePKConstraint
        PRIMARY KEY (essn),
    Constraint reportIDFK
	    FOREIGN KEY (reportID) REFERENCES report(reportID)
);

CREATE TABLE billing_specialist(
	essn INTEGER(10),
	billingInfo VARCHAR(255),
	Constraint employeePKConstraint
        PRIMARY KEY (essn)
);

CREATE TABLE medicine(
    medicineId INTEGER (7),
	reportID INTEGER(5),
	medicineName VARCHAR (50),
    Constraint medicinePKConstraint
		PRIMARY KEY (medicineId)
);

CREATE TABLE department(
	departmentID INTEGER(2),
	departmentName VARCHAR(50),
	Constraint departmentPKConstraint
		PRIMARY KEY (departmentID)
);

CREATE TABLE medical_condition(
	conditionId INTEGER (3),
	conditionName VARCHAR(50),
	Constraint conditionPKConstraint
        PRIMARY KEY (conditionId)
);

CREATE TABLE room(
	roomID INTEGER(2),
	departmentID INTEGER(2) NOT NULL DEFAULT 0,
	roomNo INTEGER(2),
	Constraint roomPKConstraint
        PRIMARY KEY (roomID),
    Constraint departmentFKConstraint
        FOREIGN KEY (departmentID) REFERENCES department(departmentID)
            ON DELETE SET DEFAULT
            ON UPDATE CASCADE
);

CREATE TABLE appointment(
	appointmentId INTEGER(5),
	time TIME, 
	date DATE,
	Constraint appointmentPKConstraint
        PRIMARY KEY (appointmentId)
);

