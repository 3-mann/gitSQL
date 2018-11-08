/* Script to build the ONLINE Bookstore Application 
   for the Oracle Database 12c: SQL Fundamentals I course.   
*/

PROMPT Please wait while tables are dropped and created.





DROP TABLE AUTHOR CASCADE CONSTRAINTS 
;
DROP TABLE PUBLISHER CASCADE CONSTRAINTS 
;
DROP TABLE BOOKS CASCADE CONSTRAINTS 
;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS 
;
DROP TABLE CREDIT_CARD_DETAILS CASCADE CONSTRAINTS 
;
DROP TABLE ORDER_DETAILS CASCADE CONSTRAINTS 
;
DROP TABLE PURCHASE_HISTORY CASCADE CONSTRAINTS 
;
DROP TABLE SHIPPING_TYPE CASCADE CONSTRAINTS 
;
DROP TABLE SHOPPING_CART CASCADE CONSTRAINTS 
;
DROP SEQUENCE order_id_seq
;

CREATE SEQUENCE order_id_seq
START WITH 100
NOCACHE;


CREATE TABLE AUTHOR 
    ( 
      Author_ID VARCHAR2 (10)  NOT NULL , 
      Author_Name VARCHAR2 (20) 
    ) 
;



COMMENT ON TABLE AUTHOR IS 'Author'
;


ALTER TABLE AUTHOR 
    ADD CONSTRAINT AUTHOR_PK PRIMARY KEY (Author_ID) ;



CREATE TABLE BOOKS 
    ( 
     Book_ID VARCHAR2 (10)  NOT NULL , 
     Book_Name VARCHAR2 (50) , 
     Author_ID VARCHAR2 (10)  NOT NULL , 
     Price NUMBER (10) , 
     Publisher_ID VARCHAR2 (10)  NOT NULL 
    ) 
;



COMMENT ON TABLE BOOKS IS 'Books'
;


ALTER TABLE BOOKS 
    ADD CONSTRAINT books_PK PRIMARY KEY (Book_ID) ;



CREATE TABLE CUSTOMER 
    ( 
      Customer_ID VARCHAR2 (6) NOT NULL ,
      Customer_Name VARCHAR2 (40) , 
      Street_Address VARCHAR2 (50) , 
      City VARCHAR2 (25) ,   
      Phone_Number VARCHAR2 (15) , 
      Credit_Card_Number VARCHAR2 (20) NOT NULL 
      )
;




COMMENT ON TABLE AUTHOR IS 'Customer'
;

ALTER TABLE CUSTOMER
   ADD CONSTRAINT Cust_ID_PK PRIMARY KEY(Customer_ID);


CREATE TABLE CREDIT_CARD_DETAILS
    ( 
     Credit_Card_Number VARCHAR2 (20) NOT NULL , 
     Credit_Card_Type VARCHAR2 (10) , 
     Expiry_Date DATE
     )
;



COMMENT ON TABLE CREDIT_CARD_DETAILS IS 'Credit_Card_Details'
;

ALTER TABLE CREDIT_CARD_DETAILS
   ADD CONSTRAINT CC_NUMBER_PK PRIMARY KEY(Credit_Card_Number);



CREATE TABLE ORDER_DETAILS
    ( 
     Order_ID VARCHAR2(6)  NOT NULL , 
     Customer_ID VARCHAR2(6),
     Shipping_Type VARCHAR2(10)  NOT NULL , 
     Date_of_Purchase DATE , 
     Shopping_Cart_ID VARCHAR2 (10)  NOT NULL 
    ) 
;



COMMENT ON TABLE ORDER_DETAILS IS 'Order_Details'
;


ALTER TABLE ORDER_DETAILS 
    ADD CONSTRAINT Order_ID_PK PRIMARY KEY (Order_ID) ;



CREATE TABLE PUBLISHER 
    ( 
      Publisher_ID VARCHAR2 (10)  NOT NULL , 
      Publisher_Name VARCHAR2 (50) 
    ) 
;



COMMENT ON TABLE PUBLISHER IS 'Publisher'
;


ALTER TABLE PUBLISHER 
    ADD CONSTRAINT PUBLISHER_PK PRIMARY KEY (Publisher_ID) ;



CREATE TABLE PURCHASE_HISTORY
    ( 
     Customer_ID VARCHAR2 (6) , 
     Order_ID VARCHAR2 (6)  NOT NULL 
    ) 
;



COMMENT ON TABLE PURCHASE_HISTORY IS 'Purchase_History'
;



CREATE TABLE SHIPPING_TYPE 
    ( 
     Shipping_Type VARCHAR2 (10)  NOT NULL , 
     Shipping_Price NUMBER (6) 
    ) 
;



COMMENT ON TABLE SHIPPING_TYPE  IS 'Shipping_Type'
;


ALTER TABLE SHIPPING_TYPE  
    ADD CONSTRAINT SHIPPING_TYPE_PK PRIMARY KEY (Shipping_Type) ;



CREATE TABLE SHOPPING_CART
    ( 
     Shopping_Cart_ID VARCHAR2 (10)  NOT NULL , 
     Book_ID VARCHAR2 (10)  NOT NULL , 
     Price NUMBER (10) , 
     Shopping_cart_date DATE , 
     Quantity NUMBER (6) 
    ) 
;



COMMENT ON TABLE SHOPPING_CART IS 'Shopping_Cart'
;


ALTER TABLE SHOPPING_CART
    ADD CONSTRAINT SHOPPING_CART_PK PRIMARY KEY (Shopping_Cart_ID) ;




ALTER TABLE BOOKS 
    ADD CONSTRAINT BOOKS_AUTHOR_FK FOREIGN KEY 
    ( 
     Author_ID
    ) 
    REFERENCES AUTHOR 
    ( 
      Author_ID
    ) 
;


ALTER TABLE BOOKS 
    ADD CONSTRAINT BOOKS_PUBLISHER_FK FOREIGN KEY 
    ( 
     Publisher_ID
    ) 
    REFERENCES PUBLISHER 
    ( 
     Publisher_ID
    ) 
;


ALTER TABLE ORDER_DETAILS 
    ADD CONSTRAINT Order_ID_FK FOREIGN KEY 
    ( 
     Customer_ID
    ) 
    REFERENCES CUSTOMER 
    ( 
     Customer_ID
    ) 
;


ALTER TABLE ORDER_DETAILS 
    ADD CONSTRAINT FK_Order_details FOREIGN KEY 
    ( 
     Shipping_Type
    ) 
    REFERENCES SHIPPING_TYPE
    ( 
     Shipping_Type
    ) 
;


ALTER TABLE ORDER_DETAILS
    ADD CONSTRAINT Order_Details_fk FOREIGN KEY 
    ( 
      Shopping_Cart_ID
    ) 
    REFERENCES SHOPPING_CART 
    ( 
     Shopping_Cart_ID
    ) 
;


ALTER TABLE PURCHASE_HISTORY
    ADD CONSTRAINT PUR_HIST_FK FOREIGN KEY 
    ( 
     Order_ID
    ) 
    REFERENCES ORDER_DETAILS
    ( 
     Order_ID
    )  
;


ALTER TABLE PURCHASE_HISTORY 
    ADD CONSTRAINT FK_Pur_Hist FOREIGN KEY 
    ( 
     Customer_ID
    ) 
    REFERENCES CUSTOMER 
    ( 
     Customer_ID
    ) 
;


ALTER TABLE SHOPPING_CART 
    ADD CONSTRAINT SHOPPING_CART_BOOKS_FK FOREIGN KEY 
    ( 
     Book_ID
    ) 
    REFERENCES BOOKS 
    ( 
      Book_ID
    ) 
;



PROMPT ** Sequence created

PROMPT ** Tables built and sequence created**


-- Adding data to the tables

-- Inserting data into the AUTHOR table

INSERT INTO author(author_id, author_name)
VALUES ('AN0001','Oliver Goldsmith')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0002','Oscar Wilde')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0003','George Bernard Shaw')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0004','Leo Tolstoy')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0005','Percy Shelley')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0006','Lord Byron')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0007','John Keats')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0008','Rudyard Kipling')
/

INSERT INTO author(author_id, author_name)
VALUES ('AN0009','P. G. Wodehouse')
/

-- Inserting data into PUBLISHER table

INSERT INTO publisher(publisher_id, publisher_name)
VALUES ('PN0001','Elsevier')
/

INSERT INTO publisher(publisher_id, publisher_name)
VALUES ('PN0002','Penguin Group')
/

INSERT INTO publisher(publisher_id, publisher_name)
VALUES ('PN0003','Pearson Education')
/

INSERT INTO publisher(publisher_id, publisher_name)
VALUES ('PN0004','Cambridge University Press ')
/

INSERT INTO publisher(publisher_id, publisher_name)
VALUES ('PN0005','Dorling Kindersley ')
/

-- Inserting data into SHIPPING_TYPE table

INSERT INTO shipping_type(Shipping_Type, Shipping_Price)
VALUES ('USPS',200)
/

INSERT INTO shipping_type(Shipping_Type, Shipping_Price)
VALUES ('FedEx',250)
/

INSERT INTO shipping_type(Shipping_Type, Shipping_Price)
VALUES ('DHL',150)
/




-- Inserting data into CUSTOMER table

INSERT INTO customer(customer_id, customer_name, street_address,city,phone_number,credit_card_number) 
VALUES('CN0001','VelasquezCarmen','283 King Street','Seattle','587-99-6666','000-111-222-333') 
/

INSERT INTO customer VALUES
('CN0002','Ngao LaDoris','5 Modrany','Bratislava','586-355-8882','000-111-222-444') 
/
  
INSERT INTO customer VALUES
('CN0003','Nagayama Midori','68 Via Centrale','Sao Paolo','254-852-5764','000-111-222-555')                
/

INSERT INTO customer VALUES
('CN0004','Quick-To-See Mark','6921 King Way','Lagos','63-559-777','000-111-222-666') 
/
        
INSERT INTO customer VALUES 
('CN0005','Ropeburn Audry','86 Chu Street','Hong Kong','41-559-87','000-111-222-777')  
/
                                                                         
INSERT INTO customer VALUES
('CN0006','Urguhart Molly','3035 Laurier Blvd.','Quebec','418-542-9988','000-111-222-888')
/

INSERT INTO customer VALUES 
('CN0007','Menchu Roberta','Boulevard de Waterloo 41','Brussels','322-504-2228','000-111-222-999')
/

INSERT INTO customer VALUES 
('CN0008','Biri Ben','398 High St.','Columbus','614-455-9863','000-111-222-222')
/

INSERT INTO customer VALUES 
('CN0009','Catchpole Antoinette','88 Alfred St.','Brisbane','616-399-1411','000-111-222-111')
/


-- Inserting Data into CREDIT_CARD_DETAILS  table

INSERT INTO credit_card_details(credit_card_number,credit_card_type,expiry_date) 
VALUES ('000-111-222-333','VISA',TO_DATE('17-JUN-2009','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES ('000-111-222-444','MasterCard',TO_DATE('24-SEP-2005','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES('000-111-222-555','AMEX',TO_DATE('11-JUL-2006','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES('000-111-222-666','VISA',TO_DATE('22-OCT-2008','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES('000-111-222-777','AMEX',TO_DATE('26-AUG-2000','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES('000-111-222-888','MasterCard',TO_DATE('15-MAR-2008','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES('000-111-222-999','VISA',TO_DATE('4-AUG-2009','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES('000-111-222-111','Maestro',TO_DATE('27-SEP-2001','DD-MON-YYYY'))
/

INSERT INTO credit_card_details
VALUES('000-111-222-222','AMEX',TO_DATE('9-AUG-2004','DD-MON-YYYY'))
/

-- Inserting Data into BOOKS table

INSERT INTO books
VALUES ('BN0001','Florentine Tragedy','AN0002',150,'PN0002')
/

INSERT INTO books
VALUES ('BN0002','A Vision','AN0002',100,'PN0003')
/

INSERT INTO books
VALUES ('BN0003','Citizen of the World','AN0001',100,'PN0001')
/


INSERT INTO books
VALUES ('BN0004','The Complete Poetical Works of Oliver Goldsmith','AN0001',300,'PN0001')
/


INSERT INTO books
VALUES ('BN0005','Androcles and the Lion','AN0003',90,'PN0004')
/


INSERT INTO books
VALUES ('BN0006','An Unsocial Socialist','AN0003',80,'PN0004')
/

INSERT INTO books
VALUES ('BN0007','A Thing of Beauty is a Joy Forever','AN0007',100,'PN0002')
/

INSERT INTO books
VALUES ('BN0008','Beyond the Pale','AN0008',75,'PN0005')
/

INSERT INTO books
VALUES ('BN0009','The Clicking of Cuthbert','AN0009',175,'PN0005')
/

INSERT INTO books
VALUES ('BN0010','Bride of Frankenstein','AN0006',200,'PN0001')
/

INSERT INTO books
VALUES ('BN0011','Shelley Poetry and Prose','AN0005',150,'PN0003')
/


INSERT INTO books
VALUES ('BN0012','War and Peace','AN0004',150,'PN0002')
/






-- Inserting Data into SHOPPING_CART  table

INSERT INTO shopping_cart(shopping_cart_id, book_id, price, Shopping_cart_date,quantity) 
VALUES ('SC0001','BN0002','200',TO_DATE('12-JUN-2001','DD-MON-YYYY'),'10')
/

INSERT INTO shopping_cart
VALUES ('SC0002','BN0003','90',TO_DATE('31-JUL-2005','DD-MON-YYYY'),'8')
/

INSERT INTO shopping_cart
VALUES ('SC0003','BN0003','175',TO_DATE('28-JUN-2005','DD-MON-YYYY'),'7')
/

INSERT INTO shopping_cart
VALUES ('SC0004','BN0001','80',TO_DATE('14-AUG-2006','DD-MON-YYYY'),'9')
/

INSERT INTO shopping_cart
VALUES ('SC0005','BN0001','175',TO_DATE('21-SEP-2006','DD-MON-YYYY'),'4')
/

INSERT INTO shopping_cart
VALUES ('SC0006','BN0004','100',TO_DATE('11-AUG-2007','DD-MON-YYYY'),'6')
/

INSERT INTO shopping_cart 
VALUES ('SC0007','BN0005','200',TO_DATE('28-OCT-2007','DD-MON-YYYY'),'5')
/

INSERT INTO shopping_cart
VALUES ('SC0008','BN0006','100',TO_DATE('25-NOV-2009','DD-MON-YYYY'),'7')
/

INSERT INTO shopping_cart
VALUES ('SC0009','BN0006','150',TO_DATE('18-SEP-2009','DD-MON-YYYY'),'8')
/

-- Inserting Data into ORDER_DETAILS  table


INSERT INTO order_details(order_id, customer_id, shipping_type, date_of_purchase, shopping_cart_id) 
VALUES ('OD0001', 'CN0001','USPS',TO_DATE('12-JUN-2001','DD-MON-YYYY'),'SC0002')
/

INSERT INTO order_details
VALUES ('OD0002','CN0002','USPS',TO_DATE('28-JUN-2005','DD-MON-YYYY'),'SC0005')
/

INSERT INTO order_details
VALUES ('OD0003','CN0003','FedEx',TO_DATE('31-JUL-2005','DD-MON-YYYY'),'SC0007')
/

INSERT INTO order_details
VALUES ('OD0004','CN0004','FedEx',TO_DATE('14-AUG-2006','DD-MON-YYYY'),'SC0004')
/

INSERT INTO order_details
VALUES ('OD0005','CN0005','FedEx',TO_DATE('21-SEP-2006','DD-MON-YYYY'),'SC0003')
/

INSERT INTO order_details
VALUES ('OD0006','CN0006','DHL',TO_DATE('28-OCT-2007','DD-MON-YYYY'),'SC0001')
/

INSERT INTO order_details
VALUES ('OD0007','CN0007','DHL',TO_DATE('11-AUG-2007','DD-MON-YYYY'),'SC0006')
/

INSERT INTO order_details
VALUES ('OD0008','CN0008','DHL',TO_DATE('18-SEP-2009','DD-MON-YYYY'),'SC0008')
/

INSERT INTO order_details
VALUES ('OD0009','CN0009','USPS',TO_DATE('25-NOV-2009','DD-MON-YYYY'),'SC0009')

/ 

-- Inserting Data into PURCHASE_HISTORY  table

INSERT INTO purchase_history(customer_id, order_id) 
VALUES ('CN0001','OD0001')
/


INSERT INTO purchase_history
VALUES ('CN0003','OD0002')
/

INSERT INTO purchase_history
VALUES ('CN0004','OD0005')
/

INSERT INTO purchase_history
VALUES ('CN0009','OD0007')
/



