drop table SIZE if exists cascade;
        drop table GOOD if exists cascade;
        drop table ORDER2 if exists cascade;
        drop table USER if exists cascade;
        drop table PRODUCT if exists cascade;
        drop table RECIPE_GOOD if exists cascade;
        drop table WAREHOUSE if exists cascade;


        CREATE TABLE SIZE
        (
        SIZE_ID int,
        SIZE_NAME varchar(255)
        );