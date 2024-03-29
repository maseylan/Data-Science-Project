#relation ( default restrict, agar data bisa didelete pakai cascade)
create table wishlist (
	id int not null auto_increment,
    id_produk varchar(10) not null,
    deskripsi text,
    primary key (id),
    constraint fk_wishlist_product
		foreign key (id_produk) references product (id)
	) engine = InnoDB ;

alter table wishlist 
	add constraint fk_wishlist_product 
		foreign key (id_produk) references product(id)
			on delete cascade on update cascade ;
            
insert into product (id,name,kategori,price,quantity) 
	Values('AXXX1','ayam bakar','Potong','12000','100');
insert into wishlist (id_produk, deskripsi) values('AXXX1','Barang keinginan');    
delete from product where id = 'AXXX1' ;

select * from wishlist 
join product on (wishlist.id_produk = product.id);

select wishlist.id ,product.id , product.name,wishlist.deskripsi from wishlist
join product on (wishlist.id_produk = product.id);








show create table wishlist;
describe wishlist;
select * from wishlist;


