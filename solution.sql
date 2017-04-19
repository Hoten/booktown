
--- Order

-- Find all subjects sorted by subject

SELECT * FROM subjects ORDER BY subject;

-- Find all subjects sorted by location

SELECT * FROM subjects ORDER BY location;


--- Where

-- Find the book "Little Women"

SELECT * FROM books WHERE title = 'Little Women';

-- Find all books containing the word "Python"

SELECT * FROM books WHERE title like '%Python%';

-- Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location = 'Main St' ORDER BY subject;


--- Joins

-- Find all books about Computers and list ONLY the book titles

SELECT title FROM books WHERE subject_id = (
    SELECT id FROM subjects WHERE subject = 'Computers' LIMIT 1
);

-- Find all books and display a result table with ONLY the following columns
  -- Book title
  -- Author's first name
  -- Author's last name
  -- Book subject

SELECT title, first_name, last_name, subject
FROM books
JOIN subjects ON books.subject_id = subjects.id
JOIN authors ON books.author_id = authors.id;

-- Find all books that are listed in the stock table
  -- Sort them by retail price (most expensive first)
  -- Display ONLY: title and price

SELECT title, cost
FROM stock
JOIN editions ON stock.isbn = editions.isbn
JOIN books ON books.id = editions.book_id
ORDER BY cost DESC;

-- Find the book "Dune" and display ONLY the following columns
  -- Book title
  -- ISBN number
  -- Publisher name
  -- Retail price

SELECT title, editions.isbn, name, cost
FROM books
JOIN editions ON books.id = editions.book_id
JOIN publishers ON editions.publisher_id = publishers.id
JOIN stock ON editions.isbn = stock.isbn
WHERE title = 'Dune';

-- Find all shipments sorted by ship date display a result table with ONLY the following columns:
  -- Customer first name
  -- Customer last name
  -- ship date
  -- book title




--- Grouping and Counting

-- Get the COUNT of all books

SELECT COUNT(*) FROM books;

-- Get the COUNT of all Locations

SELECT COUNT(DISTINCT(location)) FROM subjects;

-- Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).

SELECT location, COUNT(location) FROM subjects GROUP BY location;


-- List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)

-- Books
-- Editions
--

SELECT books.id, books.title, COUNT(*)
FROM books
JOIN editions ON books.id = editions.book_id
GROUP BY books.id;


-- List how many books each author has written

SELECT authors.first_name, authors.last_name, COUNT(*)
FROM books
JOIN authors ON books.author_id = authors.id
GROUP BY authors.id;

-- what is a union?
-- combines two queries with the same result schema (columns)

(SELECT * FROM books WHERE title LIKE '%The%') UNION (SELECT * FROM books WHERE title LIKE '%oo%');

