
    create table AUTHORITIES (
        HJID bigint not null auto_increment,
        AUTHORITY varchar(255),
        USERNAME varchar(255),
        primary key (HJID)
    );

    create table Countries (
        id integer not null auto_increment,
        country_code varchar(255),
        country_name varchar(255),
        primary key (id)
    );

    create table Image (
        id bigint not null auto_increment,
        IMAGEFULLSIZEURL varchar(255),
        imagename varchar(255),
        IMAGETHUMBNAILURL varchar(255),
        IMAGELIST_PRODUCT__HJID bigint,
        primary key (id)
    );

    create table ORDERITEM (
        HJID bigint not null auto_increment,
        ORDERITEMFINALPRICE decimal(20,10),
        ORDERITEMNAME varchar(255),
        ORDERQUANTITY decimal(20,0),
        OrderItem_Order bigint,
        ORDERLIST_ORDER__HJID bigint,
        primary key (HJID)
    );

    create table ORDER_ (
        HJID bigint not null auto_increment,
        ORDERAMOUNT decimal(20,10),
        ORDERCITY varchar(255),
        ORDERCOUNTRY varchar(255),
        ORDERDATEITEM date,
        ORDEREMAIL decimal(20,10),
        ORDERFAX varchar(255),
        ORDERPHONE varchar(255),
        ORDERSHIPADDRESS varchar(255),
        ORDERSHIPADDRESS2 varchar(255),
        ORDERSHIPNAME varchar(255),
        ORDERSHIPPED bit,
        ORDERSHIPPING decimal(20,10),
        ORDERSTATE varchar(255),
        ORDERTAX decimal(20,10),
        ORDERTRACKINGNUMBER varchar(255),
        ORDERZIP varchar(255),
        USER__ORDER__HJID bigint,
        ORDERLIST_USER__HJID bigint,
        primary key (HJID)
    );

    create table PRODUCT (
        HJID bigint not null auto_increment,
        PRODUCTLONGDESC varchar(255),
        PRODUCTNAME varchar(255),
        PRODUCTPRICE decimal(20,10),
        PRODUCTSKU varchar(255),
        PRODUCTSHORTDESC varchar(255),
        PRODUCTSTOCK decimal(20,0),
        PRODUCTUPDATEDATEITEM date,
        PRODUCTWEIGHT decimal(20,10),
        image_id bigint,
        PRODUCTCATEGORY_PRODUCT_HJID bigint,
        product_dimension_id integer,
        primary key (HJID)
    );

    create table PRODUCTCATEGORY (
        HJID bigint not null auto_increment,
        categoryHierarchy varchar(255),
        CATEGORYNAME varchar(255),
        ProductCategory_ParentCategory bigint,
        SUBCATEGORIES_PRODUCTCATEGOR_0 bigint,
        primary key (HJID)
    );

    create table PRODUCTDIMENSIONS (
        id integer not null auto_increment,
        HEIGHT float,
        LENGTH float,
        LENGTHCLASS integer,
        WEIGHT float,
        WEIGHTCLASS integer,
        WIDTH float,
        primary key (id)
    );

    create table USER (
        HJID bigint not null auto_increment,
        ENABLED bit,
        USERADDRESS varchar(255),
        USERADDRESS2 varchar(255),
        USERCITY varchar(255),
        USERCOUNTRY varchar(255),
        USEREMAIL varchar(255),
        USEREMAILVERIFIED bit,
        USERFAX varchar(255),
        USERFIRSTNAME varchar(255),
        USERLASTNAME varchar(255),
        USERNAME varchar(255),
        USERPASSWORD varchar(255),
        USERPHONE varchar(255),
        USERSTATE varchar(255),
        USERVERIFICATIONCODE varchar(255),
        USERZIP varchar(255),
        authority_id bigint,
        primary key (HJID)
    );

    alter table Image 
        add index FK437B93BAACA84F9 (IMAGELIST_PRODUCT__HJID), 
        add constraint FK437B93BAACA84F9 
        foreign key (IMAGELIST_PRODUCT__HJID) 
        references PRODUCT (HJID);

    alter table ORDERITEM 
        add index FK8ECABB4153EE762 (OrderItem_Order), 
        add constraint FK8ECABB4153EE762 
        foreign key (OrderItem_Order) 
        references ORDER_ (HJID);

    alter table ORDERITEM 
        add index FK8ECABB41B6E6ADEA (ORDERLIST_ORDER__HJID), 
        add constraint FK8ECABB41B6E6ADEA 
        foreign key (ORDERLIST_ORDER__HJID) 
        references ORDER_ (HJID);

    alter table ORDER_ 
        add index FK8B7256F1DE80D0A7 (USER__ORDER__HJID), 
        add constraint FK8B7256F1DE80D0A7 
        foreign key (USER__ORDER__HJID) 
        references USER (HJID);

    alter table ORDER_ 
        add index FK8B7256F1C6EF6E62 (ORDERLIST_USER__HJID), 
        add constraint FK8B7256F1C6EF6E62 
        foreign key (ORDERLIST_USER__HJID) 
        references USER (HJID);

    alter table PRODUCT 
        add index FK185958CF393AC6FE (image_id), 
        add constraint FK185958CF393AC6FE 
        foreign key (image_id) 
        references Image (id);

    alter table PRODUCT 
        add index FK185958CF62926724 (product_dimension_id), 
        add constraint FK185958CF62926724 
        foreign key (product_dimension_id) 
        references PRODUCTDIMENSIONS (id);

    alter table PRODUCT 
        add index FK185958CFAA6A3C30 (PRODUCTCATEGORY_PRODUCT_HJID), 
        add constraint FK185958CFAA6A3C30 
        foreign key (PRODUCTCATEGORY_PRODUCT_HJID) 
        references PRODUCTCATEGORY (HJID);

    alter table PRODUCTCATEGORY 
        add index FK4A7FC6CD2864706B (ProductCategory_ParentCategory), 
        add constraint FK4A7FC6CD2864706B 
        foreign key (ProductCategory_ParentCategory) 
        references PRODUCTCATEGORY (HJID);

    alter table PRODUCTCATEGORY 
        add index FK4A7FC6CDD79AA71 (SUBCATEGORIES_PRODUCTCATEGOR_0), 
        add constraint FK4A7FC6CDD79AA71 
        foreign key (SUBCATEGORIES_PRODUCTCATEGOR_0) 
        references PRODUCTCATEGORY (HJID);

    alter table USER 
        add index FK27E3CB38B93EDC (authority_id), 
        add constraint FK27E3CB38B93EDC 
        foreign key (authority_id) 
        references AUTHORITIES (HJID);
