

DOMAINS		/*Mendeklarasikan jenis parameter yang akan digunakan*/
	benda = buku(judul, pengarang) ;	/*dalam parameter benda ada domain-campuran jamak yaitu buku yang type argumennya (judul,pengarang)*/
		kuda(nama) ; 			/*kuda(nama)*/
		kapal ;				/*kapal*/
		bukubank(saldo)			/*bukubank(saldo)*/
	judul, pengarang, nama = symbol		/*dalam parameter judul, pengarang dan kilometer menggunakan domain simbol*/
	saldo = real				/*dalam parameter saldo menggunakan domain real*/
PREDICATES	/*Berisi daftar deklarasi nama yg akan digunakan*/
	nondeterm milik(nama,benda)	/*nondeterm untuk memberitahu compailer bahwa predikat memiliki lebih dari satu kemungkinan jawaban*/
CLAUSES		/*Berisi fakta dan aturan yang akan dipakai*/
	milik(erwin, buku("Markesot Bertutur", "Emha Ainun Najib")).	/* Erwin memiliki buku Markesot Bertutur dan pengaranganya Emha Ainun Najib */
	milik(erwin, kuda(buraq)). 					/* Erwin memiliki kuda buraq */
	milik(erwin, kapal). 						/* Erwin memiliki kapal */
	milik(erwin, bukubank(1000)). 					/* Erwin memiliki bukubank dengan nilai 1000 */
GOAL		/*Tujuan akhir yang akan dicapai*/
	milik(erwin, Benda). /*Erwin memiliki benda dan benda itu bisa berbentuk buku,pengarang,kuda dan bukubank */