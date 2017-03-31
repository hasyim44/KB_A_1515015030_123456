DOMAINS		/*Mendeklarasikan jenis parameter yang akan digunakan*/
	orang = orang(nama,alamat)			/*dalam parameter orang ada objek jamak yaitu orang yang argumennya (nama,alamat)*/
	nama = nama(pertama,kedua)			/*dalam parameter nama ada objek jamak nama yang argumennya (pertama,kedua)*/
	alamat = alamat(jalan,kota_kab,propinsi)	/*dalam parameter alamat ada objek jamak alamat yang argumennya (jalan,kota_kab,propinsi)*/
	jalan = jalan(nama_jalan,nomor)			/*dalam parameter jalan ada objek jamak jalan yang argumennya (nama_jalan,nomor)*/
	kota_kab,propinsi,nama_jalan = string		/*dalam parameter kota_kab,propinsi,nama_jalan menggunakan domain string*/
	pertama,kedua = symbol				/*dalam parameter pertama, kedua ada objek jamak orang yang argumennya (nama,alamat)*/
	nomor = integer					/*dalam parameter nomor menggunakan domain integer*/
GOAL		/*Tujuan akhir yang akan dicapai*/
	P1 = orang(nama(diena,fatihah), alamat(jalan("Wijaya Kusuma", 12), "Berbah", "DIY")),	/*Data pertama yang berisi lengkap*/
	P1 = orang(nama(_,fatihah),Alamat),		/*Data akan memanggil alamat pada P1 pertama lalu ditambah dengan alamat*/
	P2 = orang(nama(nur,fatihah),Alamat),		/*Data akan memanggil alamat pada P1 pertama lalu ditambah denan alamat*/
	write("P1=",P1),nl,				/*Data P1 ini akan dijalankan pertama dan hasilnya akan sama dengan P1 pertama yang lengkap*/
	write("P2=",P2),nl.				/*Data P2 ini akan dijalankan pertama dan hasilnya akan sama dengan P2 pertama yang lengkap*/