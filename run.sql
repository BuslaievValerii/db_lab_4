BEGIN
    DBMS_OUTPUT.enable;
END;
/
SET SERVEROUTPUT ON;

DECLARE
    CURSOR function_test_cursor IS
        SELECT *
        FROM Table(author_publisher_books('Scholastic Inc.', 'J. K. Rowling'));
    var_title book.book_title%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Testing procedure');
    DBMS_OUTPUT.PUT_LINE('Now it will work:');
    DBMS_OUTPUT.PUT_LINE(' ');
    delete_from_coauthor(9780439682589, 'Mary GrandPre');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('And now it wont:');
    DBMS_OUTPUT.PUT_LINE(' ');
    delete_from_coauthor(9780439682589, 'Mary GrandPre');
    
    DBMS_OUTPUT.PUT_LINE('----------------------------');
    
    DBMS_OUTPUT.PUT_LINE('Testing function');
    DBMS_OUTPUT.PUT_LINE('It will show all the books by J. K. Rowling published in Scholastic Inc.');
    DBMS_OUTPUT.PUT_LINE(' ');
    FOR book_record IN function_test_cursor LOOP
        var_title := book_record.book_title;
        DBMS_OUTPUT.PUT_LINE(var_title);
    END LOOP;
END;