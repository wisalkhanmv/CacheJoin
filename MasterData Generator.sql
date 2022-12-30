--------------------------------------------------------
--  File Modified - Monday 31th Oct 2022   
--------------------------------------------------------
drop schema if exists `master_db` ;
-- DROP TABLE if exists `TRANSACTIONS`;
-- DROP TABLE if exists `CUSTOMERS`;
-- DROP TABLE if exists `PRODUCTS`;
commit;

CREATE SCHEMA `master_db` ;
USE `master_db` ;
 
--------------------------------------------------------
--  DDL for CUSTOMERS Table (MASTER DATA)
--------------------------------------------------------
CREATE TABLE CUSTOMERS(
    CUSTOMER_ID VARCHAR(4), 
    CUSTOMER_NAME VARCHAR(30) not null,
    CONSTRAINT `CUSTOMERS_PK` PRIMARY KEY (CUSTOMER_ID)
) ;
commit; 

--------------------------------------------------------
--  DDL for PRODUCTS Table (MASTER DATA)
--------------------------------------------------------
CREATE TABLE PRODUCTS(
    PRODUCT_ID VARCHAR(6), 
	PRODUCT_NAME VARCHAR(30) NOT NULL, 
	SUPPLIER_ID VARCHAR(5) NOT NULL, 
	SUPPLIER_NAME VARCHAR(30) NOT NULL, 
	PRICE DOUBLE(5,2) DEFAULT 0.0,
    CONSTRAINT `PRODUCTS_PK` PRIMARY KEY (PRODUCT_ID)
);
commit; 
---------- Populatind data ---------------------------------------------------
 -- Data for CUSTOMERS table
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-1','Lezlie Trott');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-2','Joeann Shortt');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-3','Violet Newingham');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-4','Shanika Bang');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-5','Tequila Carmen');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-6','Tomi Hatt');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-7','Micheal Mcandrew');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-8','Odelia Thompkins');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-9','Bernardo Vancamp');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-10','Hilde Mustard');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-11','Shenika Critchfield');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-12','Conrad Arnott');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-13','Palmer Shepler');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-14','Adolfo Kinch');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-15','Ivonne Hibbert');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-16','Lois Mccreery');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-17','Lachelle Cianciolo');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-18','Enoch Whitford');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-19','Zelda Westergard');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-20','Andres Nowell');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-21','Jacinda Tomaselli');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-22','Maren Paulos');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-23','Nicholas Frady');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-24','Ben Eby');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-25','Bill Lybrand');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-26','Ellie Kegley');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-27','Cher Raley');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-28','Chaya Stalcup');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-29','Lou Winship');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-30','Chia Sandage');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-31','Elsy Tusing');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-32','Demetra Tesar');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-33','Shelli Nasser');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-34','Teodoro Straub');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-35','Dominick Smartt');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-36','Tarah Metzgar');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-37','Winston Ohara');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-38','Anthony Mallow');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-39','Alba Weideman');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-40','Ciara Kozel');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-41','Beckie Tousignant');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-42','Debby Musick');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-43','Nikita Salgado');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-44','Illa Flenniken');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-45','Brittny Heffner');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-46','Joanie Sakamoto');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-47','Carie Tiggs');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-48','Lance Sermons');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-49','Theresia Merriam');
Insert into CUSTOMERS (CUSTOMER_ID,CUSTOMER_NAME) values ('C-50','Doretta Montejano');
commit; 
-- Data for PRODUCTS table
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1000','Asparagus','SP-1','3Com Corp',14.25);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1001','Broccoli','SP-1','3Com Corp',18.03);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1002','Carrots','SP-1','3Com Corp',5.48);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1003','Cauliflower','SP-1','3Com Corp',17.26);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1004','Celery','SP-1','3Com Corp',25.02);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1005','Corn','SP-2','3M Company',24.42);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1006','Cucumbers','SP-2','3M Company',8.42);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1007','Lettuce / Greens','SP-2','3M Company',19.46);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1008','Mushrooms','SP-2','3M Company',13.32);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1009','Onions','SP-3','A.G. Edwards Inc.',22.74);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1010','Peppers','SP-3','A.G. Edwards Inc.',12.56);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1011','Potatoes','SP-3','A.G. Edwards Inc.',4.59);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1012','Spinach','SP-3','A.G. Edwards Inc.',9.83);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1013','Squash','SP-4','Abercrombie and Fitch Co.',15.37);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1014','Tomatoes','SP-4','Abercrombie and Fitch Co.',1.79);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1015','Apples','SP-4','Abercrombie and Fitch Co.',7.36);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1016','Avocados','SP-4','Abercrombie and Fitch Co.',8.86);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1017','Bananas','SP-5','ACT Manufacturing Inc.',12.85);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1018','Berries','SP-5','ACT Manufacturing Inc.',3.22);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1019','Cherries','SP-5','ACT Manufacturing Inc.',17.11);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1020','Grapefruit','SP-5','ACT Manufacturing Inc.',25.82);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1021','Grapes','SP-6','Acterna Corp.',10.11);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1022','Kiwis','SP-6','Acterna Corp.',19.75);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1023','Lemons / Limes','SP-6','Acterna Corp.',12.91);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1024','Melon','SP-6','Acterna Corp.',25.85);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1025','Oranges','SP-7','Adolph Coors Company',2.95);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1026','Peaches','SP-7','Adolph Coors Company',17.73);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1027','Nectarines','SP-7','Adolph Coors Company',9.1);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1028','Pears','SP-7','Adolph Coors Company',23.67);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1029','Plums','SP-8','Advantica Restaurant Group',9.86);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1030','Bagels','SP-8','Advantica Restaurant Group',4.07);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1031','Chip dip','SP-8','Advantica Restaurant Group',7.69);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1032','English muffins','SP-8','Advantica Restaurant Group',19.49);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1033','Eggs / Fake eggs','SP-9','The AES Corporation',9.61);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1034','Fruit juice','SP-9','The AES Corporation',10.02);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1035','Hummus','SP-9','The AES Corporation',9.08);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1036','Ready-bake breads','SP-10','Aetna Inc.',15.34);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1037','Tofu','SP-10','Aetna Inc.',21.11);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1038','Tortillas','SP-10','Aetna Inc.',6.17);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1039','Breakfasts','SP-10','Aetna Inc.',15.59);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1040','Burritos','SP-11','AFLAC Incorporated',21.97);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1041','Fish sticks','SP-11','AFLAC Incorporated',19.45);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1042','Ice cream / Sorbet','SP-11','AFLAC Incorporated',25.45);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1043','Juice concentrate','SP-12','Cabot Corp',8.2);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1044','Pizza / Pizza Rolls','SP-12','Cabot Corp',17.5);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1045','Popsicles','SP-12','Cabot Corp',6.68);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1046','Fries / Tater tots','SP-12','Cabot Corp',1.59);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1047','TV dinners','SP-12','Cabot Corp',20.93);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1048','Vegetables','SP-13','Calpine Corp.',14.92);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1049','Veggie burgers','SP-13','Calpine Corp.',7.46);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1050','BBQ sauce','SP-13','Calpine Corp.',10.24);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1051','Gravy','SP-13','Calpine Corp.',15.44);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1052','Honey','SP-13','Calpine Corp.',3.23);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1053','Hot sauce','SP-14','Campbell Soup Co.',11.49);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1054','Jam / Jelly / Preserves','SP-14','Campbell Soup Co.',2.15);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1055','Ketchup / Mustard','SP-14','Campbell Soup Co.',4.9);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1056','Mayonnaise','SP-14','Campbell Soup Co.',7.72);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1057','Pasta sauce','SP-15','Caseys General Stores Inc.',8.74);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1058','Relish','SP-15','Caseys General Stores Inc.',25.39);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1059','Salad dressing','SP-15','Caseys General Stores Inc.',10.62);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1060','Salsa','SP-15','Caseys General Stores Inc.',7.39);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1061','Soy sauce','SP-16','CBRL Group Inc.',16.1);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1062','Steak sauce','SP-16','CBRL Group Inc.',15.31);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1063','Syrup','SP-16','CBRL Group Inc.',1.94);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1064','Worcestershire sauce','SP-16','CBRL Group Inc.',2.9);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1065','Bouillon cubes','SP-16','CBRL Group Inc.',18.14);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1066','Cereal','SP-17','CDI Corp.',15.9);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1067','Coffee / Filters','SP-17','CDI Corp.',14.73);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1068','Instant potatoes','SP-17','CDI Corp.',4.85);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1069','Lemon / Lime juice','SP-17','CDI Corp.',19.7);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1070','Mac and cheese','SP-18','CellStar Corp.',25.5);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1071','Olive oil','SP-18','CellStar Corp.',12.51);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1072','Pancake / Waffle mix','SP-18','CellStar Corp.',20.92);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1073','Pasta','SP-18','CellStar Corp.',22.35);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1074','Peanut butter','SP-19','Cendant Corp',6.69);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1075','Pickles','SP-19','Cendant Corp',1.39);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1076','Rice','SP-19','Cendant Corp',3.64);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1077','Tea','SP-19','Cendant Corp',11.84);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1078','Vegetable oil','SP-19','Cendant Corp',4.26);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1079','Vinegar','SP-19','Cendant Corp',9);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1080','Applesauce','SP-20','Coca-Cola Co',16.55);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1081','Baked beans','SP-20','Coca-Cola Co',7.17);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1082','Chili','SP-20','Coca-Cola Co',12.49);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1083','Fruit','SP-20','Coca-Cola Co',7.02);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1084','Olives','SP-20','Coca-Cola Co',1.17);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1085','Tinned meats','SP-20','Coca-Cola Co',21.95);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1086','Tuna / Chicken','SP-9','The AES Corporation',12.04);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1087','Soups','SP-9','The AES Corporation',17.64);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1088','Tomatoes','SP-9','The AES Corporation',19.4);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1089','Veggies','SP-9','The AES Corporation',6.14);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1090','Basil','SP-9','The AES Corporation',8.38);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1091','Black pepper','SP-9','The AES Corporation',20);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1092','Cilantro','SP-3','A.G. Edwards Inc.',12.16);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1093','Cinnamon','SP-3','A.G. Edwards Inc.',8.44);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1094','Garlic','SP-3','A.G. Edwards Inc.',12.07);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1095','Ginger','SP-3','A.G. Edwards Inc.',24.6);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1096','Mint','SP-3','A.G. Edwards Inc.',22.47);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1097','Oregano','SP-3','A.G. Edwards Inc.',20.8);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1098','Paprika','SP-3','A.G. Edwards Inc.',18.2);
Insert into PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,SUPPLIER_NAME,PRICE) values ('P-1099','Parsley','SP-3','A.G. Edwards Inc.',10.51);
commit; 

SELECT COUNT(*) as `Total records in Products` from PRODUCTS;
SELECT COUNT(*) as `Total records in Customers` from CUSTOMERS;