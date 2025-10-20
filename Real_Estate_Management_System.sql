-- creating tables 

CREATE TABLE Owner (
    OwnerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Contact VARCHAR2(100),
    Email VARCHAR2(100),
    Address VARCHAR2(200),
    NationalID VARCHAR2(20) UNIQUE NOT NULL
);


CREATE TABLE Agent (
    AgentID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Agency VARCHAR2(100),
    Contact VARCHAR2(100),
    Email VARCHAR2(100),
    Experience NUMBER CHECK (Experience >= 0),
    Region VARCHAR2(100)
);

CREATE TABLE Buyer (
    BuyerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Contact VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE,
    BudgetRange VARCHAR2(50),
    PreferredLocation VARCHAR2(100),
    PropertyTypeInterest VARCHAR2(50)
);


CREATE TABLE Property (
    PropertyID NUMBER PRIMARY KEY,
    Title VARCHAR2(100),
    Type VARCHAR2(50),
    Area NUMBER CHECK (Area > 0),
    Price NUMBER CHECK (Price > 0),
    Status VARCHAR2(20) CHECK (Status IN ('Available', 'Sold', 'Rented')),
    Street VARCHAR2(100),
    City VARCHAR2(50),
    State VARCHAR2(50),
    Zip VARCHAR2(10),
    OwnerID NUMBER,
    AgentID NUMBER,
    ListedDate DATE,
    FOREIGN KEY (OwnerID) REFERENCES Owner(OwnerID),
    FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
);


CREATE TABLE Transaction (
    TransactionID NUMBER PRIMARY KEY,
    PropertyID NUMBER,
    BuyerID NUMBER,
    AgentID NUMBER,
    TransactionDate DATE,
    FinalPrice NUMBER CHECK (FinalPrice > 0),
    PaymentStatus VARCHAR2(20) CHECK (PaymentStatus IN ('Pending', 'Completed', 'Cancelled')),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID),
    FOREIGN KEY (AgentID) REFERENCES Agent(AgentID)
);

CREATE TABLE Visit (
    VisitID NUMBER PRIMARY KEY,
    PropertyID NUMBER,
    BuyerID NUMBER,
    VisitDate DATE,
    Feedback VARCHAR2(500),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID)
);


CREATE TABLE Property_Features (
    FeatureID NUMBER,
    PropertyID NUMBER,
    FeatureName VARCHAR2(50),
    Description VARCHAR2(200),
    PRIMARY KEY (PropertyID, FeatureID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);


-- inseting values 

-- Owners
INSERT INTO Owner VALUES (1, 'Ramesh Kumar', '9876543210', 'ramesh@example.com', 'MG Road, Delhi', 'IND1234567');
INSERT INTO Owner VALUES (2, 'Suman Gupta', '9991112222', 'suman@example.com', 'Park Street, Kolkata', 'IND7654321');
INSERT INTO Owner VALUES (3, 'Alok Nath', '8882223333', 'alok@example.com', 'Juhu, Mumbai', 'IND1122334');
INSERT INTO Owner VALUES (4, 'Nidhi Verma', '7775554444', 'nidhi@example.com', 'Sector 21, Noida', 'IND5566778');
INSERT INTO Owner VALUES (5, 'Manoj Tiwari', '6663332222', 'manoj@example.com', 'Baner, Pune', 'IND8899001');
INSERT INTO Owner VALUES (6, 'Divya Shah', '7778889999', 'divya@example.com', 'Bodakdev, Ahmedabad', 'IND3344556');

-- Agents
INSERT INTO Agent VALUES (1, 'Seema Sharma', 'DreamHome', '9999999999', 'seema@dreamhome.com', 5, 'Delhi');
INSERT INTO Agent VALUES (2, 'Aarav Kapoor', 'HouseMax', '8888888888', 'aarav@housemax.com', 4, 'Mumbai');
INSERT INTO Agent VALUES (3, 'Priya Mehta', 'RealSquare', '7777777777', 'priya@realsquare.com', 6, 'Pune');
INSERT INTO Agent VALUES (4, 'Vikram Singh', 'Skyline', '6666666666', 'vikram@skyline.com', 3, 'Kolkata');
INSERT INTO Agent VALUES (5, 'Anjali Joshi', 'PropertyBazaar', '5555555555', 'anjali@propertybazaar.com', 2, 'Noida');
INSERT INTO Agent VALUES (6, 'Rahul Jain', 'UrbanNest', '4444444444', 'rahul@urbannest.com', 7, 'Ahmedabad');

-- Buyers
INSERT INTO Buyer VALUES (1, 'Amit Verma', '8888888888', 'amitv@gmail.com', '50L-70L', 'Delhi', 'Apartment');
INSERT INTO Buyer VALUES (2, 'Kriti Sharma', '7771110000', 'kriti@gmail.com', '30L-50L', 'Mumbai', 'Plot');
INSERT INTO Buyer VALUES (3, 'Sanjay Rao', '9998887777', 'sanjay@gmail.com', '40L-60L', 'Pune', 'Villa');
INSERT INTO Buyer VALUES (4, 'Neha Singh', '6662224444', 'neha@gmail.com', '60L-80L', 'Noida', 'Apartment');
INSERT INTO Buyer VALUES (5, 'Ravi Kapoor', '5559990000', 'ravi@gmail.com', '70L-1Cr', 'Ahmedabad', 'Villa');
INSERT INTO Buyer VALUES (6, 'Sneha Desai', '4441116666', 'sneha@gmail.com', '20L-40L', 'Kolkata', 'Apartment');

-- Properties
INSERT INTO Property VALUES (1, 'Luxury Apartment', 'Apartment', 1500, 6500000, 'Available', 'B1 Street', 'Delhi', 'Delhi', '110001', 1, 1, SYSDATE);
INSERT INTO Property VALUES (2, 'Sea Facing Villa', 'Villa', 3200, 9800000, 'Available', 'Carter Road', 'Mumbai', 'Maharashtra', '400050', 3, 2, SYSDATE);
INSERT INTO Property VALUES (3, 'Budget Plot', 'Plot', 1000, 3200000, 'Available', 'Airoli', 'Mumbai', 'Maharashtra', '400701', 2, 2, SYSDATE);
INSERT INTO Property VALUES (4, 'Modern Flat', 'Apartment', 1800, 7300000, 'Available', 'Sector 137', 'Noida', 'Uttar Pradesh', '201301', 4, 5, SYSDATE);
INSERT INTO Property VALUES (5, 'Countryside Villa', 'Villa', 2500, 8900000, 'Available', 'Baner Road', 'Pune', 'Maharashtra', '411045', 5, 3, SYSDATE);
INSERT INTO Property VALUES (6, 'Compact Studio', 'Apartment', 900, 2700000, 'Available', 'Bodakdev', 'Ahmedabad', 'Gujarat', '380054', 6, 6, SYSDATE);

-- Visits (within last year)
INSERT INTO Visit VALUES (1, 1, 1, SYSDATE - 10, 'Loved the balcony.');
INSERT INTO Visit VALUES (2, 2, 2, SYSDATE - 20, 'Excellent view.');
INSERT INTO Visit VALUES (3, 3, 3, SYSDATE - 30, 'Good location.');
INSERT INTO Visit VALUES (4, 4, 4, SYSDATE - 5, 'Very modern.');
INSERT INTO Visit VALUES (5, 5, 5, SYSDATE - 15, 'Peaceful area.');
INSERT INTO Visit VALUES (6, 6, 6, SYSDATE - 7, 'Cozy studio.');

-- Transactions
INSERT INTO Transaction VALUES (1, 1, 1, 1, SYSDATE - 2, 6400000, 'Completed');
INSERT INTO Transaction VALUES (2, 2, 2, 2, SYSDATE - 3, 9700000, 'Completed');
INSERT INTO Transaction VALUES (3, 3, 3, 2, SYSDATE - 4, 3100000, 'Pending');
INSERT INTO Transaction VALUES (4, 4, 4, 5, SYSDATE - 5, 7200000, 'Completed');
INSERT INTO Transaction VALUES (5, 5, 5, 3, SYSDATE - 6, 8800000, 'Completed');
INSERT INTO Transaction VALUES (6, 6, 6, 6, SYSDATE - 7, 2600000, 'Pending');

-- Property_Features
INSERT INTO Property_Features VALUES (1, 1, 'Balcony', 'Overlooks park');
INSERT INTO Property_Features VALUES (2, 1, 'Swimming Pool', 'Common society pool');
INSERT INTO Property_Features VALUES (3, 2, 'Garden', 'Private garden');
INSERT INTO Property_Features VALUES (4, 3, 'Parking', '2 car spaces');
INSERT INTO Property_Features VALUES (5, 4, 'Gym', 'Well equipped gym');
INSERT INTO Property_Features VALUES (6, 5, 'Terrace', 'Large terrace');




-- necessary queries 



-- List All Properties with Their Owner and Agent Names
SELECT p.PropertyID, p.Title, p.Type, p.Price, p.Status,
       o.Name AS OwnerName, a.Name AS AgentName
FROM Property p
JOIN Owner o ON p.OwnerID = o.OwnerID
JOIN Agent a ON p.AgentID = a.AgentID;



--  Show Transactions with Buyer, Property, and Agent Details
SELECT t.TransactionID, b.Name AS Buyer, p.Title AS Property, a.Name AS Agent,
       t.TransactionDate, t.FinalPrice, t.PaymentStatus
FROM Transaction t
JOIN Buyer b ON t.BuyerID = b.BuyerID
JOIN Property p ON t.PropertyID = p.PropertyID
JOIN Agent a ON t.AgentID = a.AgentID;



-- List All Property Visits with Feedback
SELECT v.VisitID, b.Name AS Buyer, p.Title AS Property, v.VisitDate, v.Feedback
FROM Visit v
JOIN Buyer b ON v.BuyerID = b.BuyerID
JOIN Property p ON v.PropertyID = p.PropertyID;



-- view available properties 
SELECT *
FROM Property
WHERE Status = 'Available';



-- view sold properties 
SELECT *
FROM Property
WHERE Status = 'Sold';



-- view all rented properties 
SELECT *
FROM Property
WHERE Status = 'Rented';



--  List Properties That Have Never Been Visited
SELECT p.PropertyID, p.Title
FROM Property p
LEFT JOIN Visit v ON p.PropertyID = v.PropertyID
WHERE v.VisitID IS NULL;



-- List Properties in Increasing Order of Price:
SELECT *
FROM Property
ORDER BY Price ASC;



--  List Properties in Decreasing Order of Price:
SELECT *
FROM Property
ORDER BY Price DESC;



-- view status-wise property counts 
SELECT Status, COUNT(*) AS Property_Count
FROM Property
GROUP BY Status;




-- PL/SQL important functions/procedures 





-- Add new property
CREATE OR REPLACE PROCEDURE AddProperty (
    p_PropertyID NUMBER,
    p_Title VARCHAR2,
    p_Type VARCHAR2,
    p_Area NUMBER,
    p_Price NUMBER,
    p_Status VARCHAR2,
    p_Street VARCHAR2,
    p_City VARCHAR2,
    p_State VARCHAR2,
    p_Zip VARCHAR2,
    p_OwnerID NUMBER,
    p_AgentID NUMBER
) AS
BEGIN
    INSERT INTO Property (PropertyID, Title, Type, Area, Price, Status, Street, City, State, Zip, OwnerID, AgentID, ListedDate)
    VALUES (p_PropertyID, p_Title, p_Type, p_Area, p_Price, p_Status, p_Street, p_City, p_State, p_Zip, p_OwnerID, p_AgentID, SYSDATE);
END;



-- Record Property Visit 
CREATE OR REPLACE PROCEDURE LogVisit (
    p_VisitID NUMBER,
    p_PropertyID NUMBER,
    p_BuyerID NUMBER,
    p_VisitDate DATE,
    p_Feedback VARCHAR2
) AS
BEGIN
    IF p_VisitDate < ADD_MONTHS(SYSDATE, -12) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Visit date cannot be older than 1 year');
    END IF;

    INSERT INTO Visit VALUES (p_VisitID, p_PropertyID, p_BuyerID, p_VisitDate, p_Feedback);
END;


-- add new buyer 
CREATE OR REPLACE PROCEDURE AddBuyer (
    p_BuyerID NUMBER,
    p_Name VARCHAR2,
    p_Contact VARCHAR2,
    p_Email VARCHAR2,
    p_BudgetRange NUMBER,
    p_PreferredLocation VARCHAR2,
    p_PropertyTypeInterest VARCHAR2
) AS
BEGIN
    INSERT INTO Buyer (BuyerID, Name, Contact, Email, BudgetRange, PreferredLocation, PropertyTypeInterest)
    VALUES (p_BuyerID, p_Name, p_Contact, p_Email, p_BudgetRange, p_PreferredLocation, p_PropertyTypeInterest);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Buyer ' || p_Name || ' added successfully.');
END;
/



-- add new agent 
CREATE OR REPLACE PROCEDURE AddAgent (
    p_AgentID NUMBER,
    p_Name VARCHAR2,
    p_Agency VARCHAR2,
    p_Contact VARCHAR2,
    p_Email VARCHAR2,
    p_Experience NUMBER,
    p_Region VARCHAR2
) AS
BEGIN
    INSERT INTO Agent (AgentID, Name, Agency, Contact, Email, Experience, Region)
    VALUES (p_AgentID, p_Name, p_Agency, p_Contact, p_Email, p_Experience, p_Region);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Agent ' || p_Name || ' added successfully.');
END;
/



-- delete property 
CREATE OR REPLACE PROCEDURE DeleteProperty (
    p_PropertyID IN NUMBER
) AS
BEGIN
    DELETE FROM Property
    WHERE PropertyID = p_PropertyID;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Property ' || p_PropertyID || ' deleted successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Property with ID ' || p_PropertyID || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while deleting property: ' || SQLERRM);
END;
/



-- update transaction 
CREATE OR REPLACE PROCEDURE UpdateTransaction (
    p_TransactionID IN NUMBER,
    p_FinalPrice IN NUMBER,
    p_PaymentStatus IN VARCHAR2
) IS
BEGIN
    -- Update the transaction details for the given TransactionID
    UPDATE Transaction
    SET FinalPrice = p_FinalPrice,
        PaymentStatus = p_PaymentStatus
    WHERE TransactionID = p_TransactionID;

    -- Commit the changes
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transaction ' || p_TransactionID || ' updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Transaction with ID ' || p_TransactionID || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while updating transaction: ' || SQLERRM);
END;
/


-- search property (used cursor)
CREATE OR REPLACE FUNCTION SearchProperty (
    p_City VARCHAR2,
    p_MaxBudget NUMBER
) RETURN SYS_REFCURSOR IS
    result_cursor SYS_REFCURSOR;
BEGIN
    OPEN result_cursor FOR
    SELECT * FROM Property
    WHERE City = p_City AND Price <= p_MaxBudget AND Status = 'Available';
    RETURN result_cursor;
END;


-- Trigger to update property status to sold 
CREATE OR REPLACE TRIGGER trg_UpdatePropertyStatus
AFTER INSERT OR UPDATE ON Transaction
FOR EACH ROW
BEGIN
    -- Only update if the payment status is 'Completed'
    IF :NEW.PaymentStatus = 'Completed' THEN
        UPDATE Property
        SET Status = 'Sold'
        WHERE PropertyID = :NEW.PropertyID;
    END IF;
END;
/

SET SERVEROUTPUT ON;

BEGIN
    -- Add a new Agent
    AddAgent(
        p_AgentID    => 10,
        p_Name       => 'Deepak Rana',
        p_Agency     => 'EliteProperties',
        p_Contact    => '9123456780',
        p_Email      => 'deepak@elite.com',
        p_Experience => 4,
        p_Region     => 'Bangalore'
    );
    DBMS_OUTPUT.PUT_LINE('Agent added.');


    -- Add a new Buyer
    AddBuyer(
        p_BuyerID              => 10,
        p_Name                 => 'Ritika Das',
        p_Contact              => '9876543212',
        p_Email                => 'ritika@gmail.com',
        p_BudgetRange          => '60L-90L',
        p_PreferredLocation    => 'Bangalore',
        p_PropertyTypeInterest => 'Apartment'
    );
    DBMS_OUTPUT.PUT_LINE('Buyer added.');

    -- Add a new Property
    AddProperty(
        p_PropertyID => 10,
        p_Title      => 'Skyview Apartment',
        p_Type       => 'Apartment',
        p_Area       => 1200,
        p_Price      => 7500000,
        p_Status     => 'Available',
        p_Street     => 'MG Road',
        p_City       => 'Bangalore',
        p_State      => 'Karnataka',
        p_Zip        => '560001',
        p_OwnerID    => 1,
        p_AgentID    => 10
    );
    DBMS_OUTPUT.PUT_LINE('Property added.');

    -- Log a Property Visit
    LogVisit(
        p_VisitID   => 10,
        p_PropertyID => 10,
        p_BuyerID    => 10,
        p_VisitDate  => SYSDATE - 5,
        p_Feedback   => 'Nice interiors and location.'
    );
    DBMS_OUTPUT.PUT_LINE('Visit logged.');


END;
/