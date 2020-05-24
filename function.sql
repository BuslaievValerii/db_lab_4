CREATE OR REPLACE TYPE book_row AS OBJECT (book_title VARCHAR2(255 CHAR));
/
CREATE OR REPLACE TYPE book_table IS TABLE OF book_row;
/
CREATE OR REPLACE FUNCTION author_publisher_books (
        var_publisher Publisher.publisher_name%TYPE,
        var_author_name Human.author_name%TYPE
    )
    RETURN book_table PIPELINED
    IS
        CURSOR function_cursor IS
            SELECT
                Book.book_title AS title
            FROM
                Book
                JOIN Publisher ON Publisher.publisher_name = Book.publisher_name
                JOIN BookAuthor ON Book.isbn13 = BookAuthor.isbn13
                JOIN Human ON BookAuthor.author_name = Human.author_name
            WHERE
                Human.author_name = var_author_name
                AND Publisher.publisher_name = var_publisher;
        BEGIN
            FOR function_record IN function_cursor LOOP
                PIPE ROW (book_row(function_record.title));
            END LOOP;
        END;