DOMAINS					/*Mendeklarasikan jenis parameter yang akan digunakan*/
	nama,jender,pekerjaan,benda,alasan,zat = symbol /*dalam parameter nama,jender,pekerjaan,benda,alasan,zat menggunakan domain symbol*/
	umur=integer					/*dalam parameter umur menggunakan domain integer*/
PREDICATES				/*Berisi daftar deklarasi nama yg akan digunakan*/
					/*nondeterm untuk memberitahu compailer bahwa predikat memiliki lebih dari satu kemungkinan jawaban*/
	nondeterm orang(nama, umur, jender, pekerjaan)	/*orang sebagai predikat dengan argumen prosedur(nama,umur,jender,pekerjaan)*/
	nondeterm selingkuh(nama, nama)			/*selingkuh sebagai predikat dengan argumen prosedur(nama,nama)*/
	terbunuh_dengan(nama, benda)			/*terbunuh dengan sebagai predikat dengan argumen prosedur(nama,benda)*/
	terbunuh(nama)					/*terbunuh sebagai predikat dengan argumen prosedur(nama)*/
	nondeterm pembunuh(nama)			/*pembununh sebagai predikat dengan argumen prosedur(nama)*/
	motif(alasan)					/*motif sebagai predikat dengan argumen prosedur(alasan)*/
	ternodai(nama, zat)				/*ternodai sebagai predikat dengan argumen prosedur(nama,zat)*/
	milik(nama, benda)				/*milik sebagai predikat dengan argumen prosedur(nama,umur,jender,pekerjaan)*/
	nondeterm cara_kerja_mirip(benda, benda)	/*cara kerja mirip sebagai predikat dengan argumen prosedur(benda,benda)*/
	nondeterm kemungkinan_milik(nama, benda)	/*kemungkinan mirip sebagai predikat dengan argumen prosedur(nama,benda)*/
	nondeterm dicurigai(nama)			/*dicurigai sebagai predikat dengan argumen prosedur(nama)*/
	
/* * * Fakta-fakta tentang pembunuhan * * */
CLAUSES						/*Data yang ada dalam pembunuhan akan dideklarasikan*/
	orang(budi,55,m,tukang_kayu).		/*Budi adalah Orang dengan usia 55thn jender m pekerjaan tukang kayu*/
	orang(aldi,25,m,pemain_sepak_bola).	/*Aldi adalah Orang dengan usia 25thn jender m pekerjaan pemian sepak bola*/
	orang(aldi,25,m,tukang_jagal).		/*Aldi adalah Orang dengan usia 25thn jender m pekerjaan tukang jagal*/
	orang(joni,25,m,pencopet).		/*Joni adalah Orang dengan usia 25thn jender m pekerjaan pencopet*/
	
	selingkuh(ina,joni).			/*Ina adalah selingkuhan joni*/
	selingkuh(ina,budi).			/*Ina adalah selingkuhan budi*/
	selingkuh(siti,joni).			/*Siti adalah selingkuhan joni*/
	
	terbunuh_dengan(siti,pentungan).	/*Siti terbunuh dengan menggunakan pentungan*/
	terbunuh(siti).				/*Siti adalah korban yg terbunuh*/
	
	motif(uang).				/*Uang diduga sebagai motif*/
	motif(cemburu).				/*Cemburu diduga sebagai motif*/
	motif(dendam).				/*Dendam diduga sebagai motif*/
	
	ternodai(budi, darah).			/*Budi telah ternodai oleh darah*/
	ternodai(siti, darah).			/*Siti telah ternodai oleh darah*/
	ternodai(aldi, lumpur).			/*Aldi telah ternodai oleh lumpur*/
	ternodai(joni, coklat).			/*Joni telah ternodai oleh cokelat*/
	ternodai(ina, coklat).			/*Ina telah ternodai oleh cokelat*/
	
	milik(budi,kaki_palsu).			/*Budi adalah pemilik kaki palsu*/
	milik(joni,pistol).			/*Joni adalah pemilik pistol*/
	
/* * * Basis Pengetahuan * * */			/*Mencari Benda yang digunakan*/
	cara_kerja_mirip(kaki_palsu, pentungan). /*Kaki palsu memiliki cara kerja mirip dengan pentungan*/
	cara_kerja_mirip(balok, pentungan).	 /*Balok memiliki cara kerja mirip dengan pentungan*/
	cara_kerja_mirip(gunting, pisau).	 /*Gunting memiliki cara kerja mirip dengan pentungan*/
	cara_kerja_mirip(sepatu_bola, pentungan)./*Sepak Bola memiliki cara kerja mirip dengan pentungan*/
							/*Penggunaan Variabel X untuk argumen Pembunuh*/
	kemungkinan_milik(X,sepatu_bola):-	/*X adalah pelaku yang kemungkinan memiliki sepatubola, jika*/
		orang(X,_,_,pemain_sepak_bola).		/*X adalah orang yang memiliki pekerjaan pemain sepak bola*/
	kemungkinan_milik(X,gunting):-		/*X adalah pelaku yang kemungkinan memiliki gunting, jika*/
		orang(X,_,_,pekerja_salon).		/*X adalah orang yang memilik pekerjaan ssebagai pekerja salon*/
	kemungkinan_milik(X,Benda):-		/*X adalah pelaku yang kemungkinan memiliki Benda, jika*/
		milik(X,Benda).				/*X adalah pemilik dari Benda*/
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. ***Penggunaan Variabel X untuk argumen Pembunuh***
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	dicurigai(X):-				/*Pernyatan X adalah dicurigai membununuh, jika*/
		terbunuh_dengan(siti,Senjata) ,		/*Siti telah terbunuh dengan Senjata,*/
		cara_kerja_mirip(Benda,Senjata) ,	/*Benda memiliki cara kerja mirip dengan Senjata,*/
		kemungkinan_milik(X,Benda).		/*X adalah pelaku yang kemungkinan memiliki Benda*/
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
	dicurigai(X):-			/*Pernyatan X adalah dicurigai membununuh, jika*/
		motif(cemburu),			/*Cemburu adalah moti,f*/	
		orang(X,_,m,_),			/*X adalah orang yang memiliki jender m,*/
		selingkuh(siti,X).		/*Siti adalah selingkuhan dari X*/
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
	dicurigai(X):-			/*Pernyatan X adalah dicurigai membununuh, jika*/
		motif(cemburu),			/*Cemburu adalah motifnya,*/
		orang(X,_,f,_),			/*X adalah Orang memiliki jender f,*/
		selingkuh(X,Lakilaki),		/*X adalah selingkuhan dari Lakilaki,*/
		selingkuh(siti,Lakilaki).	/*Siti adalah selingkuhan dari Lakilaki*/
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
	dicurigai(X):-			/*Pernyatan X adalah dicurigai membununuh, jika*/
		motif(uang),			/*Uang adalah motif*/
		orang(X,_,_,pencopet).		/*X adalah pelaku yang memiliki pekerjaan sebagai pencopet*/
	pembunuh(Pembunuh):-		/*Pernyataan Pembunuh adalah pembunuh*/
		orang(Pembunuh,_,_,_),		/*Pembunuh adalah orang,*/
		terbunuh(Terbunuh),		/*Terbunuh adalah yang terbunuh,*/
		Terbunuh <> Pembunuh, 		/* Terbunuh Bukan bunuh diri, */
		dicurigai(Pembunuh),		/*Pembunuh adalah yang telah dicurigai,*/
		ternodai(Pembunuh,Zat),		/*Pembunuh adalah yang telah ternodai oleh Zat*/
		ternodai(Terbunuh,Zat).		/*Terbunuh adalah yang telah ternodai oleh Zar*/
GOAL
	pembunuh(X).			/*X adalah pelaku pembunuhan*/
					/*maka X = Budi*/