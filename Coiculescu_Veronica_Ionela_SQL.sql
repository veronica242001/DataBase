--tabel distribuitori
create table distribuitori (
         id_distribuitor number(10)  NOT NULL PRIMARY KEY,
         nume varchar2 (25) NOT NULL,
         cifra_afaceri number(10) NOT NULL,
         telefon varchar2 (20) NOT NULL);
insert into distribuitori values ( 1, 'MEDIPLUS EXIM S.R.L.', 2300, '0721345656');
insert into distribuitori values ( 2, 'POLISANO S.R.L..', 1450, '0789834562');
insert into distribuitori values ( 3, 'FARMEXIM S.A.', 921, '0744455156');
insert into distribuitori values ( 4, 'ROPHARMA S.A.', 3000, '0720748911');
insert into distribuitori values ( 5, 'ACTAVIS S.R.L.', 360, '0721345656');
insert into distribuitori values ( 6, 'EUROPHARM HOLDING S.A.', 736, '0767778956');

--tabel producatori
create table producatori(
         id_producator number(10) NOT NULL primary key,
         nume  varchar2 (20) unique,
         adresa  varchar2 (20) NOT NULL,
         email varchar2(20) unique);
insert into producatori values (101, 'Biofarm SA','Bucuresti','biofarm@gmail.com');
insert into producatori values (102, 'Bioeel SRL','Targu Mures','bioeel@gmail.com');
insert into producatori values (103, 'Zentiva SA','Bucuresti','zentiva@gmail.com');
insert into producatori values (104, 'Terapia SA','Cluj-Napoca','terapiagmail.com');
insert into producatori values (105, 'Europharm','Brasov','europh@gmail.com');
insert into producatori values (106, 'Sandoz','Bucuresti','sandoz@gmail.com');
select * from producatori;

-- tabel farmacii
create table farmacii
           (id_farmacie number(10) NOT NULL primary key,
            denumire varchar2(20) NOT NULL,
            adresa varchar2(20) NOT NULL,
            telefon varchar2(20) NOT NULL);
          
insert into farmacii values (11, 'DAV', 'Targu-Jiu','0756 128 732');
insert into farmacii values (12, 'Sensiblu', 'Targu-Jiu','0726 301 308');
insert into farmacii values (13, 'Catena', 'Craiova','0755 011 320');
insert into farmacii values (14, 'OPTIFARM', 'Ramnicu Valcea','0756 128 732');
insert into farmacii values (15, 'Catena', 'Targu-Jiu','0723 128 888');
insert into farmacii values (16, 'HelpNet', 'Craiova','0744 658 732');
insert into farmacii values (17, 'Dona', 'Craiova','0744 658 732');
insert into farmacii values (18, 'HelpNet', 'Bumbesti Jiu','0789456678');
select * from farmacii;

--tabel clienti
create table clienti
       ( id_client number(10) NOT NULL primary key,
         nume varchar2(20) NOT NULL,
         prenume varchar2(20) NOT NULL,
         buget number(10) NOT NULL,
         adresa varchar2(45) NOT NULL,
         email varchar2(20) NOT NULL);
insert into clienti values( 1, 'Popescu','Ioan',100,'23 Str Eroii Revolutiei','ipop@gmail.com');
insert into clienti values( 2, 'Pop','Vladimir',250,'24 Str 1 Decembrie','vladi24@gmail.com');
insert into clienti values( 3, 'Anastasescu','Noora',45,'23 Str 9 Mai','nooraa@gmail.com');
insert into clienti values( 4, 'Marinescu','Mara',33,' Str 23 August','mmara@gmail.com');
insert into clienti values( 5, 'Draganescu','Anastasia',75,'23 Str Eroii Revolutiei','anadr@gmail.com');
insert into clienti values( 6, 'Cristescu','Ioan',10,'23 Str Eroii RevolutieiEcaterina Tedoroiu','kari@gmail.com');
insert into clienti values( 8, 'Apostolescu','Ana-Maria',100,'01 Str Tudor Vladimirescu','ipop@gmail.com');
insert into clienti values( 9, 'Pop','Christian',200,'20 Str 23 August','chpop@gmail.com');

-- tabel farmacisti
create table farmacisti
          ( id_farmacist number(10) NOT NULL primary key,
           nume varchar2(20)  NOT NULL,
           prenume  varchar2(20) NOT NULL,
           salariu number(10) NOT NULL,
           email varchar2(20) NOT NULL,
           id_farmacie number(10) constraint fk references farmacii(id_farmacie) );
           
insert into farmacisti values( 1, 'Popa' ,'Atena' ,4500 , 'popaa@gmail.com' , 11);   
insert into farmacisti values( 2, 'Ionescu' ,'Anda' ,5500 , 'andai3@gmail.com' , 12);
insert into farmacisti values( 3, 'Rotaru' ,'Atena' , 4500 , 'ratena@gmail.com' , 13);
insert into farmacisti values( 4, 'Dumitrescu' ,'Theodor' , 9000, 'dumitheo@gmail.com' , 15);
insert into farmacisti values( 5, 'Constantinescu' ,'Tudor' ,5600, 'ctudor@gmail' , 16);
insert into farmacisti values( 6, 'Cojocaru' ,'Tiberiu' ,7555,'cojocarut@gmail.com' , 17);
insert into farmacisti values( 7, 'Dima' ,'Petru' ,70000 , 'dimapetru@gmial.com' , 11);
insert into farmacisti values( 8, 'Anton' ,'Damian' , 5500,  'antond@gmail.com' , 12);
insert into farmacisti values( 9, 'Cretu' ,'Iulia' , 3000,  'iulia22@gmail.com' , 11);
insert into farmacisti values( 10, 'Croicu' ,'Ioana' , 9000,  'iulia22@gmail.com' , 17);


create table tipuri(
              id_tip number (10) NOT NULL primary key,
              nume varchar2(20) NOT NULL,
              contraindicatii varchar2(20) );
insert into tipuri values ( 1, 'Paracetamol', NULL);   
insert into tipuri values ( 2, 'Nurofen',NULL );
insert into tipuri values ( 3, 'Aspenter', NULL );
insert into tipuri values ( 4, 'Ibutop Gel',NULL );
insert into tipuri values ( 5, 'Triferment',NULL );
insert into tipuri values ( 6, 'Septosol',NULL );
insert into tipuri values ( 7, 'Minimartieni Gummy',NULL );
insert into tipuri values ( 8, 'Euthyrox',NULL);
insert into tipuri values ( 9, 'Vitamine',NULL);

create table produse_farmaceutice
         ( id_produs number(10) NOT NULL primary key,
           denumire varchar2(20) NOT NULL,
           id_tip  number(10) constraint fk1 references tipuri(id_tip),
           id_producator number(10) constraint fk2 references producatori(id_producator),
           data_expirare date NOT NULL,
           data_fabricatie date NOT NULL,
           pret number(10) NOT NULL,
           status varchar2(20) NOT NULL);
insert into  produse_farmaceutice values (1 , 'Paracetamol Terapia', 1,101,to_date('01/01/2021', 'dd/mm/yyyy') ,to_date('01/01/2019', 'dd/mm/yyyy'),12.5, 'Disponibil' );
insert into  produse_farmaceutice values (2 ,'Paracetamol Silva', 1, 106,to_date('22/12/2021', 'dd/mm/yyyy') ,to_date('24/12/2018', 'dd/mm/yyyy'), 12,'Disponibil');
insert into  produse_farmaceutice values (3 ,'Paracetamol S', 1, 105 ,to_date('24/10/2022', 'dd/mm/yyyy'),to_date('01/11/2020', 'dd/mm/yyyy'), 10,'Indisponibil');
insert into  produse_farmaceutice values (4 , 'Nurofen Forte',2,104 ,to_date('01/11/2022', 'dd/mm/yyyy'),to_date('20/09/2019', 'dd/mm/yyyy'), 18,'Indisponibil' );
insert into  produse_farmaceutice values (5 ,'Nurofen raceala',2, 101,to_date('17/09/2023', 'dd/mm/yyyy'),to_date('22/05/2019', 'dd/mm/yyyy'), 18.75,'Disponibil' );
insert into  produse_farmaceutice values (6 , 'Adpenter 500', 3,102,to_date('17/04/2019', 'dd/mm/yyyy') ,to_date('24/11/2018', 'dd/mm/yyyy'), 50,'Disponibil' );
insert into  produse_farmaceutice values (7 ,'Ibutop Calmant',4, 103,to_date('18/10/2021', 'dd/mm/yyyy'),to_date('07/07/2020', 'dd/mm/yyyy'),55,'Disponibil' );
insert into  produse_farmaceutice values (8 , 'Triferment 700',5,101,to_date('12/12/2020', 'dd/mm/yyyy') ,to_date('16/09/2020', 'dd/mm/yyyy'),50, 'Indisponibil');
insert into  produse_farmaceutice values (9 , 'Minimartieni Mini',7,106,to_date('11/11/2022', 'dd/mm/yyyy') ,to_date('17/01/2020', 'dd/mm/yyyy'),55, 'Indisponibil' );
insert into  produse_farmaceutice values (10 ,'Euthyrox 50',8, 102,to_date('17/05/2021', 'dd/mm/yyyy') ,to_date('18/01/2019', 'dd/mm/yyyy'), 25,'Disponibil' );
insert into produse_farmaceutice values(11, 'Septosol Menta',6,102,to_date('17/05/2021', 'dd/mm/yyyy') ,to_date('18/01/2019', 'dd/mm/yyyy'), 25,'Disponibil' );
insert into produse_farmaceutice values(13, 'Ibutop Gel', 4,103, to_date('18/10/2021', 'dd/mm/yyyy'),to_date('07/07/2019', 'dd/mm/yyyy'),55,'Disponibil' );
insert into produse_farmaceutice values(14, 'Vitamax', 9,102, to_date('19/03/2022', 'dd/mm/yyyy'),to_date('10/10/2021', 'dd/mm/yyyy'),55,'Disponibil' );

create table distribuie (
              id_produs  number(10) constraint fk3 references produse_farmaceutice(id_produs),
              id_distribuitor number(10) constraint fk4 references distribuitori(id_distribuitor),
              id_farmacie number(10) constraint fk5 references farmacii(id_farmacie),
              data_distribuire date not null,
              primary key( id_produs, id_distribuitor, id_farmacie, data_distribuire));

insert into distribuie values (1, 1,11 ,to_date('15/01/2019', 'dd/mm/yyyy') );
insert into distribuie values (2, 1,11 ,to_date('24/12/2020', 'dd/mm/yyyy') );
insert into distribuie values (3, 1,12 ,to_date('24/09/2019', 'dd/mm/yyyy') );
insert into distribuie values (3, 1,15,to_date('22/07/2019', 'dd/mm/yyyy') );
insert into distribuie values (4, 2, 13,to_date('01/06/2019', 'dd/mm/yyyy') );
insert into distribuie values (4, 2, 16,to_date('29/06/2019', 'dd/mm/yyyy') );
insert into distribuie values (5, 2, 17,to_date('01/01/2020', 'dd/mm/yyyy') );
insert into distribuie values (9, 3, 17,to_date('02/03/2020', 'dd/mm/yyyy') );
insert into distribuie values (9, 3,16 ,to_date('07/01/2020', 'dd/mm/yyyy') );
insert into distribuie values (6, 3,13 ,to_date('08/07/2020', 'dd/mm/yyyy') );
insert into distribuie values (7, 5, 13,to_date('15/08/2020', 'dd/mm/yyyy') );
insert into distribuie values (13, 5, 16,to_date('15/08/2020', 'dd/mm/yyyy') );
insert into distribuie values (7, 6, 14,to_date('17/08/2017', 'dd/mm/yyyy') );
insert into distribuie values ( 10, 1, 17,to_date('12/04/2020', 'dd/mm/yyyy') );
insert into distribuie values ( 8, 3, 14,to_date('18/03/2020', 'dd/mm/yyyy') );
insert into distribuie values ( 8, 3, 15,to_date('17/09/2020', 'dd/mm/yyyy') );
insert into distribuie values ( 9, 2, 12,to_date('08/08/2020', 'dd/mm/yyyy') );


create table cumpara (
              id_client number(10) constraint fk7 references clienti(id_client),
              id_produs  number(10) constraint fk6 references produse_farmaceutice(id_produs),
              id_farmacist number(10) constraint fk8 references farmacisti(id_farmacist),
              data date not null,
              mod_plata  varchar2(20) NOT NULL,
              primary key( id_client, id_produs, id_farmacist, data));

insert into cumpara values ( 1, 1, 8, to_date('01/02/2020', 'dd/mm/yyyy'), 'Card');
insert into cumpara values ( 2, 1, 7, to_date('08/08/2020', 'dd/mm/yyyy'), 'Card');
insert into cumpara values ( 3, 1, 2, to_date('14/03/2020', 'dd/mm/yyyy'), 'Card');
insert into cumpara values ( 4, 1, 8, to_date('08/08/2020', 'dd/mm/yyyy'), 'Cash');
insert into cumpara values ( 1, 2, 8, to_date('24/01/2021', 'dd/mm/yyyy'), 'Cash');
insert into cumpara values ( 5, 2, 1, to_date('25/01/2021', 'dd/mm/yyyy'), 'Cash');
insert into cumpara values ( 6, 2, 2, to_date('26/01/2020', 'dd/mm/yyyy'), 'Card');
insert into cumpara values ( 8, 2, 8, to_date('27/01/2021', 'dd/mm/yyyy'), 'Card');
insert into cumpara values ( 8, 2, 2, to_date('27/01/2021', 'dd/mm/yyyy'), 'Card');
insert into cumpara values ( 3, 2, 1, to_date('27/01/2021', 'dd/mm/yyyy'), 'Cash');
insert into cumpara values ( 2, 7, 3, to_date('27/01/2021', 'dd/mm/yyyy'), 'Cash');
insert into cumpara values ( 1, 8, 4, to_date('27/01/2021', 'dd/mm/yyyy'), 'Cash');
insert into cumpara values ( 4, 9, 8, to_date('27/01/2021', 'dd/mm/yyyy'), 'Cash');
insert into cumpara values ( 5, 9, 1, to_date('27/01/2021', 'dd/mm/yyyy'), 'Card');
--ex6
-- O procedură stocată primeste ca parametru procentul cu care trebuie mărit prețul produselor 
--farmaceuticedistribuite de firma cu cea mai mică cifră de afaceri și care expira in anul 2021 
-- Se va afisa numarul liniilor prelucrate.
create or replace procedure modificare_pret( procent in number ) is
  type t1 is table of produse_farmaceutice.id_produs%type
             index by pls_integer;
  prod_farm t1;
 
begin
   select  distinct pf.id_produs
   bulk collect into prod_farm
   from produse_farmaceutice pf join distribuie ds on (ds.id_produs=pf.id_produs)
   join distribuitori di on (di.id_distribuitor = ds.id_distribuitor)
   where di.cifra_afaceri = ( select min(cifra_afaceri) from distribuitori)
   and  to_char(pf.data_expirare, 'YYYY') = 2021 ;
   
  --bulk bind
  forall j in prod_farm.first..prod_farm.last
  update produse_farmaceutice
  set pret= pret + pret*procent/100
  where id_produs = prod_farm(j);
 
  if SQL%rowcount =0 THEN
         dbms_output.put_line('Nu s-a actualizat nicio linie');
        else
        dbms_output.put_line(' Numărul total de linii actualizate este: ' ||to_char(SQL%rowcount));
         commit;
       end if;
end modificare_pret;
/
--rollback;
--caz firma cu cea mai mica cifra de afaceri distribuie
begin
modificare_pret (10);
end;
--caz firma cu cea mai cifra de afaceri nu distribuie
insert into distribuitori values (7, 'Firma nu distribuie', 12, '0767999856');
begin
modificare_pret (10);
end;
--caz  produsele distribuite nu expira in 2021(produsul 8, distribuit 7)
insert into distribuie values ( 8, 7, 18,to_date('08/10/2020', 'dd/mm/yyyy') );
begin
modificare_pret (10);
end;
delete from distribuie where id_produs=8 and id_distribuitor=7 and id_farmacie=18;
delete from distribuitori where id_distribuitor=7;

--ex7
-- Creați o funcție stocată ce afișează pe ecran farmaciștii(nume,prenume,salariu)
--care lucrează la farmacia cu cei mai mulți angajati, returnând salariul mediu corespunzător

create or replace function salariu_mediu
return farmacisti.salariu%type is
    s_mediu farmacisti.salariu%type :=0 ;
    v_nr number(4) :=0;
    
begin
    -- ciclu cursor cu subcereri
    for i in ( select nume, prenume, salariu
               from farmacisti
                where id_farmacie = ( select id_farmacie
                              from farmacisti
                              group by id_farmacie
                              having count(*) = ( select max(mycount)
                                                   from (select id_farmacie, count(*) mycount
                                                                   from farmacisti
                                                                   group by id_farmacie)
                                                             ))) loop
           dbms_output.put_line('Farmacistul: '||i.nume|| '  ' ||i.prenume || ' cu salariul: '||i.salariu);
           s_mediu := s_mediu + i.salariu;
           v_nr := v_nr +1;
    end loop;
        dbms_output.put_line('-----------------------');
        return ( s_mediu/ v_nr);
end salariu_mediu;
/
--apelare cu bloc pl/sql
begin
dbms_output.put_line('Salariul mediu este: '|| salariu_mediu);
end;
/
--ex8
-- O funcție stocată primește ca parametru un tip de medicamente și va afișa
-- pentru fiecare produs de acest tip primii 3 clienti care au cumpărat
--acest produs și returnează  bugetul mediu al acestora, 

create or replace function top_clienti (tip_nume tipuri.nume%type)
return number
is
 nr_clienti number(10) :=0;
  buget_total  clienti.buget%type :=0;
  data_prec cumpara.data%type;
  v_id tipuri.nume%type;
  top number(1) :=0;
  type vect1 is varray(50) of NUMBER(10);
  v_id_prod vect1;
  type vect2 is varray(50) of varchar2(20);
  v_denumire vect2;
  exista number;
begin
  select id_tip into v_id
  from tipuri
  where lower(nume) = lower (tip_nume);
   select id_produs, denumire bulk collect into  v_id_prod, v_denumire
   from produse_farmaceutice 
   where id_tip = v_id   ;
     
   for j in v_id_prod.first.. v_id_prod.last loop
        dbms_output.put_line('---------------------Produsul: '||v_denumire(j) || '-----------------  ');
        exista := 0;
        top :=0;
        for i in( select cl.nume, cl.prenume, cu.data, cl.buget
             from clienti cl , cumpara cu 
             where cl.id_client= cu.id_client
            and cu.id_produs = v_id_prod(j)
             order by cu.data )
        loop  
               exista := 1;
               if top = 0 then -- este primul client
                   top := top +1;
                   data_prec := i.data;
                 elsif top > 0 and  data_prec<> i.data  then
                      top := top+1;
                       data_prec := i.data;
                 else
                      data_prec := i.data;
    
                end if;
               exit when top=4  ;
               dbms_output.put_line('Clientul: '|| i.nume || '  '|| i.prenume ||' a cumparat la data ' || i.data);
               buget_total := buget_total + i.buget;
               nr_clienti := nr_clienti + 1;
                
        end loop;
        if  exista = 0 then
           dbms_output.put_line('Nu exista clienti pentru acest produs');
        end if;
    end loop;
    if nr_clienti = 0 then-- eroare
        raise ZERO_DIVIDE;
    end if;
    return round(buget_total/nr_clienti,2);
     

exception
   when NO_DATA_FOUND then
   dbms_output.put_line( 'Nu este niciun tip cu denumirea ' || tip_nume);
   return -1;
    when ZERO_DIVIDE then
    dbms_output.put_line( 'Nu puteti afla bugetul mediu pt ca nu exista clienti(impartirea la 0 genereaza eroare)');
    return -1;
    when others then
    dbms_output.put_line( 'Alta exceptie ');
    DBMS_OUTPUT.PUT_LINE ('Codul erorii: ' ||SQLCODE);
  DBMS_OUTPUT.PUT_LINE ('Mesajul erorii: ' ||SQLERRM);
    return -1;
end top_clienti;
/
-- exista clienti
declare 
   b clienti.buget%type;
begin
  b := top_clienti('Paracetamol');
  if b > 0 then
 dbms_output.put_line('Bugetul mediu este: '|| b);
 end if;
end;

--nu exista denumirea
begin
if  top_clienti('Magneziu') >0 then
    dbms_output.put_line('Bugetul mediu este: '|| top_clienti('Magneziu'));
end if;
end;
-- nu exista client
begin
if ( top_clienti('Vitamine') >0) then
    dbms_output.put_line('Bugetul mediu este: '|| top_clienti('Vitamine'));
end if;
end;

--9
--O procedură stocată primește ca parametru numele unui oraș și găsește 
--distribuitorul care a livrat in toate farmaciile din orasul respectiv
-- In continuare se va updata statusul produselor in 'INDISPONIBIL' 
--( vom afisa pe ecran denumire produs, nume producator, pret)
-- care au fost vreodata livrate de acest distibuitor. 
-- daca exista mai multi distribuitori cu aceasta proprietate se va a
--runca eroare si se va afisa un mesaj corespunzator

create or replace procedure modif_produse( v_oras farmacii.adresa%type) as
-- cursor cu parametru           
cursor pr( distr distribuitori.id_distribuitor%type ) is
    select distinct pf.id_produs, pf.denumire , pf.status , pr.nume
    from  produse_farmaceutice pf ,producatori pr, distribuie di
    where pf.id_producator = pr.id_producator and di.id_produs= pf.id_produs and
    di.id_distribuitor = distr;
    
v_distr distribuitori.id_distribuitor %type;
v_nume distribuitori.nume%type;

begin
    select id_distribuitor -- division
    into v_distr
    from distribuie join distribuitori using(id_distribuitor)
    where id_farmacie in
          ( select id_farmacie
            from farmacii
            where lower(adresa) =  lower(v_oras))
    group by id_distribuitor
    having count ( distinct id_farmacie) =
          ( select count(*)
            from farmacii
            where lower(adresa) = lower(v_oras) ) ;
    select  nume into v_nume  
    from distribuitori
    where id_distribuitor = v_distr;
   dbms_output.put_line('Distribuitorul  ' || v_nume || ' cu id-ul '|| v_distr);
   
    for i in pr(v_distr) loop
         
        
         dbms_output.put_line('Produsul' || i.denumire || ' cu statusul ' || i.status ||
         ' produs de '|| i.nume);
         update produse_farmaceutice
         set status = 'INDISPONIBIL'
         where id_produs = i.id_produs;
    end loop;
    commit;
    exception
         when TOO_MANY_ROWS then
         dbms_output.put_line('Exista mai multi distribuitori cu aceasta proprietate!');
         when NO_DATA_FOUND then
         dbms_output.put_line('Nu exista niciun distribuitor  cu aceasta proprietate! ');
         when others then
         dbms_output.put_line('Alta eroare');
END modif_produse;
/    
begin  -- mai multi distribuitori indeplinesc 
modif_produse ('Craiova');
end;
/
begin  --niciunul
modif_produse ('Bumbesti Jiu');
end;
/
begin   -- un singur distribuitor
modif_produse ('Targu-Jiu');
end;
/
--ex10
--definiti un trigger care sa nu permită adăugarea de date in 
--tabelul DISTRIBUIE decât în zilele din cursul săptămânii
-- ( in programul de lucru)
create or replace trigger trigg_adaugare
        before insert on distribuie
begin
   if( to_char( SYSDATE, 'D') = 1 -- este duminica sau sambata
   or to_char(SYSDATE, 'D') = 7 or (to_char(SYSDATE,'HH24') NOT BETWEEN 8 AND 12) )
   then  RAISE_APPLICATION_ERROR ( -20001, 'Nu se pot face livrari in weekend');
    
   else
    dbms_output.put_line( 'Adaugarea s a realizat cu succes, cerintele au fost respectate');
    
   end if;
end;   

--
insert into distribuie( id_produs, id_distribuitor, id_farmacie,data_distribuire )
  values ( 9,2, 12,to_date('07/01/2021','dd/mm/yyyy')) ;
drop trigger trigg_adaugare;

--ex11
-- Definiti un trigger la nivel de linie care să nu permită
-- adăgarea în tabelul CUMPARA a unei linii daca statusul
-- produsului este indisponibil sau daca bugetul clientului este
--mai mic decat pretul produsului
create or replace trigger trig_cumpara
before insert on cumpara
for each row
declare
  v_status   produse_farmaceutice.status%type;
  v_pret   produse_farmaceutice.pret%type;
  v_buget clienti.buget%type;
begin
    select pret, status into v_pret, v_status
    from produse_farmaceutice
    where id_produs = : new.id_produs;
    
    select buget into v_buget
    from clienti
    where id_client= : new.id_client;
       if  lower(v_status)='indisponibil' then
       RAISE_APPLICATION_ERROR (-20002, 'Acest produs nu mai este disponibil');
    end if;
    
    if v_pret > v_buget  then
        RAISE_APPLICATION_ERROR (-20002, 'Clientul nu are suficienti bani pentru a cumpara acest produs');
    end if;
 
end;
/
-- testare pentru produs indisponibil
insert into cumpara (id_produs, id_client, id_farmacist, data, mod_plata)
  values ( 10,1,9, to_date('07/01/2021','dd/mm/yyyy'), 'CARD');
-- testare buget mai mic decat pret produs  
insert into cumpara (id_produs, id_client, id_farmacist, data, mod_plata)
  values ( 7,6,9, to_date('07/01/2021','dd/mm/yyyy'), 'CARD');
-- inseram un produs ca sa ne asiguram ca sunt respectate conditiile
--pentru ca trigger nu va bloca inserarea in cumpara
insert into produse_farmaceutice values(12, 'Septosol AMetil',6,102,to_date('17/05/2021', 'dd/mm/yyyy') ,to_date('18/01/2020', 'dd/mm/yyyy'), 5,'Disponibil' );

insert into cumpara (id_produs, id_client, id_farmacist, data, mod_plata)
  values ( 12,2,1, to_date('24/01/2020','dd/mm/yyyy'), 'CARD');
drop trigger trig_cumpara;
delete from cumpara where id_produs = 12 and id_client=2 ;
delete from produse_farmaceutice where id_produs = 12;
--ex12
--Definiți un trigger care adaugă informații in tabelul comenzi_useri( trebuie de asemenea creat
--despre  numele obiectului, evenimentul sistem, precum si data producerii
--evenimentului ) atunci când utlizatorul inițiază comenzi ca ALTER, CREATE, DROP
create table comenzi_useri( nume_obiect varchar2(50),
                            nume_eveniment varchar2(50),
                            data_eveniment date);
create or replace trigger trigg_ldd
after alter or create or drop on schema
begin
   insert into comenzi_useri
   values( sys.dictionary_obj_name, sys.sysevent,sysdate);
end;
/


create table test ( numar number(10));
drop table test;
select * from comenzi_useri;
drop trigger trigg_ldd;
drop table comenzi_useri;

--ex13
create or replace package pachet13
is
     procedure modificare_pret( procent in number );
     function salariu_mediu  return farmacisti.salariu%type ;
     function top_clienti (tip_nume tipuri.nume%type) return number;
     procedure modif_produse( v_oras farmacii.adresa%type);
end pachet13;
/
create or replace package body pachet13
is 
  -- ex6
  procedure modificare_pret( procent in number ) is
  type t1 is table of produse_farmaceutice.id_produs%type
             index by pls_integer;
  prod_farm t1;
 
begin
   select  distinct pf.id_produs
   bulk collect into prod_farm
   from produse_farmaceutice pf join distribuie ds on (ds.id_produs=pf.id_produs)
   join distribuitori di on (di.id_distribuitor = ds.id_distribuitor)
   where di.cifra_afaceri = ( select min(cifra_afaceri) from distribuitori)
   and  to_char(pf.data_expirare, 'YYYY') = 2021 ;
   
  --bulk bind
  forall j in prod_farm.first..prod_farm.last
  update produse_farmaceutice
  set pret= pret + pret*procent/100
  where id_produs = prod_farm(j);
 
  if SQL%rowcount =0 THEN
         dbms_output.put_line('Nu s-a actualizat nicio linie');
        else
        dbms_output.put_line(' Numărul total de linii actualizate este: ' ||to_char(SQL%rowcount));
         commit;
       end if;
end modificare_pret;

-- ex7
  function salariu_mediu
return farmacisti.salariu%type is
    s_mediu farmacisti.salariu%type :=0 ;
    v_nr number(4) :=0;
    
begin
    -- ciclu cursor cu subcereri
    for i in ( select nume, prenume, salariu
               from farmacisti
                where id_farmacie = ( select id_farmacie
                              from farmacisti
                              group by id_farmacie
                              having count(*) = ( select max(mycount)
                                                   from (select id_farmacie, count(*) mycount
                                                                   from farmacisti
                                                                   group by id_farmacie)
                                                             ))) loop
           dbms_output.put_line('Farmacistul: '||i.nume|| '  ' ||i.prenume || ' cu salariul: '||i.salariu);
           s_mediu := s_mediu + i.salariu;
           v_nr := v_nr +1;
    end loop;
        dbms_output.put_line('-----------------------');
        return ( s_mediu/ v_nr);
end salariu_mediu;
-- ex8
   function top_clienti (tip_nume tipuri.nume%type)
return number
is
 nr_clienti number(10) :=0;
  buget_total  clienti.buget%type :=0;
  data_prec cumpara.data%type;
  v_id tipuri.nume%type;
  top number(1) :=0;
  type vect1 is varray(50) of NUMBER(10);
  v_id_prod vect1;
  type vect2 is varray(50) of varchar2(20);
  v_denumire vect2;
  exista number;
begin
  select id_tip into v_id
  from tipuri
  where lower(nume) = lower (tip_nume);
   select id_produs, denumire bulk collect into  v_id_prod, v_denumire
   from produse_farmaceutice 
   where id_tip = v_id   ;
     
   for j in v_id_prod.first.. v_id_prod.last loop
        dbms_output.put_line('---------------------Produsul: '||v_denumire(j) || '-----------------  ');
        exista := 0;
        top :=0;
        for i in( select cl.nume, cl.prenume, cu.data, cl.buget
             from clienti cl , cumpara cu 
             where cl.id_client= cu.id_client
            and cu.id_produs = v_id_prod(j)
             order by cu.data )
        loop  
               exista := 1;
               if top = 0 then -- este primul client
                   top := top +1;
                   data_prec := i.data;
                 elsif top > 0 and  data_prec<> i.data  then
                      top := top+1;
                       data_prec := i.data;
                 else
                      data_prec := i.data;
    
                end if;
               exit when top=4  ;
               dbms_output.put_line('Clientul: '|| i.nume || '  '|| i.prenume ||' a cumparat la data ' || i.data);
               buget_total := buget_total + i.buget;
               nr_clienti := nr_clienti + 1;
                
        end loop;
        if  exista = 0 then
           dbms_output.put_line('Nu exista clienti pentru acest produs');
        end if;
    end loop;
    if nr_clienti = 0 then-- eroare
        raise ZERO_DIVIDE;
    end if;
    return round(buget_total/nr_clienti,2);
     

exception
   when NO_DATA_FOUND then
   dbms_output.put_line( 'Nu este niciun tip cu denumirea ' || tip_nume);
   return -1;
    when ZERO_DIVIDE then
    dbms_output.put_line( 'Nu puteti afla bugetul mediu pt ca nu exista clienti(impartirea la 0 genereaza eroare)');
    return -1;
    when others then
    dbms_output.put_line( 'Alta exceptie ');
    DBMS_OUTPUT.PUT_LINE ('Codul erorii: ' ||SQLCODE);
  DBMS_OUTPUT.PUT_LINE ('Mesajul erorii: ' ||SQLERRM);
    return -1;
end top_clienti;
 
 --ex9
 procedure modif_produse( v_oras farmacii.adresa%type) as
-- cursor cu parametru           
cursor pr( distr distribuitori.id_distribuitor%type ) is
    select distinct pf.id_produs, pf.denumire , pf.status , pr.nume
    from  produse_farmaceutice pf ,producatori pr, distribuie di
    where pf.id_producator = pr.id_producator and di.id_produs= pf.id_produs and
    di.id_distribuitor = distr;
    
v_distr distribuitori.id_distribuitor %type;
v_nume distribuitori.nume%type;

begin
    select id_distribuitor -- division
    into v_distr
    from distribuie join distribuitori using(id_distribuitor)
    where id_farmacie in
          ( select id_farmacie
            from farmacii
            where lower(adresa) =  lower(v_oras))
    group by id_distribuitor
    having count ( distinct id_farmacie) =
          ( select count(*)
            from farmacii
            where lower(adresa) = lower(v_oras) ) ;
    select  nume into v_nume  
    from distribuitori
    where id_distribuitor = v_distr;
   dbms_output.put_line('Distribuitorul  ' || v_nume || ' cu id-ul '|| v_distr);
   
    for i in pr(v_distr) loop
         
        
         dbms_output.put_line('Produsul' || i.denumire || ' cu statusul ' || i.status ||
         ' produs de '|| i.nume);
         update produse_farmaceutice
         set status = 'INDISPONIBIL'
         where id_produs = i.id_produs;
    end loop;
    commit;
    exception
         when TOO_MANY_ROWS then
         dbms_output.put_line('Exista mai multi distribuitori cu aceasta proprietate!');
         when NO_DATA_FOUND then
         dbms_output.put_line('Nu exista niciun distribuitor  cu aceasta proprietate! ');
         when others then
         dbms_output.put_line('Alta eroare');
END modif_produse;

end pachet13;
/
-- utilizare pachet
--caz firma cu cea mai mica cifra de afaceri distribuie
begin
pachet13.modificare_pret (10);
end;
/
--caz firma cu cea mai cifra de afaceri nu distribuie
insert into distribuitori values (7, 'Firma nu distribuie', 12, '0767999856');
begin
pachet13.modificare_pret (10);
end;
/
--caz  produsele distribuite nu expira in 2021(produsul 8, distribuit 7)
insert into distribuie values ( 8, 7, 18,to_date('08/10/2020', 'dd/mm/yyyy') );

begin
pachet13.modificare_pret (10);
end;
/
delete from distribuie where id_produs=8 and id_distribuitor=7 and id_farmacie=18;
delete from distribuitori where id_distribuitor=7;

--ex7
begin
dbms_output.put_line('Salariul mediu este: '|| pachet13.salariu_mediu);
end;
/
--ex8
-- exista clienti
declare 
   b clienti.buget%type;
begin
  b := pachet13.top_clienti('Paracetamol');
  if b > 0 then
 dbms_output.put_line('Bugetul mediu este: '|| b);
 end if;
end;
/

--nu exista denumirea
begin
if  pachet13.top_clienti('Magneziu') >0 then
    dbms_output.put_line('Bugetul mediu este: '|| pachet13.top_clienti('Magneziu'));
end if;
end;
/
-- nu exista client
begin
if ( pachet13.top_clienti('Vitamine') >0) then
    dbms_output.put_line('Bugetul mediu este: '|| pachet13.top_clienti('Vitamine'));
end if;
end;
/
--ex9
begin  -- mai multi distribuitori indeplinesc 
pachet13.modif_produse ('Craiova');
end;
/
begin  --niciunul
pachet13.modif_produse ('Bumbesti Jiu');
end;
/
begin   -- un singur distribuitor
pachet13.modif_produse ('Targu-Jiu');
end;
/
--ex14
--Să se creeze un pachet care afisează farmacistii din farmaciile în care au fost distribuite
-- produsele de un anumit tip ( tipul este trasmis ca parametru), dar care nu au vândut
--încă produsul respectiv
create or replace package pachet14
is
   type t_farmacisti is table of farmacisti.id_farmacist%type; -- linie de farmacisti
   linie_farm t_farmacisti := t_farmacisti();
   tab_rezultat t_farmacisti := t_farmacisti();
   
   type t_prod_farmacisti is table of t_farmacisti; -- tablou imbricat de linie farmacisti
   tab_farm_dist t_prod_farmacisti := t_prod_farmacisti(); --farmacisti care se afla in farmaciile in care sunt distribuite
   tab_farm_vnz t_prod_farmacisti := t_prod_farmacisti();-- farmacistii care vand
   
   
   type vect is varray(20) of produse_farmaceutice.id_produs%type;
   prod_farm vect := vect(); -- produsele farm de acel tip
   farmacist varchar2(50);
   function exista_tip ( v_id_tip tipuri.id_tip%type) return tipuri.nume%type;
   procedure gaseste_produse (idul_tip tipuri.id_tip%type);
   procedure farmacisti_distribuire;
   procedure farmacisti_vanzare;
   procedure farm_trb_vanz(idul tipuri.id_tip%type);
end pachet14;
/

create or replace package body pachet14
is
    function exista_tip ( v_id_tip tipuri.id_tip%type)
        return tipuri.nume%type
        is
         v_den  tipuri.nume%type;
        begin
            select nume into v_den
            from tipuri
            where id_tip = v_id_tip;
            
            return v_den;
        exception
            when NO_DATA_FOUND then
               return 'nu exista';
     end  exista_tip;
        
   procedure gaseste_produse( idul_tip tipuri.id_tip%type)
   is
   begin
        select id_produs bulk collect into prod_farm
        from produse_farmaceutice
        where id_tip= idul_tip;
        if prod_farm.count =0 then
           RAISE NO_DATA_FOUND;
        end if;
   

          
    end gaseste_produse;
    
    procedure farmacisti_distribuire --determina farmacistii din farmaciile unde au fost distribuite med
    is
    begin
        for i in prod_farm.first..prod_farm.last loop   
            tab_farm_dist.extend;
            select distinct id_farmacist bulk collect into linie_farm
            from farmacisti
            where id_farmacie in (select id_farmacie from distribuie where id_produs =prod_farm(i));
             if linie_farm.count !=0 then
             tab_farm_dist(i):= linie_farm;
             else
               linie_farm  := t_farmacisti();
                tab_farm_dist(i):= linie_farm;
               
             end if;
        end loop;
        
      end  farmacisti_distribuire;

    procedure farmacisti_vanzare --determina farmacistii care au vandut fiecare produs
    is
    begin
         for i in prod_farm.first..prod_farm.last loop   
            tab_farm_vnz.extend;
             select distinct id_farmacist bulk collect into linie_farm
             from cumpara
             where  id_produs =prod_farm(i);
             if linie_farm.count !=0 then 
             tab_farm_vnz(i):= linie_farm;
             else
                linie_farm  := t_farmacisti();
                 tab_farm_vnz(i):= linie_farm;
                
             end if;
          end loop;
           
    end farmacisti_vanzare;
    
    procedure farm_trb_vanz(idul tipuri.id_tip%type)
    is
    begin
          if ( exista_tip(idul) = 'nu exista') then
             dbms_output.put_line( 'Nu exista acest tip in baza de date');
          else
              dbms_output.put_line('Tipul de produse dat este: '||exista_tip(idul));
              
              gaseste_produse(idul);
              farmacisti_vanzare();
              
              farmacisti_distribuire();
             
                  for i in tab_farm_vnz.first..tab_farm_vnz.last loop
                  
                     dbms_output.put_line('Produsul: '|| prod_farm(i));
                    if  tab_farm_dist(i).count !=0 then  --produsul nu a fost distribuit
                     
                       if tab_farm_vnz(i).count !=0 then 
                          tab_rezultat := set(tab_farm_dist(i) MULTISET EXCEPT DISTINCT tab_farm_vnz(i));
                       else
                         tab_rezultat := tab_farm_dist(i);
                        end if;
                     for j in tab_rezultat.first..tab_rezultat.last loop
                          select nume|| '  ' || prenume into farmacist
                          from farmacisti
                          where id_farmacist= tab_rezultat(j);
                          dbms_output.put_line(farmacist);
                     end loop;
                     else
                       dbms_output.put_line('Acest produs nu a fost distribuit');
                     end if;
                    dbms_output.put_line('----------------------------------------');
                    
                  end loop;
          end if;
           exception
        when NO_DATA_FOUND then
           dbms_output.put_line('Nu exista niciun produs de acest tip');
        WHEN OTHERS THEN
             
             DBMS_OUTPUT.PUT_LINE ('Codul erorii: ' ||SQLCODE);
             DBMS_OUTPUT.PUT_LINE ('Mesajul erorii: ' ||SQLERRM);
    end farm_trb_vanz;
    
end pachet14;
/
   
--nu exista produsul in baza de date
begin
  pachet14.farm_trb_vanz(10);
end;

-- exita tipul, nu a fost distribuite produse ale acestui tip
begin
  pachet14.farm_trb_vanz(9);
end;

--exista tip, au fost distrb produse
begin
  pachet14.farm_trb_vanz(1);
end;









