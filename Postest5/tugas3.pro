DOMAINS		/*Berisi deklarasi jenis parameter yang akan digunakan*/
	nama = orang(symbol,symbol)				 /*dalam parameter merek dan dan warna menggunakan domain (symbol,symbol) (Pertama , Kedua) */
	hari_lahir = tanggal_lahir(integer,symbol,integer) 	/* dalam parameter tanggal_lahir ada objek jamak yaitu tanggal_lahir yang argumennya (integer,symbol,integer)(Hari, Bulan, Tahun) */
	telepon = symbol 					/* dalam parameter telepon menggunakan domain symbol */
PREDICATES	/*Berisi daftar deklarasi nama yg akan digunakan*/
	nondeterm daftar_telepon(nama,symbol,hari_lahir)	/*nondeterm untuk memberitahu compailer bahwa predikat memiliki lebih dari satu kemungkinan jawaban*/
								/*daftar_telepon sebagai predikat dengan argumen prosedur(nama,symbol,hari_lahir)*/
	yang_ulang_tahun_bulan_ini
	konversi_bulan(symbol,integer)				/*konversi_bulan sebagai predikat dengan argumen prosedur(symbol,integer)*/
	cek_bulan_ulang_tahun(integer,hari_lahir)		/*cek_bulan_ulang_ sebagai predikat dengan argumen prosedur(integer,hari_lahir)*/
	cetak_orang(nama)					/*cetak_orang sebagai predikat dengan argumen prosedur(nama)*/
CLAUSES		/*Berisi fakta dan aturan yang akan dipakai*/
	yang_ulang_tahun_bulan_ini:-				/*Data akan akan diambil yang ulang tahun bulan ini*/
	write("**** Daftar Orang Yang Ulang Tahun Bulan Ini ****"),nl, /*Akan di tuliskan daftar orang yg ulang tahun bulan ini*/
	write(" Nama Pertama\t\t Nama Kedua\n"),			/*Akan di tuliskan nama yg pertama dan kedua */
	write("******************************************************"),nl,
	date(_, Bulan_ini, _), /* Ambil bulan pada sistem komputer */	/*Pada bulan ini*/
	daftar_telepon(Orang, _, Tanggal),				/*daftar telepon*/
	cek_bulan_ulang_tahun(Bulan_ini, Tanggal),
	cetak_orang(Orang),
	fail.								/*pencarian selesai*/
	yang_ulang_tahun_bulan_ini:-
	write("\n\n Tekan sembarang tombol..."),nl,
	readchar(_).
	cetak_orang(orang(Pertama,Kedua)):-
	write(" ",Pertama,"\t\t\t ",Kedua),nl.
	cek_bulan_ulang_tahun(Bul,tanggal_lahir(_,Bulan,_)):-
	konversi_bulan(Bulan,Bulan1),
Bul = Bulan1.
	daftar_telepon(orang(erwin,effendy),"767-8463",tanggal_lahir(3,jan,1955)).	/*Data pada bulan januari */
	daftar_telepon(orang(pramudya,kurniawan),"438-8400",tanggal_lahir(5,feb,1985)).	/*Data pada bulan februari */
	daftar_telepon(orang(kusdiar,prihatin),"555-5653",tanggal_lahir(3,mar, 1935)).	/*Data pada bulan maret */
	daftar_telepon(orang(ui,yansen),"767-2223",tanggal_lahir(29,apr,1951)).		/*Data pada bulan april*/
	daftar_telepon(orang(roland,hutagalung),"555-1212",tanggal_lahir(12,may,1962)).	/*Data pada bulan may */
	daftar_telepon(orang(andi,nuruddin),"438-8400",tanggal_lahir(17,jun,1980)).	/*Data pada bulan juni */
	daftar_telepon(orang(syarif,musadek),"767-8463",tanggal_lahir(20,jun,1986)).	/*Data pada bulan juni*/
	daftar_telepon(orang(lidya,widyawati),"555-5653",tanggal_lahir(16,jul,1981)).	/*Data pada bulan juli*/
	daftar_telepon(orang(yusida,andriani),"767-2223",tanggal_lahir(10,aug,1981)).	/*Data pada bulan agustus */
	daftar_telepon(orang(slamet,riyadi),"438-8400",tanggal_lahir(25,sep,1981)).	/*Data pada bulan september*/
	daftar_telepon(orang(nur,harjanto),"438-8400",tanggal_lahir(20,oct,1952)).	/*Data pada bulan oktober*/
	daftar_telepon(orang(dian,marlini),"555-1212",tanggal_lahir(9,nov,1984)).	/*Data pada bulan november*/
	daftar_telepon(orang(teguh,heni),"767-2223",tanggal_lahir(15,nov,1987)).	/*Data pada bulan november*/
	daftar_telepon(orang(eka,ardiyanti),"438-8400",tanggal_lahir(31,dec,1981)).	/*Data pada bulan desember */
	daftar_telepon(orang(sri,sugiarti),"512-5612",tanggal_lahir(3,mar, 1935)).	/*Data pada bulan maret*/
	daftar_telepon(orang(aldi,badwin),"513-5634",tanggal_lahir(13,mar, 1945)).	/*Data pada bulan maret*/
	daftar_telepon(orang(gigi,gilang),"514-5656",tanggal_lahir(23,mar, 1955)).	/*Data pada bulan maret*/
	daftar_telepon(orang(titi,cokelat),"515-5678",tanggal_lahir(30,mar, 1965)).	/*Data pada bulan dmaret*/
	
	konversi_bulan(jan, 1).
	konversi_bulan(feb, 2).
	konversi_bulan(mar, 3).
	konversi_bulan(apr, 4).
	konversi_bulan(may, 5).
	konversi_bulan(jun, 6).
	konversi_bulan(jul, 7).
	konversi_bulan(aug, 8).
	konversi_bulan(sep, 9).
	konversi_bulan(oct, 10).
	konversi_bulan(nov, 11).
	konversi_bulan(dec, 12).
GOAL		/*Tujuan akhir yang akan dicapai*/
	yang_ulang_tahun_bulan_ini.	
	
	/*Data yang ulang tahun bulan ini akan keluar
 kusdiar		 prihatin
 sri			 sugiarti
 aldi			 badwin
 gigi			 gilang
 titi			 cokelat
	
Karena mereka pada bulan maret*/