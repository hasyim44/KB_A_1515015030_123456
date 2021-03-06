DOMAINS			/*Berisi deklarasi jenis parameter yang akan digunakan*/
merek,warna = symbol	/*dalam parameter merek dan dan warna menggunakan domain symbol*/
usia = byte		/*dalam parameter usia menggunakan domain byte*/
harga, kilometer = long /*dalam parameter harga dan kilometer menggunakan domain long*/

PREDICATES		/*Berisi daftar deklarasi nama yg akan digunakan*/
nondeterm mobil(merek,kilometer,usia,warna,harga) /*nondeterm untuk memberitahu compailer bahwa predikat memiliki lebih dari satu kemungkinan jawaban*/
						  /*disini menggunakan predikat mobil*/
						  /*dengan prosedur berisi argumen (merk,kilometer,usia,warna,harga) */

CLAUSES			/*Berisi fakta dan aturan yang akan dipakai*/
mobil(atoz,130000,3,merah,120000000).		/*Atoz adalah mobil dengan 130000km 3thn warna merah harga 120jt*/
mobil(karimun,90000,4,silver,100000000).	/*Karimun adalah mobil dengan 90000km 4thn warna silver harga 100jt*/
mobil(ceria,8000,1,hitam,75000000).		/*Ceria adalah mobil dengan 8000km 1thn warna hitam harga 75jt*/

GOAL			/*Tujuan akhir yang akan dicapai*/
mobil(karimun, 90000,4, silver, 100000000).	/*Apakah benar karimun adalah mobil dengan 9000km 4thn warna silver harga 100jt*/
						/*Maka nanti akan keluar hasil "Yes"*/