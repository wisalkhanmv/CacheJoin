drop schema if exists `dw` ;
-- DROP TABLE if exists `TRANSACTIONS`;
-- DROP TABLE if exists `CUSTOMERS`;
-- DROP TABLE if exists `PRODUCTS`;
commit;

CREATE SCHEMA `dw` ;
USE `dw` ;
 
--------------------------------------------------------
--  DDL for CUSTOMERS Dimension
--------------------------------------------------------
CREATE TABLE CUSTOMERS(
    CUSTOMER_ID VARCHAR(4), 
    CUSTOMER_NAME VARCHAR(30) not null,
    CONSTRAINT `CUSTOMERS_PK` PRIMARY KEY (CUSTOMER_ID)
);

--------------------------------------------------------
--  DDL for PRODUCTS Dimension
--------------------------------------------------------
CREATE TABLE PRODUCTS(
    PRODUCT_ID VARCHAR(6), 
	PRODUCT_NAME VARCHAR(30) NOT NULL, 
	PRICE DOUBLE default 0.0,
    CONSTRAINT `PRODUCTS_PK` PRIMARY KEY (PRODUCT_ID)
);

--------------------------------------------------------
--  DDL for SUPPLIERS Dimension
--------------------------------------------------------
CREATE TABLE SUPPLIERS(
	SUPPLIER_ID VARCHAR(5) NOT NULL, 
	SUPPLIER_NAME VARCHAR(30) NOT NULL, 
    CONSTRAINT `SUPPLIERS_PK` PRIMARY KEY (SUPPLIER_ID)
);

--------------------------------------------------------
--  DDL for STORES Dimension
--------------------------------------------------------
CREATE TABLE STORES(
STORE_ID VARCHAR(4) NOT NULL, 
  STORE_NAME VARCHAR(20) NOT NULL, 
  CONSTRAINT `STORES_PK` PRIMARY KEY (STORE_ID)
);

--------------------------------------------------------
--  DDL for TIMES Dimension
--------------------------------------------------------
CREATE TABLE TIMES(
  TIME_ID VARCHAR(8) NOT NULL, 
  T_DATE DATE NOT NULL,
  T_DAY INT,
  T_WEEK INT,
  T_MONTH INT,
  T_QUARTER INT,
  T_YEAR INT,
  CONSTRAINT `TIMES_PK` PRIMARY KEY (TIME_ID)
);

--------------------------------------------------------
--  DDL for fact table
--------------------------------------------------------
CREATE TABLE TRANSACTIONS(
	TRANS_ID double(8,0) NOT NULL,
  PRODUCT_ID VARCHAR(6) NOT NULL, 
  CUSTOMER_ID VARCHAR(4) NOT NULL,
  SUPPLIER_ID VARCHAR(5) NOT NULL, 
  STORE_ID VARCHAR(4) NOT NULL,
  TIME_ID VARCHAR(8) NOT NULL, 
  QUANTITY DOUBLE(3,0) NOT NULL,
  SALES DOUBLE DEFAULT 0.0,
  CONSTRAINT `TRANSACTIONS_PK` PRIMARY KEY (trans_id),
  FOREIGN KEY (product_id) references PRODUCTS(PRODUCT_ID),
  FOREIGN KEY (customer_id) references CUSTOMERS(CUSTOMER_ID),
  FOREIGN KEY (supplier_id) references SUPPLIERS(SUPPLIER_ID),
  FOREIGN KEY (store_id) references STORES(STORE_ID),
  FOREIGN KEY (time_id) references TIMES(TIME_ID)
);
commit; 
