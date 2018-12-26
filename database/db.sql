INSERT INTO books
   (book_title,book_number,publication_year, author)
VALUES
   ('One Piece', 1 , 1996, 'Eichiro Oda'),
   ('Dragon Ball', 2 , 1990, 'Akagami Shanks'),
   ('Detektif Conan', 3 , 1995, 'Takanome Mihawk'),
   ('Kungfu Boy', 4 , 1992, 'Sengoku');
SELECT * FROM books;

INSERT INTO borrowing
   (date_borrowing,date_returning)
VALUES
   ('test tanggal', 'test tanggal2')
SELECT * FROM borrowing;