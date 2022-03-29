CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR,
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  PRIMARY KEY(id),
  CONSTRAINT patient_key
    FOREIGN KEY (patient_id)
      REFERENCES patients(id)
);

CREATE TABLE invoices (
   id INT GENERATED ALWAYS AS IDENTITY,
   total_amount DECIMAL,
   generated_at TIMESTAMP,
   payed_at TIMESTAMP,
   medical_history_id INT UNIQUE,
   PRIMARY KEY(id),
    CONSTRAINT medical_history_key
    FOREIGN KEY (medical_history_id)
      REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR,
  name VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY(id),
  CONSTRAINT invoice_item_id
    FOREIGN KEY (invoice_id)
      REFERENCES invoices(id),
  CONSTRAINT treatment_item_id
    FOREIGN KEY (treatment_id)
      REFERENCES treatments(id)
);

CREATE TABLE join_treatments (
  medical_history_id INT,
  treatment_id INT,
  CONSTRAINT medical_history_key
    FOREIGN KEY (medical_history_id)
      REFERENCES medical_histories(id),
  CONSTRAINT treatment_key
    FOREIGN KEY (treatment_id)
      REFERENCES treatments(id)  
);
