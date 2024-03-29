-- Create a table in the database to store customer responses to our anniversary invitation.

-- Associate a customer's ID number with the number of people they plan to bring in their party.
CREATE TABLE IF NOT EXISTS PartyAttendances (
  AttendanceID INTEGER PRIMARY KEY AUTOINCREMENT,
  CustomerID INTEGER,
  PartySize INTEGER,
  FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);