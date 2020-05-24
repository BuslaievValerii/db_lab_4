INSERT INTO Language (language_code) VALUES ('eng');
INSERT INTO Language (language_code) VALUES ('en-US');
INSERT INTO Language (language_code) VALUES ('fre');

INSERT INTO Publisher (publisher_name) VALUES ('Scholastic Inc.');
INSERT INTO Publisher (publisher_name) VALUES ('Scholastic');
INSERT INTO Publisher (publisher_name) VALUES ('Nimble Books');

INSERT INTO Human (author_name) VALUES ('J. K. Rowling');
INSERT INTO Human (author_name) VALUES ('Mary GrandPre');
INSERT INTO Human (author_name) VALUES ('W. Frederick Zimmerman');

INSERT INTO Book (isbn13, book_title, num_pages, date_published, publisher_name, language_code)
VALUES (9780439785969, 'Harry Potter and the Half-Blood Prince', 652, TO_DATE('09/16/2006', 'mm/dd/yyyy'), 'Scholastic Inc.', 'eng');
INSERT INTO Book (isbn13, book_title, num_pages, date_published, publisher_name, language_code)
VALUES (9780439358071, 'Harry Potter and the Order of the Phoenix', 870, TO_DATE('09/01/2004', 'mm/dd/yyyy'), 'Scholastic Inc.', 'eng');
INSERT INTO Book (isbn13, book_title, num_pages, date_published, publisher_name, language_code)
VALUES (9780439554893, 'Harry Potter and the Chamber of Secrets', 352, TO_DATE('11/01/2003', 'mm/dd/yyyy'), 'Scholastic', 'eng');
INSERT INTO Book (isbn13, book_title, num_pages, date_published, publisher_name, language_code)
VALUES (9780439655484, 'Harry Potter and the Prisoner of Azkaban', 435, TO_DATE('05/01/2004', 'mm/dd/yyyy'), 'Scholastic Inc.', 'eng');
INSERT INTO Book (isbn13, book_title, num_pages, date_published, publisher_name, language_code)
VALUES (9780439682589, 'Harry Potter Boxed Set Books 1-5', 2690, TO_DATE('09/13/2004', 'mm/dd/yyyy'), 'Scholastic', 'eng');
INSERT INTO Book (isbn13, book_title, num_pages, date_published, publisher_name, language_code)
VALUES (9780976540601, 'Half-Blood Prince Analysis and Speculation', 152, TO_DATE('04/26/2005', 'mm/dd/yyyy'), 'Nimble Books', 'en-US');

INSERT INTO BookAuthor (isbn13, author_name)
VALUES (9780439785969, 'J. K. Rowling');
INSERT INTO BookAuthor (isbn13, author_name)
VALUES (9780439358071, 'J. K. Rowling');
INSERT INTO BookAuthor (isbn13, author_name)
VALUES (9780439554893, 'J. K. Rowling');
INSERT INTO BookAuthor (isbn13, author_name)
VALUES (9780439655484, 'J. K. Rowling');
INSERT INTO BookAuthor (isbn13, author_name)
VALUES (9780439682589, 'J. K. Rowling');
INSERT INTO BookAuthor (isbn13, author_name)
VALUES (9780976540601, 'W. Frederick Zimmerman');

INSERT INTO BookCoauthor (isbn13, coauthor_name)
VALUES (9780439785969, 'Mary GrandPre');
INSERT INTO BookCoauthor (isbn13, coauthor_name)
VALUES (9780439358071, 'Mary GrandPre');
INSERT INTO BookCoauthor (isbn13, coauthor_name)
VALUES (9780439655484, 'Mary GrandPre');
INSERT INTO BookCoauthor (isbn13, coauthor_name)
VALUES (9780439682589, 'Mary GrandPre');

INSERT INTO Review (isbn13, curr_date, reviews_count, ratings_count, average_rating)
VALUES (9780439785969, TO_DATE('23/05/2020', 'dd/mm/yyyy'), 27591, 2095690, 4.57);
INSERT INTO Review (isbn13, curr_date, reviews_count, ratings_count, average_rating)
VALUES (9780439358071, TO_DATE('23/05/2020', 'dd/mm/yyyy'), 29221, 2153167, 4.49);
INSERT INTO Review (isbn13, curr_date, reviews_count, ratings_count, average_rating)
VALUES (9780439554893, TO_DATE('23/05/2020', 'dd/mm/yyyy'), 244, 6333, 4.42);
INSERT INTO Review (isbn13, curr_date, reviews_count, ratings_count, average_rating)
VALUES (9780439655484, TO_DATE('23/05/2020', 'dd/mm/yyyy'), 36325, 2339585, 4.56);
INSERT INTO Review (isbn13, curr_date, reviews_count, ratings_count, average_rating)
VALUES (9780439682589, TO_DATE('23/05/2020', 'dd/mm/yyyy'), 164, 41428, 4.78);
INSERT INTO Review (isbn13, curr_date, reviews_count, ratings_count, average_rating)
VALUES (9780976540601, TO_DATE('23/05/2020', 'dd/mm/yyyy'), 1, 19, 3.74);