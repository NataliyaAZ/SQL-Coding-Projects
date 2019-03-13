
CREATE DATABASE Library_MS;
USE Library_MS;
CREATE TABLE Library_Branch (
   BranchID INT NOT NULL PRIMARY KEY,
   BranchName VARCHAR(50) NOT NULL,
   BranchAddress VARCHAR(50) NOT NULL
);


CREATE TABLE Publisher (
  PublisherName VARCHAR(50) NOT NULL PRIMARY KEY,
  PublisherAddress VARCHAR(50), 
  Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Books (
   BookID VARCHAR(20) NOT NULL PRIMARY KEY,
   Title VARCHAR(200) NOT NULL,
   PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherName)
);

CREATE TABLE Book_Authors (
   BookID VARCHAR(20) NOt NULL FOREIGN KEY REFERENCES Books(BookID),
   AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Copies (
   BookID VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Books(BookID),
   BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch (BranchID),
);

ALTER TABLE Book_Copies 
ADD Number_Of_Copies INT NOT NULL;

CREATE TABLE Borrower (
   CardNo VARCHAR(50) NOT NULL PRIMARY KEY,
   FullName VARCHAR(50) NOT NULL,
   PostalAddress VARCHAR(50),
   Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Book_Loans (
    BookID VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT,
	CardNo VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);


INSERT INTO Library_Branch 
VALUES 
   (101,'Central', '25 University Ave.,Palo Alto,CA 94301'),
   (102,'Sharpstown', '107 Alma St.,Palo Alto,CA 94302'),
   (103,'Parkview', '356 Middlefield Rd.,Palo Alto,CA 94303'),
   (104, 'College Library','2300 Wellesley St.,Palo Alto,CA 94306');


INSERT INTO Publisher 
VALUES 
   ('Penguin Group USA Inc','375 Hudson St, New York, NY 10014','(212) 366-2000'),
   ('Other Press','267 Fifth Avenue, 6th Floor, New York, NY 10016','(212) 414-0054'),
   ('The Overlook Press', '141 Wooster St # 4B, New York, NY 10012','(212) 673-2210'),
   ('HarperCollinsPublishers','195 Broadway, New York, NY 10007','(212) 207-7000'),
   ('Hachette Book Group','237 Park Avenue, New York, NY 10017', '(212) 364-1200');

INSERT INTO Books 
VALUES
   ('1000001', 'The Green Mile', 'Hachette Book Group'),
   ('1000002', 'Dreamcatcher', 'Hachette Book Group'),
   ('1000003','Desperation', 'Hachette Book Group'),
   ('2000001','The Great Gatsby', 'Penguin Group USA Inc'),
   ('2000002', 'The Beautiful and Damned', 'Penguin Group USA Inc'),
   ('2000003', 'Winter Dreams', 'The Overlook Press'),
   ('2000004', 'The Sun Also Rises', 'The Overlook Press'),
   ('2000005', 'For Whom The Bell Tolls','Penguin Group USA Inc'),
   ('2000006', 'A Farewell To Arms','Penguin Group USA Inc'),
   ('3000001', 'Three Comrades','HarperCollinsPublishers'),
   ('3000002', 'Arch of Triumph','HarperCollinsPublishers'),
   ('3000003', 'A Time to Live and a Time to Die', 'Other Press'),
   ('4000001', 'Doctor Zhivago',  'Penguin Group USA Inc'),
   ('4000002', 'The Master and Margarita',  'Penguin Group USA Inc'),
   ('4000003', 'The Cherry Orchard', 'Other Press'),
   ('4000004', 'And Quiet Flows the Don', 'Other Press'),
   ('5000001', 'A Tale of Two Cities', 'Other Press'),
   ('5000002','Great Expectations','HarperCollinsPublishers'),
   ('5000003', 'Animal Farm','The Overlook Press'),
   ('5000004', 'Nineteen Eighty-Four','The Overlook Press');

INSERT INTO Book_Authors 
VALUES
   ('1000001', 'Stephen King'),
   ('1000002', 'Stephen King'),
   ('1000003','Stephen King'),
   ('2000001','F.Scott Fitzgerald'),
   ('2000002', 'F.Scott Fitzgerald'),
   ('2000003', 'F.Scott Fitzgerald'),
   ('2000004', 'Ernest Hemingway'),
   ('2000005', 'Ernest Hemingway'),
   ('2000006', 'Ernest Hemingway'),
   ('3000001', 'Erich Maria Remarque'),
   ('3000002', 'Erich Maria Remarque'),
   ('3000003', 'Erich Maria Remarque'),
   ('4000001', 'Boris Pasternak'),
   ('4000002', 'Mikhail Bulgakov'),
   ('4000003', 'Anton Chekhov'),
   ('4000004', 'Mikhail Sholohov'),
   ('5000001', 'Charles Dickens'),
   ('5000002', 'Charles Dickens'),
   ('5000003', 'George Orwell'),
   ('5000004', 'George Orwell');

INSERT INTO Book_Copies
VALUES
   ('1000001', 101,3),
   ('1000002', 101,2),
   ('2000001', 101,2),
   ('2000002', 101,4),
   ('2000004', 101,3),
   ('2000005', 101,2),
   ('3000002', 101,4),
   ('3000003', 101,3),
   ('4000001', 101,4),
   ('4000002', 101,3),
   ('4000003', 101,4),
   ('5000002', 101,3),
   ('5000003', 101,2),
   ('5000004', 101,2),
   ('1000001', 102,2),
   ('1000002', 102,3),
   ('1000003', 102,2),
   ('2000003', 102,3),
   ('2000004', 102,4),
   ('2000006', 102,2),
   ('3000001', 102,3),
   ('3000003', 102,4),
   ('4000001', 102,3),
   ('4000004', 102,2),
   ('5000001', 102,3),
   ('5000004', 102,4),
   ('1000001', 103,2),
   ('1000003', 103,4),
   ('2000002', 103,3),
   ('2000004', 103,2),
   ('2000005', 103,4),
   ('2000006', 103,2),
   ('3000001', 103,4),
   ('4000003', 103,3),
   ('4000004', 103,2),
   ('5000001', 103,2),
   ('5000002', 103,4),
   ('5000003', 103,3),
   ('5000004', 103,2),
   ('1000001', 104,3),
   ('1000002', 104,2),
   ('1000003', 104,2),
   ('2000003', 104,3),
   ('2000004', 104,4),
   ('2000005', 104,3),
   ('3000001', 104,2),
   ('3000002', 104,2),
   ('3000003', 104,3),
   ('4000001', 104,3),
   ('4000002', 104,4),
   ('4000003', 104,2),
   ('5000001', 104,4),
   ('5000002', 104,2),
   ('5000004', 104,3);

INSERT INTO Books 
VALUES ('6000001','The Lost Tribe', 'Other Press');

INSERT INTO Book_Authors
VALUES ('6000001','Mark W. Lee');

INSERT INTO Book_Copies
VALUES ('6000001',102,3), ('6000001',103,2), ('6000001',101,4);

INSERT INTO Borrower
VALUES
   ('0000010','James Goodwill','325 Arastradero Rd., Palo Alto, CA 94306', '415-234-7645'),
   ('0000011','Cathy Dowler', '2170 El Camino Real, Palo Alto, CA  94305', '650-150-1234'),
   ('0000012', 'Tom Williams', '512 Fern Rd., Palo Alto, CA 94305', '415-246-4583'),
   ('0000013', 'Amy Miller', '24 Ash St., Apt.101, Palo Alto, CA 94304', '415-32-5657'),
   ('0000014', 'David Wilson', '456 College Ave., Palo Alto, CA 94304', '650-123-5687'),
   ('0000015', 'Emma Davis', '2456 Sheridan Ave., Apt.205, Palo Alto, CA 94306', '415-789-4534'),
   ('0000016', 'Adrian Brown', '589 Park Blvd., Apt.302, Palo Alto, CA 94302', '415-456-6795'), 
   ('0000017', 'Mia Jones', '957 Leland Ave., Palo Alto, CA 94302', '415-345-6785');

INSERT INTO Book_Loans
VALUES
   ('1000001', 101,'0000017', '2019-03-01', '2019-03-22'),
   ('1000001', 101,'0000010', '2019-03-02', '2019-03-23'),
   ('1000002', 101,'0000010', '2019-03-02', '2019-03-23'),
   ('2000001', 101,'0000012', '2019-03-05', '2019-03-26'),
   ('2000002', 101,'0000010', '2019-03-02', '2019-03-23'),
   ('2000004', 101,'0000010', '2019-03-02', '2019-03-23'),
   ('2000005', 101,'0000010', '2019-03-02', '2019-03-23'),
   ('3000002', 101,'0000012', '2019-03-05', '2019-03-26'),
   ('3000003', 101,'0000017', '2019-03-01', '2019-03-22'),
   ('4000001', 101,'0000010', '2019-03-02', '2019-03-23'),
   ('4000002', 101,'0000012', '2019-03-05', '2019-03-26'),
   ('4000003', 101,'0000012', '2019-03-05', '2019-03-26'),
   ('5000002', 101,'0000017', '2019-03-01', '2019-03-22'),
   ('5000003', 101,'0000012', '2019-03-05', '2019-03-26'),
   ('5000004', 101,'0000017', '2019-03-01', '2019-03-22'),
   ('1000001', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('1000002', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('1000003', 102,'0000012', '2019-03-12', '2019-04-02'),
   ('2000003', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('2000004', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('2000006', 102,'0000012', '2019-03-12', '2019-04-02'),
   ('3000001', 102,'0000012', '2019-03-12', '2019-04-02'),
   ('3000003', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('4000001', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('4000004', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('5000001', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('5000004', 102,'0000011', '2019-02-19', '2019-03-12'),
   ('1000001', 103,'0000013', '2019-02-20', '2019-03-13'),
   ('1000003', 103,'0000013', '2019-02-20', '2019-03-13'),
   ('2000002', 103,'0000014', '2019-02-21', '2019-03-14'),
   ('2000004', 103,'0000013', '2019-02-20', '2019-03-13'),
   ('2000005', 103,'0000014', '2019-02-21', '2019-03-14'),
   ('2000006', 103,'0000014', '2019-02-21', '2019-03-14'),
   ('4000004', 103,'0000014', '2019-02-21', '2019-03-14'),
   ('5000001', 103,'0000016', '2019-02-23', '2019-03-16'),
   ('5000002', 103,'0000016', '2019-02-23', '2019-03-16'),
   ('5000003', 103,'0000016', '2019-02-23', '2019-03-16'),
   ('1000001', 104,'0000015', '2019-02-22', '2019-03-15'),
   ('1000002', 104,'0000015', '2019-02-22', '2019-03-15'),
   ('1000003', 104,'0000015', '2019-02-22', '2019-03-15'),
   ('3000001', 104,'0000015', '2019-02-22', '2019-03-15'),
   ('3000002', 104,'0000017', '2019-03-11', '2019-04-01'),
   ('3000003', 104,'0000017', '2019-03-11', '2019-04-01'),
   ('4000001', 104,'0000017', '2019-03-11', '2019-04-01'),
   ('4000002', 104,'0000013', '2019-03-07', '2019-03-28'),
   ('4000003', 104,'0000013', '2019-03-07', '2019-03-28'),
   ('5000001', 104,'0000014', '2019-03-09', '2019-03-30'),
   ('5000002', 104,'0000014', '2019-03-09', '2019-03-30'),
   ('5000004', 104,'0000014', '2019-03-09', '2019-03-30'),
   ('6000001', 102,'0000013', '2019-03-07', '2019-03-28'),
   ('6000001', 101,'0000016', '2019-03-09', '2019-03-30');

INSERT INTO Borrower
VALUES
   ('0000018','Kerry Johnson','564 Arastradero Rd., Palo Alto, CA 94306', '415-123-9876');

 