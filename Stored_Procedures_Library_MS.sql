


CREATE PROCEDURE TheLostTribe1
AS

BEGIN

    SELECT Library_Branch.BranchName,Books.Title,Book_Copies.Number_Of_Copies
    FROM ((Library_Branch
	INNER JOIN Book_Copies ON Library_Branch.BranchID=Book_Copies.BranchID)
	INNER JOIN Books ON Books.BookID=Book_Copies.BookID)
	WHERE Library_Branch.BranchName = 'Sharpstown' AND Books.Title = 'The Lost Tribe';

END;
 

CREATE PROCEDURE TheLostTribe_byBranch
AS
 
BEGIN 

    SELECT Library_Branch.BranchName,Books.Title,Book_Copies.Number_Of_Copies
    FROM ((Library_Branch
	INNER JOIN Book_Copies ON Library_Branch.BranchID=Book_Copies.BranchID)
	INNER JOIN Books ON Books.BookID=Book_Copies.BookID)
	WHERE Books.Title = 'The Lost Tribe';

END;

CREATE PROCEDURE NoBooksCheckedOut
AS
 
BEGIN 

    SELECT Borrower.FullName
    FROM Borrower
	LEFT JOIN Book_Loans ON Borrower.CardNo=Book_Loans.CardNo
	WHERE Book_Loans.DateOut IS NULL;

END;


CREATE PROCEDURE NoBooksCheckedOut
AS
 
BEGIN 

    SELECT Borrower.FullName
    FROM Borrower
	LEFT JOIN Book_Loans ON Borrower.CardNo=Book_Loans.CardNo
	WHERE Book_Loans.DateOut IS NULL;

END;


CREATE PROCEDURE DueTodayAtSharpstown
AS
 
BEGIN 

   DECLARE @vToday AS  DATE;

   SET @vToday =  CONVERT(DATE, GETDATE())

   SELECT Borrower.FullName, Books.Title, Borrower.PostalAddress, Book_Loans.DateDue 

   FROM Borrower 

   INNER JOIN Book_Loans ON Borrower.CardNo=Book_Loans.CardNo
   INNER JOIN Books ON Book_Loans.BookID=Books.BookID
   INNER JOIN Library_Branch ON Book_Loans.BranchID=Library_Branch.BranchID
   WHERE Library_Branch.BranchName = 'Sharpstown' and Book_Loans.DateDue = @vToday

END;


CREATE PROCEDURE NumberOfBooks_ByBranch
AS
 
BEGIN 

   SELECT Library_Branch.BranchName, COUNT(Book_Loans.BranchID) AS NumberOfBooksLoanedOut FROM Book_Loans
   FULL OUTER JOIN Library_Branch ON Library_Branch.BranchID=Book_Loans.BranchID
   GROUP BY BranchName;

END;


CREATE PROCEDURE Borrowers_WithMoreThan5Books
AS

BEGIN
   
  SELECT Borrower.FullName, Borrower.PostalAddress, COUNT(Book_Loans.CardNo) AS NumberOfBooksCheckedOut
  FROM Book_Loans
  FULL OUTER JOIN Borrower ON Borrower.CardNo=Book_Loans.CardNo
  GROUP BY FullName,PostalAddress
  HAVING COUNT(Book_Loans.CardNo) >5;

  END;


CREATE PROCEDURE SKingBooks_atCentral
  AS

   BEGIN
     
	 SELECT Books.Title,Book_Authors.AuthorName, Book_Copies.Number_Of_Copies, Library_Branch.BranchName
	 FROM ((( Books 
	 INNER JOIN Book_Copies ON Books.BookID=Book_Copies.BookID)
	 INNER JOIN Library_Branch ON Library_Branch.BranchID=Book_Copies.BranchID)
	 INNER JOIN Book_Authors ON Book_Authors.BookID=Books.BookID)
	 WHERE Book_Authors.AuthorName = 'Stephen King' AND Library_Branch.BranchName = 'Central';


   END;