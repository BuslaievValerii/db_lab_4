create or replace PROCEDURE Delete_From_Coauthor (
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