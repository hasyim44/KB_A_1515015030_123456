/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH07E02.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

domains			/*Berisi jenis parameter yang akan digunakan*/
  list = integer* 		/* List yang digunakan menggunakan tipe integer*/

predicates		/*Berisi daftar deklarasi nama yg akan digunakan*/
  length_of(list,integer) - procedure (i,o)	/*menggunakan lenght_of kalikan dengan prosedur argumen (list,integer) - list sbg input dan integer sbg output*/

clauses			/*Berisi fakta dan aturan yang akan dipakai*/
  length_of([], 0).			/*aturan yaitu lenght_of berisi [] atau list kosong memiliki nilai 0*/
  length_of([_|T],L):-			/*aturan yaitu lenght_of berisi [_|T] atau list memiliki Head dan juga Tail*/
	length_of(T,TailLength),		/*jika, lenght_of berisi Tail dan TailLenght*/
	L = TailLength + 1.			/* panjang list berisi dari TailLenght + 1*/

goal			/*Tujuan akhir yang akan dicapai*/
  length_of([1,2,3],L).			/*
  					mencari panjang list dari lenght_of
  					1 = head   = 1
  					2,3 = tail = 2
  					lenght_of = TailLenght + 1
  					          = 2	+    1
  					          = 3
  					jadi, hasil list akan keluar L = 3 
  					*/
