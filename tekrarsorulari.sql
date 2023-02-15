1
--CREATE TABLE <data_type> (
--<column_name><data_type><constraint>)

CREATE TABLE author(
	id SERiAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR(100),
	birhday DATE
);

INSERT INTO author(first_name,last_name,email,birhday)
values ('Haruki','Maruki','haruk@ali.comi','1946-6-2'),
('Halide','edip','haruk@ali.comi','1946-6-2'),
('sabahattin','Ali','haruk@ali.comi','1946-6-2'),
('Resat','Nuri','haruk@ali.comi','1946-6-2');
select * FROM author

-- author tablosundan author2 tablosuna veri kopyalama
CREATE table author2 AS
SELECT *FROM author
WHERE first_name = 'Sabahattin';


--author3 tablosu olusturup veri kopyalayalım
CREATE TABLE author3 AS
SELECT * FROM author;
--ne var bakalım
SELECT * FROM author3;
--3. tablo olusturuldu ve 1. tablo kopyalandı.

--Tablo silme
DROP TABLE author;
--hata mesajı almamak icin 
DROP TABLE IF EXIST author;

--19 VERİLERİ GÜNCELLEMEK - SİLMEK
GENERATE DUMMY SERVİCE ARA GOOGLE---> MOCKAROO -- otomatik veri getirir.

--- veri güncelleme
UPDATE <table_name>
SET column1 = value1,
    column2 = value2,
    ......
    WHERE condition;

--örnek  
UPDATE author
SET first_name = 'caglar'
    last_name = 'aral',
    email = 'caglar@hotmail.com'
    birthday = '1994-04-10'
WHERE id = 10;  --id'si 10 olan satırdaki veriler değişti.

--v ile başlayanları değiştiriyor, sadece firstname ve lastname değişcek
UPDATE author
SET first_name = 'xxxx'
    last_name = 'yyyy',
WHERE first_name LIKE 'V%';


--örnek firstname odetta olanın lastname'i update olarak güncellendi
UPDATE author
SET last_name = 'UPDATE'
WHERE first_name ='Odetta'
RETURNING *;

--SİLME, İD'Sİ 6 OLAN ELEMAN SİLİNDİ, DİĞER VERİLERDE İD DEĞİŞİKLİĞİ OLMAZ
DELETE author
WHERE id = 6; VEYA WHERE id > 11
RETURNİNG *; -- VERİLERİ GERİ DÖNECEK

--23 NOT NULL ve ALTER
CREATE TABLE users (
    id SERİAL PRIMARY KEY,
    username VARCHAR(20),
    email VARCHAR(50),
    AGE INTEGER
);  ------TABLO OLUSTURDU

---VERİ GİRELİM TABLOMUZA
INSERT INTO users(username, email, age)
VALUES
	('tester', 'fgfk@gmail', 23);
sonra 
SELECT * FROM users; 
ile tablomuzu görüyoruz.

user name NULL olamaz. eksik veri olmamalı yani. tablo onceden olusturulmussa ot null'a çevirmek icin

ALTER TABLE users
ALTER COLUMN username
SET NOT NULL;

bunu yapabilmek icin null ifade olmamalı. user namede null varsa aşagıdaki gibi sileriz.

DELETE FROM users
WHERE username IS NULL
RETURNING *;  --SİLİNEN SATIRI GÖSTERCEK

--BOS BİR STRİNG NULL DEĞİLDİR. ('')

--24 UNIQUE
UNIQUE kısıtlaması ile uyguladığımız sütundaki verilerin birbirlerinden farklı benzersiz olmalarını isteriz. 
PRIMARY KEY kısıtlaması kendiliğinden UNIQUE kısıtlamasına sahiptir.
NOT NULL kısıtlamasında olduğu gibi tablo oluştururken veya ALTER komutu ile 
beraber tablo oluştuktan sonra da kullanabiliriz.

UNIQUE Kullanımı
Employees şeklinde bir tablomuzu oluşturalım. 
Tablodaki email sütununda bulunan verileri UNIQUE olarak belirlemek istersek.

CREATE TABLE Employees (
    ---
    emaile VARCHAR(100) UNIQUE,
    ----
);

ALTER ve UNIQUE
ALTER TABLE <tablo_adı>
ADD UNIQUE <sütun_adı>

Bu arada herhangi bir sütuna UNIQUE kısıtlaması getirirsek ve öncesinde UNIQUE olmayan verileri kaldrmamız gerekir.

--örnek
ALTER TABLE users
ADD UNIQUE (email);

25-CHECK
CHECK kısıtlaması ile uyguladığımız sütundaki verilere belirli koşullar verebiliriz. 
Örneğin age (yaş) olarak belirlediğimiz bir sütuna negatif değerler verebiliriz veya 
web portaline üye olan kullanıcıların yaşlarının 18 yaşından büyük olması gibi 
kendi senaryolarımıza uygun başka kıstlamalar da vermek isteyebiliriz.

CHECK kısıtlamasını da tablo oluştururken veya ALTER komutu ile beraber tablo oluştuktan sonra kullanabiliriz.

CHECK Kullanımı
Employees şeklinde bir tablomuzu oluşturalım. 
Tablodaki age sütununda bulunan verilerin 18'e eşit veya büyük olmasını istiyoruz.

CREATE TABLE Employees (
    ---
    age INTEGER CHECK (age>=18)
    ----
);
ALTER ve CHECK
ALTER TABLE <tablo_adı>
ADD CHECK (age>=18)
 
--örnek
INSERT INTO users(username, email, age)
VALUES 
 	('gamer4', 'fgfk@gmail', -23);
	
check ile age'e kısıtlama ekleyecegiz

ALTER TABLE users
ADD CHECK (age>18); --tabloda uymayan degerler varsa hata verir. bu durumda silelim uymayanı

DELETE FROM users
WHERE id = 11; --silmiş olduk 11deki elemanı

--id atanan 2 nolu eleman silinrse yeni eleman id si 3 olur 2 olmaz


--26 PSQL ve Uygulama II
PSQL, PostgreSQL ile birlikte gelen terminal tabanlı bir kullanıcı arayüzüdür. 
PSQL sayesinde komut satırında sorgular yazıp, sonuçlarını görebiliriz. 
Aşağıda temel PSQL komutlarının ilk bölümünü bulabilirsiniz.

1.PSQL ile PostgreSQL'e host, port, kullanıcı adı ve veritabanı ismi ile bağlanmak için:
psql -h <host_name> -p <port_name> -U <kullanıcı_adı> <veritabanı_adı>

2.Yeni veritabanı oluşturmak için
CREATE DATABASE <veritabanı_adı>

3.Yeni tablo oluşturmak için
CREATE TABLE <tablo_adı> (
  <sütun_adı> VERİ TİPİ (KISITLAMA)
  ----

4.Tablo detaylarını görmek için
\d+ <tablo_adı>

5.Bir tablodaki sütun ismini değiştirmek için
ALTER TABLE <tablo_adı> RENAME COLUMN <sütun_adı> TO <yeni_sütun_adı>

6.Bir sütuna UNIQUE kısıtlaması eklemek için
ALTER TABLE <tablo_adı> ADD CONSTRAINT <kısıtlama_adı> UNIQUE <sütun_adı>



27 JOIN Kavramı (Birleştirme)
Veraitabanları çoğunlukla birbiri ile ilşkili olan tablolardan oluşur. Bu birbiri ile ilişkili olan tablardaki verileri farklı JOIN yapıları kullanarak sanal olarak birleştirip daha anlamlı veriler haline getirebiliriz.

INNER JOIN
INNER JOIN yapısı sayesinde birbiriyle ilişkili olan tabloların birbiriyle eşleşen (kesişen) 
verilerini sıralayabiliriz. 
Senaryomuzda kitapları gösterdiğimiz book tablosu ve yazarları gösterdiğimiz author tablosu var, 
author tablosunun id sütunuyla book tablosunun author_id sütunlarında bulunan 
veriler sayesinde her iki tabloya ait bilgilerden daha anlamlı sonuçları elde edebiliriz.

Aşağıdaki SQL sorgusunda kitap isimlerini yazar isim ve soyisimler ile birlikte gösterebiliriz.

SELECT book.title, author.first_name, author.last_name
FROM book
JOIN author ON author.id = book.author_id;

Yukarıdaki sorgumuzda tablolar arasındaki eşleşmeyi author.id ve
book.author_id sütunları yardımıyla yapıyoruz.

Inner Join
Yukarıdaki görselimizde de gördüğümüz üzere INNER JOIN tablolar arasındaki eşleşen (kesişen) verileri sıralar. 
Bundan dolayı INNER JOIN yapısı simetriktir, author - book tablolarının yerlerinin değiştirilmesi sonucu etkilemez.

INNER JOIN Söz Dizimi
SELECT <sütun_adı>, <sütun_adı> ...
FROM <tablo1_adı>
INNER JOIN <tablo2_adı>
ON <tablo1_adı>.<sütun_adı> = <tablo2_adı>.<sütun_adı>;


Buradaki tablo1 "left table", tablo2 "right table" olarak da adlandırılır.

--ÖR
SELECT title, first_name, last_name FROM book
INNER JOIN author ON book.author_id = author.id; --farklı tablolardaki verileri birşeltirir.
--tüm sutün için;
SELECT *FROM book
INNER JOIN author ON book.author_id = author.id; 

--ör aşg gibi de yazabiliriz 2 tablo birleşir
SELECT book.title, author.first_name, author.last_name FROM book
INNER JOIN author ON book.author_id = author.id; 


35.SUBQUERY AND JOIN
Altsorgular ve JOIN kavramları birlikte çok sık kullanılırlar. 
Aşağıdaki iki senaryoda bu iki yapıyı birlikte kullanacağız.

İlk senaryomuz: bookstore veri tabanında kitap sayfası ortalama kitap sayfası sayısından 
fazla olan kitapların isimlerini, bu kitapların yazarlarına ait isim ve soyisim bilgileriyle 
birlikte sıralayınız.

SELECT author.first_name, author.last_name, book.title
FROM author
INNER JOIN book ON book.author_id = author.id
WHERE page_number >
(
  SELECT AVG(page_number) FROM book
);

Yukarıdaki sorgumuzda kitaplara ait yazar bilgilerini JOIN kullanarak elde ediyoruz. 
Ortalama sayfa sayısını da alt sorgudan getiriyoruz.

İkinci senaryomuz: dvdrental veritabanında en uzun filmlerin isimlerini aktör isim 
ve soyisimleriyle birlikte sıralayalım.
iki tablo arasındaki ilişkiyi nasıl kuracagız.

SELECT actor.first_name, actor.last_name, film.title
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE film.length =
(
  SELECT MAX(length)  FROM film
)
 
Burada da görmüş olduğumuz gibi film lerin aktör bilgilerini ikili JOIN yapısı kullanarak elde ediyoruz. 
En uzun film süresini de alt sorgudan getiriyoruz.

36.RECAP 

--film tablosunda isminde en az 4 adet 'e' veya 'E' karakteri bulunan kç tane film vardır? 
SELECT COUNT(*) 
FROM film
WHERE ILIKE '%e%e%e%e%' --ILIKE BYÜK KÜCÜK HARF DUYARLILIGI YOK

--category tablosundan kategori isimlerini ve kategori başına düşen film sayılarını sıralayınız.
FİLM KATEGOTY tablosu ile ilişki saglanır

SELECT COUNT(*), category.name
FROM category 
JOIN film_category ON film_category.category_id = category.category_id
JOIN film ON film.film_id = film_categoty.film_id
GROUP BY category.name;

film tablosunda içerisinden en fazla sayıda film bulunduran rating kategorisi hangisidir?
SELECT COUNT (*), rating
FROM film;
GROUP BY rating;
ORDER BY COUNT(*) DESC --SIRALADI 
LIMT 1; --1 TANESİNİ GÖSTERDİ

film tablosundan 'K' karakteri ile başlayan en uzun ve replacenet_cost u en düşük 4 filmi sıralayınız.
SELECT title, length, leplacement_cost
FROM film 
WHERE title LIKE 'K%' --BÜYÜK HARF HASSASİYETİ VAR
ORDER BY length DESC, replacement_cost ASC
LIMIT 4;

customer tablosunda en çok alışveriş yapan müşterinin adı nedir?
--amountu toplayrak her idnin yaptıgı harcamayı bulacagız

SELECT SUM(amount), customer.first_name, customer.last_name
FROM payment
JOIN  customer ON customer_id = payment.customer.id
GROUP BY payment.customer_id, customer.first_name, customer.last_name;   --SORGUYU CUSTOMER'E GÖRE YAPTIGIMIZ İÇİN GRUPLUYORUZ.
ORDER BY SUM(amount) DESC
LIMIT 1;