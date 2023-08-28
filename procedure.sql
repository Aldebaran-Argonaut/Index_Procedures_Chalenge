show databases;
use ecommerce;
show tables;

-- orders
drop PROCEDURE management_Clients;
DELIMITER //
CREATE PROCEDURE management_Clients(
in cod int,
in Fnamep varchar(25), 
in Minitp varchar(25),
in Lnamep varchar(25),
in Addressp varchar(80)
)
BEGIN
	case 
		when cod = 1 then 
			insert into clients(Fname,Minit,Lname,Address) 
			values (Fnamep,Minitp,Lnamep,Addressp);
        when cod = 2 then 
			delete from clients
			where Fname = Fnamep and Minit = Minitp and Lname = Lnamep;
        when cod = 3 then 
        update clients
			set Fname = Fnamep, Minit = Minitp, Lname = Lnamep, Address = Addressp
			where Fname = Fnamep and Minit = Minitp and Lname = Lnamep;
	end case;
END;
//
DELIMITER ;

select * from clients;

call management_Clients(3,'fabricio','S','ferreira','rua c1');

desc clients;



