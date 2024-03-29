create table DIM_Production (
	product_ID varchar(10) not null,
    Product_Name Varchar(200) not null,
    Unit_Price int not null,
    Product_Line varchar(100) not null,
    primary key(product_ID)
    ) engine = InnoDB ;

create table DIM_Customer (
	Customer_ID Varchar(30) not null,
    Name varchar(200) not null,
    city varchar(50) not null,
    Kode_pos varchar(10),
    primary key (Customer_ID)
    )Engine=innodb ;
    
Create Table Fact_Table (
	product_ID varchar(10) not null,
    Time_ID Varchar(100) not null,
    Promotion_ID varchar(10) not null,
    Customer_ID Varchar(30) not null,
    Revenue int not null,
    Units_Sold int not null,
    primary key (Time_ID),
    foreign key (product_ID) references DIM_Production(product_ID),
    foreign key (Customer_ID) references DIM_Customer(Customer_ID)
    ) engine=innodb ;
    
    alter table Fact_Table
    add Unique key(Promotion_ID);
    
create table DIM_Time (
	Time_ID Varchar(100) not null,
    Order_Date timestamp not null default current_timestamp,
    Month enum('januari','februari','maret','april','mei','juni','juli','agustus','september','oktober','november','desember'),
    Year varchar (5)
    ) engine = innodb;
    
alter table DIM_Time 
modify Year varchar(5) not null ;

alter table DIM_Time
add foreign key (Time_ID) references Fact_Table(Time_ID) ;

create table DIM_Promotion(
		Promotion_ID varchar(10) not null,
        Promon_Name varchar(50) not null,
        Ad_Type Varchar(100) not null,
        Coupon_Type varchar(100) not null,
        foreign key(Promotion_ID) references Fact_Table(Promotion_ID)
	) Engine = innodb ;
    
    
show tables ;

select DIM_Production.product_ID ,DIM_Production.Product_Name,
    