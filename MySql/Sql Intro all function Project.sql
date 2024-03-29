
SHOW ENGINES ;
show tables  ;
Create table barang (
	id INT,
    nama varchar(100),
    harga INT,
    jumlah INT
) Engine = InnoDB ;

show tables;

Describe barang;
show create table barang ;

alter table barang
add column deksripsi_barang text;

alter table barang
drop column deksripsi ;

alter table barang 
modify nama varchar(150) after harga ;

alter table barang
modify nama varchar(150) first ;

alter table barang
modify nama varchar(150) not null,
modify id int not null;

alter table barang 
modify jumlah int not null default 0 ,
modify harga int not null default 0,
modify	deksripsi_barang text not null default ' ';

alter table barang
add waktu_dibuat timestamp not null default current_timestamp;

alter table barang
add primary key (id);

insert into barang (id, nama) Values (1, 'apel');


select * from barang ;

#hapus data pada tabel
truncate barang;

#hapus table
drop table barang;


Create table product(
	id varchar(10) not null,
	name varchar(50) not null,
	description text,
    price int unsigned not null,
    quantity int unsigned not null,
    created_at timestamp not null default current_timestamp)
	engine = InnoDB ;
    
    
describe product;
select * from product;

insert into product (id,name,price,quantity)
values ('A0001','ayam potong','35000','50');

insert into product (id,name,price,quantity)
values ('A0002','ayam hidup','31000','500'); 
truncate product;

insert into product (id,name,description,price,quantity)
values ('A0003','ayam paha & dada','1 ekor ayam potong paha dada','25000','20'); 

insert into product (id,name,price,quantity)
values  ('A0004','Paha','15000','50'),
		('A0005','dada','16000','50'),
		('A0006','pala ceker','5000','150');
        
select name,price from product;

select id,name,quantity from product 
where quantity > 100;

alter table product
add primary key (id);

show create table product;

alter table product
	add column kategori enum('hidup','potong')
	after name;
    
 #update data kolom   
update product 
set kategori = 'potong'
where id = 'A0001';

update product
set quantity = 200,
	kategori = 'hidup'
where id = 'A0002';

update product
set quantity = 100,
	kategori = 'potong'
where id = 'A0004';

update product
set price = price + 10000
where id = 'A0001';

#delete row data
delete
from product 
where id = 'A0006';

#As atau alias
select id as kode,
	   name as nama,
       kategori as 'kategori produk',
       price as harga,
       quantity as 'jumlah produk'
from product;

select p.id as kode,
	   p.name as nama,
       p.kategori as 'kategori produk',
       p.price as harga,
       p.quantity as 'jumlah produk'
from product as p;

select * from product where quantity <> 50;
select * from product where quantity >= 20;
select * from product where quantity < 200;

insert into product (id,name,price,quantity)
values  ('A0007','Ikan mas','21000','100'),
		('A0008','Ikan kerapu','81000','200'),
        ('A0009','Ikan lele','7000','100'),
        ('A0010','Udang','41000','500'),
        ('A0011','Cumi','52000','200');

update product
set kategori = 'hidup'
where id = 'A0007';
update product
set kategori = 'hidup'
where id = 'A0008';
update product
set kategori = 'hidup'
where id = 'A0009';
update product
set kategori = 'hidup'
where id = 'A0010';
update product
set kategori = 'hidup'
where id = 'A0011';

        
select id,name,price,quantity
from product
where quantity > 100 and price > 30000;
 

#operator OR AND
select * from product 
where quantity > 50 and price < 30000;
select * from product 
where quantity > 50 or price < 30000;
select * from product 
where (quantity > 50 or price < 30000) and kategori = 'hidup' ;

#search data bt string atau text
select * from product
where name like '%ikan%'; 
select * from product
where name not like '%ikan%'; 

#finding null data
select * from product
where kategori is null ;

select * from product
where kategori is not null ;

#between operator
select * from product
where price between 20000 and 60000 ;

#in operator
select * from product
where kategori in ('hidup','potong') ;

select * from product where kategori in('potong');

#order operator (ASC untuk naik DESC untuk menurun, tidak diisi = ASC)
select * from product order by kategori,price DESC ;

#limit clause 
select * from product where quantity > 0 order by quantity DESC limit	10;
select * from product where quantity > 0 order by quantity DESC limit	0,4; 
select * from product where quantity > 0 order by quantity DESC limit	4,4;
select * from product where quantity > 0 order by quantity DESC limit	8,4;

#select distinct data ( tidak menginput data yang double)
select distinct kategori from product;

# operasi aritmatika % or MOD (modulo operator) ,*(perkalian),+(penjumlahan),-(bisa untuk minus operator atau mengganti tanda argumen),/(pembagian),DIV(pembagian integer atau bilangan koma)
select id,name,price div 1000 as 'Harga dalam Ribuan' from product ;

#autu increment ( auto isi primary key +1)
create table Admin (
	id  int not null auto_increment,
    first_name varchar(50) not null,
    last_name varchar (50) not null,
    primary key(id) )
engine = InnoDB;
select * from  admin ;
show create table admin;
insert into	admin( first_name,last_name)
values ('andi','cahya'),('rafli','ahmad'),('saya','suka'),('rizki','aji');

select * from admin order by  id desc;
insert into	admin( first_name,last_name)
values ('rudi','cahya');

select last_insert_id();

#string function
select id,upper(first_name)as 'first name upper',upper(last_name)as'upper last name',length(first_name) from admin ;

#date function
select id,created_at,extract(year from created_at) as 'tahun',extract(month from created_at) as 'bulan' from product;
select id, year(created_at) as 'tahun',month(created_at) from product;

# flow function
select id,name,
		case kategori 
			when 'hidup' then 'Tidak termasuk jasa potong'
            when 'potong' then 'sudah termasuk jasa'
            else'-'
			end as 'Keterangan'
from product;

select id,name,
			price,
			if(price <= 15000,'$',if (price <=30000,'$$','$$$')) as 'Kategori Harga'
from product;

select id,name, ifnull(description,'  ') from product;
select id,name,ifnull(kategori,' ') from product;

#aggregate funtion
select count(id) as 'Total Product',avg(price) as 'Rata-Rata',max(price) as 'Harga Tertinggi',Min(price) as 'Harga Terendah',sum(quantity) as 'Jumlah Seluruh Stok barang' from product ;

#Grouping 
select count(id) as 'total product', kategori from product group by kategori;

select avg(price) as 'rata-rata harga', kategori from product group by kategori;

select max(price) as 'Harga Tertinggi', kategori from product group by kategori;

#having clause 
select kategori, count(id) as Total,n from product group by kategori having Total>1;

#constraint function ( unique key atau constraint)
create table Kastamer
(	ID int not null auto_increment,
	email varchar(100) not null,
    first_name varchar(100) not null,
    last_name varchar (100) not null,
    primary key(ID),
    unique key email_unique(email) ) engine = innodb ;

insert into kastamer (email,first_name,last_name)
values ('Rudi@gmail.com','Rudi','Hermawan'),
	   ('Atin@gmail.com','Kathrina','Irene'),
       ('joko21@gmail.com','Joki','wi'),
       ('adelia@gmail.com','adel','fidel'),
       ('sayuti24@gmail.com','Sayuti','Tia');
select * from kastamer;

#check constraint ( validasi input data agar tidak salah input biasa digunakan di harga)
Create table gudang (
	id INT not null auto_increment,
    name varchar(100) not null,
    deskripsi varchar(100) not null default " ",
    price INT not null,
    Stok INT not null default '0',
    created_at timestamp not null default current_timestamp,
    primary key(id)
) Engine = InnoDB ;

alter table product 
add constraint price_check check (price >=1000);

#index function
create table sellers (
	id int not null auto_increment,
    name varchar(100) not null,
    name2 varchar(100),
    name3 varchar(100),
    email varchar(100) not null,
    primary key(id),
    unique key email_unique(email),
    index name_index(name),
    index name2_index(name2),
    index name3_index(name3),
    index name1_name2_name3_index (name,name2,name3)
) engine = innodb ;

select*from sellers;

describe sellers;
show create table sellers;
insert into sellers (name,name2,name3,email)
values  ('haryanto','ardi','yulian','yanto21@gmail.com'),
		('yudi','ahmad','septi','yudian@gmail.com'),
        ('rudianto','agus','rinato','rudiant@yahoo.com'),
        ('selvvi','anisa','kirana','selviani@gmail.com') ;

select * from sellers where name ='yudi'and name2='ahmad' ;

alter table sellers
drop index name_index ;

#fulltext search(index dan match function)
show create table product ;
select * from product ;
alter table product
add fulltext product_search (name,description);

select*from product 
where match(name,description) 
		Against('ayam' in natural language mode);

select*from product 
where match(name,description) 
		Against('ikan' in natural language mode);
        
select*from product 
where match(name,description) 
		Against('+ikan' in boolean mode);
      
select*from product 
where match(name,description) 
		Against('paha' with query expansion);
        
select * from product ;
        
