CREATE TABLE Driver
(
  Driver_ID INT NOT NULL,
  First_name INT NOT NULL,
  Last_name INT NOT NULL,
  Email INT NOT NULL,
  username INT NOT NULL,
  password INT NOT NULL,
  city_of_residence INT NOT NULL,
  Area INT NOT NULL,
  PRIMARY KEY (Driver_ID)
);

CREATE TABLE Park_Manager
(
  Manager_ID INT NOT NULL,
  username INT NOT NULL,
  password INT NOT NULL,
  Email INT NOT NULL,
  PRIMARY KEY (Manager_ID)
);

CREATE TABLE Extras
(
  Extras_ID INT NOT NULL,
  Name INT NOT NULL,
  Paice INT NOT NULL,
  Description INT NOT NULL,
  PRIMARY KEY (Extras_ID)
);

CREATE TABLE Price-Packs
(
  Packs_ID INT NOT NULL,
  Description INT NOT NULL,
  Booking_Type INT NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (Packs_ID)
);

CREATE TABLE Slot_history
(
  Start_Date_Time INT NOT NULL,
  end_date_time INT NOT NULL,
  history_ID INT NOT NULL,
  Occupied_Status INT NOT NULL,
  PRIMARY KEY (history_ID)
);

CREATE TABLE Blocks_Officer
(
  Officer_ID INT NOT NULL,
  username INT NOT NULL,
  password INT NOT NULL,
  Manager_ID INT NOT NULL,
  PRIMARY KEY (Officer_ID),
  FOREIGN KEY (Manager_ID) REFERENCES Park_Manager(Manager_ID)
);

CREATE TABLE Cancellition
(
  Date_Time INT NOT NULL,
  Cancel_ID INT NOT NULL,
  PRIMARY KEY (Cancel_ID)
);

CREATE TABLE Driver_Phones
(
  Phones INT NOT NULL,
  Driver_ID INT NOT NULL,
  PRIMARY KEY (Phones, Driver_ID),
  FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)
);

CREATE TABLE Park_Space
(
  Park_ID INT NOT NULL,
  Type INT NOT NULL,
  Working_Hours INT NOT NULL,
  City INT NOT NULL,
  Area INT NOT NULL,
  Park_Name INT NOT NULL,
  Capacity INT NOT NULL,
  Navigate_Map INT NOT NULL,
  Status INT NOT NULL,
  Avrage_rate INT NOT NULL,
  Manager_ID INT NOT NULL,
  PRIMARY KEY (Park_ID),
  FOREIGN KEY (Manager_ID) REFERENCES Park_Manager(Manager_ID)
);

CREATE TABLE Park_History
(
  History_ID INT NOT NULL,
  Sart_time_date INT NOT NULL,
  End_time_date INT NOT NULL,
  Occupied_status INT NOT NULL,
  Park_ID INT NOT NULL,
  PRIMARY KEY (History_ID),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID)
);

CREATE TABLE Booking
(
  Booking_no INT NOT NULL,
  entrance_date_time INT NOT NULL,
  exit_date_tim INT NOT NULL,
  Park_ID INT NOT NULL,
  Driver_ID INT NOT NULL,
  Extras_ID INT NOT NULL,
  Cancel_ID INT NOT NULL,
  PRIMARY KEY (Booking_no, Park_ID),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID),
  FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
  FOREIGN KEY (Extras_ID) REFERENCES Extras(Extras_ID),
  FOREIGN KEY (Cancel_ID) REFERENCES Cancellition(Cancel_ID)
);

CREATE TABLE Block_Spaces
(
  Block_No INT NOT NULL,
  Type INT NOT NULL,
  Capacity INT NOT NULL,
  Park_ID INT NOT NULL,
  PRIMARY KEY (Block_No),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID)
);

CREATE TABLE Departure_late
(
  Arrival_date_time INT NOT NULL,
  Departure_data_time INT NOT NULL,
  Actual_leaving_date_time INT NOT NULL,
  fees INT NOT NULL,
  Booking_no INT NOT NULL,
  Park_ID INT NOT NULL,
  FOREIGN KEY (Booking_no, Park_ID) REFERENCES Booking(Booking_no, Park_ID)
);

CREATE TABLE Rate
(
  Date_Time INT NOT NULL,
  Commint INT NOT NULL,
  Rate INT NOT NULL,
  Driver_ID INT NOT NULL,
  Park_ID INT NOT NULL,
  PRIMARY KEY (Driver_ID, Park_ID),
  FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID)
);

CREATE TABLE include
(
  Park_ID INT NOT NULL,
  Extras_ID INT NOT NULL,
  PRIMARY KEY (Park_ID, Extras_ID),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID),
  FOREIGN KEY (Extras_ID) REFERENCES Extras(Extras_ID)
);

CREATE TABLE Customizing
(
  Officer_ID INT NOT NULL,
  Block_No INT NOT NULL,
  PRIMARY KEY (Officer_ID, Block_No),
  FOREIGN KEY (Officer_ID) REFERENCES Blocks_Officer(Officer_ID),
  FOREIGN KEY (Block_No) REFERENCES Block_Spaces(Block_No)
);

CREATE TABLE Park_Space_Features
(
  Features INT NOT NULL,
  Park_ID INT NOT NULL,
  PRIMARY KEY (Features, Park_ID),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID)
);

CREATE TABLE Park_Space_Images
(
  Images INT NOT NULL,
  Park_ID INT NOT NULL,
  PRIMARY KEY (Images, Park_ID),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID)
);

CREATE TABLE Vehicle_Category
(
  Category_ID INT NOT NULL,
  Max_Height INT NOT NULL,
  Max_Length INT NOT NULL,
  Vehicle__type INT NOT NULL,
  Park_ID INT NOT NULL,
  PRIMARY KEY (Category_ID),
  FOREIGN KEY (Park_ID) REFERENCES Park_Space(Park_ID)
);

CREATE TABLE Parking_Slots
(
  S_No INT NOT NULL,
  S_type INT NOT NULL,
  S_status INT NOT NULL,
  Block_No INT NOT NULL,
  PRIMARY KEY (S_No, Block_No),
  FOREIGN KEY (Block_No) REFERENCES Block_Spaces(Block_No)
);

CREATE TABLE vehicle_cat_price
(
  Category_ID INT NOT NULL,
  Packs_ID INT NOT NULL,
  PRIMARY KEY (Category_ID, Packs_ID),
  FOREIGN KEY (Category_ID) REFERENCES Vehicle_Category(Category_ID),
  FOREIGN KEY (Packs_ID) REFERENCES Price-Packs(Packs_ID)
);

CREATE TABLE has_history
(
  history_ID INT NOT NULL,
  S_No INT NOT NULL,
  Block_No INT NOT NULL,
  PRIMARY KEY (history_ID, S_No, Block_No),
  FOREIGN KEY (history_ID) REFERENCES Slot_history(history_ID),
  FOREIGN KEY (S_No, Block_No) REFERENCES Parking_Slots(S_No, Block_No)
);

CREATE TABLE Vehicle
(
  Vehicle_ID INT NOT NULL,
  Color INT NOT NULL,
  plate_no INT NOT NULL,
  Model INT NOT NULL,
  Make INT NOT NULL,
  Driver_ID INT NOT NULL,
  Category_ID INT NOT NULL,
  PRIMARY KEY (Vehicle_ID),
  FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID),
  FOREIGN KEY (Category_ID) REFERENCES Vehicle_Category(Category_ID)
);
