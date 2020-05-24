CREATE OR REPLACE TRIGGER Book_Insert_Trigger
    BEFORE INSERT
    ON Book
    FOR EACH ROW
    
    BEGIN
        IF :new.num_pages < 10 THEN
            RAISE_APPLICATION_ERROR (-20200, 'You cant insert this book, its too short');
        END IF;
    END;

CREATE TABLE book (
    isbn13          NUMBER(13) NOT NULL,
    book_title      VARCHAR2(255 CHAR),
    num_pages       INTEGER,
    date_published  DATE,
    publisher_name  VARCHAR2(100 CHAR) NOT NULL,
    language_code   VARCHAR2(12 CHAR) NOT NULL
);

ALTER TABLE book ADD CONSTRAINT book_pk PRIMARY KEY ( isbn13 );

CREATE TABLE bookauthor (
    isbn13       NUMBER(13) NOT NULL,
    author_name  VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE bookauthor ADD CONSTRAINT bookauthor_pk PRIMARY KEY ( isbn13,
                                                                  author_name );

CREATE TABLE bookcoauthor (
    isbn13         NUMBER(13) NOT NULL,
    coauthor_name  VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE bookcoauthor ADD CONSTRAINT bookcoauthor_pk PRIMARY KEY ( isbn13,
                                                                      coauthor_name );

CREATE TABLE human (
    author_name VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE human ADD CONSTRAINT human_pk PRIMARY KEY ( author_name );

CREATE TABLE language (
    language_code VARCHAR2(12 CHAR) NOT NULL
);

ALTER TABLE language ADD CONSTRAINT language_pk PRIMARY KEY ( language_code );

CREATE TABLE publisher (
    publisher_name VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE publisher ADD CONSTRAINT publisher_pk PRIMARY KEY ( publisher_name );

CREATE TABLE review (
    isbn13          NUMBER(13) NOT NULL,
    curr_date       DATE NOT NULL,
    reviews_count   INTEGER,
    ratings_count   INTEGER,
    average_rating  FLOAT(1)
);

ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( isbn13,
                                                          curr_date );

ALTER TABLE book
    ADD CONSTRAINT book_language_fk FOREIGN KEY ( language_code )
        REFERENCES language ( language_code );

ALTER TABLE book
    ADD CONSTRAINT book_publisher_fk FOREIGN KEY ( publisher_name )
        REFERENCES publisher ( publisher_name );

ALTER TABLE bookauthor
    ADD CONSTRAINT bookauthor_book_fk FOREIGN KEY ( isbn13 )
        REFERENCES book ( isbn13 );

ALTER TABLE bookauthor
    ADD CONSTRAINT bookauthor_human_fk FOREIGN KEY ( author_name )
        REFERENCES human ( author_name );

ALTER TABLE bookcoauthor
    ADD CONSTRAINT bookcoauthor_book_fk FOREIGN KEY ( isbn13 )
        REFERENCES book ( isbn13 );

ALTER TABLE bookcoauthor
    ADD CONSTRAINT bookcoauthor_human_fk FOREIGN KEY ( coauthor_name )
        REFERENCES human ( author_name );

ALTER TABLE review
    ADD CONSTRAINT review_book_fk FOREIGN KEY ( isbn13 )
        REFERENCES book ( isbn13 );