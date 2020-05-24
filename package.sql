CREATE OR REPLACE PACKAGE book_author_publisher_package IS
    TYPE book_row IS RECORD (book_title Book.book_title%TYPE);
    TYPE book_table IS TABLE OF book_row;

    PROCEDURE Delete_From_Coauthor (
            par_isbn13 BookCoauthor.isbn13%TYPE,
            par_coauthor_name BookCoauthor.coauthor_name%TYPE);
    
    FUNCTION author_publisher_books (
        var_publisher Publisher.publisher_name%TYPE,
        var_author_name Human.author_name%TYPE)
    RETURN book_table PIPELINED;
END book_author_publisher_package;
/
CREATE OR REPLACE PACKAGE BODY book_author_publisher_package IS
    PROCEDURE Delete_From_Coauthor (
            par_isbn13 BookCoauthor.isbn13%TYPE,
            par_coauthor_name BookCoauthor.coauthor_name%TYPE)
        AS
            cur_isbn13 BookCoauthor.isbn13%TYPE;
            cur_coauthor_name BookCoauthor.coauthor_name%TYPE;
        BEGIN
            SELECT isbn13 INTO cur_isbn13 FROM BookCoauthor WHERE isbn13 = par_isbn13 AND coauthor_name = par_coauthor_name;
            SELECT coauthor_name INTO cur_coauthor_name FROM BookCoauthor WHERE isbn13 = par_isbn13 AND coauthor_name = par_coauthor_name;

            DELETE FROM BookCoauthor WHERE isbn13 = par_isbn13 AND coauthor_name = par_coauthor_name;
            DBMS_OUTPUT.put_line('Coauthor was deleted from book');
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.put_line('Error');
                DBMS_OUTPUT.put_line('Book or coauthor was not found');
        END;

    FUNCTION author_publisher_books (
            var_publisher Publisher.publisher_name%TYPE,
            var_author_name Human.author_name%TYPE
        )
        RETURN book_table PIPELINED
        IS
            CURSOR function_cursor IS
                SELECT
                    Book.book_title
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
                    PIPE ROW (function_record);
                END LOOP;
            END;
END book_author_publisher_package;