DROP DATABASE IF EXISTS trgovina;
CREATE DATABASE trgovina;
USE trgovina;

CREATE TABLE kupac (
	id INTEGER NOT NULL,
	ime VARCHAR(10) NOT NULL,
	prezime VARCHAR(15) NOT NULL
);

CREATE TABLE zaposlenik (
	id INTEGER NOT NULL,
	ime VARCHAR(10) NOT NULL,
	prezime VARCHAR(15) NOT NULL,
	oib CHAR(11) NOT NULL,
	datum_zaposlenja DATETIME NOT NULL
);

CREATE TABLE artikl (
	id INTEGER NOT NULL,
	naziv VARCHAR(20) NOT NULL,
	cijena NUMERIC(10,2) NOT NULL
);

CREATE TABLE racun (
	id INTEGER NOT NULL,
	id_zaposlenik INTEGER NOT NULL,
	id_kupac INTEGER NOT NULL,
	broj VARCHAR(100) NOT NULL,
	datum_izdavanja DATETIME NOT NULL
);

CREATE TABLE stavka_racun (
	id INTEGER NOT NULL,
	id_racun INTEGER NOT NULL,
	id_artikl INTEGER NOT NULL,
	kolicina INTEGER NOT NULL
);


/* == Unos podataka == */
INSERT INTO kupac VALUES (1, 'Lea', 'Fabris'),
                         (2, 'David', 'Sirotić'),
                         (3, 'Tea', 'Bibić');

INSERT INTO zaposlenik VALUES 
	(11, 'Marko', 'Marić', '123451', STR_TO_DATE('01.10.2020.', '%d.%m.%Y.')),
	(12, 'Toni', 'Milovan', '123452', STR_TO_DATE('02.10.2020.', '%d.%m.%Y.')),
	(13, 'Tea', 'Marić', '123453', STR_TO_DATE('02.10.2020.', '%d.%m.%Y.'));

INSERT INTO artikl VALUES (21, 'Puding', 5.99),
                          (22, 'Milka čokolada', 30.00),
                          (23, 'Čips', 9);

INSERT INTO racun VALUES 
	(31, 11, 1, '00001', STR_TO_DATE('05.10.2020.', '%d.%m.%Y.')),
	(32, 12, 2, '00002', STR_TO_DATE('06.10.2020.', '%d.%m.%Y.')),
	(33, 12, 1, '00003', STR_TO_DATE('06.10.2020.', '%d.%m.%Y.'));

INSERT INTO stavka_racun VALUES (41, 31, 21, 2),
                                (42, 31, 22, 5),
                                (43, 32, 22, 1),
                                (44, 32, 22, 1);
                                
                 
                 
                 

-- Prikaži sve kupce sa imenom 'Lea' ili 'David'
Select * From kupac where ime = "Lea" or ime = "David";




















-- Prikaži id-eve i puno ime (spojeno ime i prezime) svih kupaca
Select id,  CONCAT(ime, ' ', prezime) As puno_ime
From kupac;
















-- Prikaži sve artikle koji imaju cijenu između 6 i 100 (tj. [6, 100]) 
-- i sortiraj rezultat silazno prema cijeni
SELECT * FROM artikl 
WHERE cijena > 6 and cijena < 100
ORDER BY cijena DESC;














-- Prikaži imena sa velikim slovima i dužinu imena (broj slova u imenu) 
-- svih kupaca čije prezime završava na 'ić'

















-- Prikaži sva jedinstvena prezimena zaposlenika

















-- Prikaži sva imena zaposlenika i kupaca u jednom stupcu

















-- Prikaži prezimena i imena svih zaposlenika tako da su 
-- sortirani silazno prvo po prezimenu pa po imenu

















-- Prilaži sve kupce i njihove pripadne račune
SELECT * FROM kupac LEFT OUTER JOIN racun on racun.id_kupac = kupac.id;
















-- Prikaži sve kupce i njihove pripadne račune, 
-- a pritom prikazati i kupce koji nemaju niti jedan račun

















-- Prikaži sve kupce i zaposlenike koji su "surađivali" (navedeni na istim računima),
-- pritom prikazati kupce i zaposlenike koji nisu navedeni na niti jednom računu

















-- Prikaži sve zaposlenike koji se zovu 'Lea', 'David' ili 'Tea'
Select * 
From zaposlenik
WHERE ime IN ("Lea", "David", "Tea"); 
















-- Prikaži najveću, najmanju i srednju cijenu artikala

















-- Prikaži artikl sa najvećom cijenom
SELECT * FROM artikl 
WHERE cijena = (SELECT MAX(cijena) FROM artikl);
















-- Prikaži sve kupce i broj njihovih računa
SELECT kupac.id, kupac.ime, kupac.prezime, COUNT(racun.id_kupac) as broj_racuna
FROM kupac 
LEFT OUTER JOIN racun on racun.id_kupac = kupac.id
GROUP BY kupac.id, kupac.ime, kupac.prezime;

















-- Prikaži sve kupce i broj njihovih računa, pritom prikazati samo one kupce koji imaju barem dva računa
SELECT kupac.id, kupac.ime, kupac.prezime, COUNT(racun.id_kupac) as broj_racuna
FROM kupac 
LEFT OUTER JOIN racun on racun.id_kupac = kupac.id
GROUP BY kupac.id, kupac.ime, kupac.prezime
HAVING broj_racuna >= 2;






-- Prikaži sve račune i njihov ukupan iznos







-- Prikaži sve artikle koji su izdani u ukupnoj količini većoj od 5







-- Napravi pogled koji prikazuje sve račune i njihov ukupan iznos







-- Napravi pogled koji prikazuje skupe artikle (cijena > 10), pritom se kroz pogled mogu unositi podaci







-- Napravi pogled koji prikazuje skupe artikle (cijena > 10), pritom se kroz pogled mogu unositi samo podaci koji zadovoljavaju uvjet (cijena > 10)








