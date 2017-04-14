/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH07E03.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

domains			/*Berisi jenis parameter yang akan digunakan*/
  list = integer* 		/* List yang digunakan menggunakan tipe integer*/

predicates		/*Berisi daftar deklarasi nama yg akan digunakan*/
  length_of(list,integer,integer) - procedure (i,o,i)	/*menggunakan lenght_of kalikan dengan prosedur argumen (list,integer,integer) - list sbg input, integer sbg output, integer sbg input*/


clauses			/*Berisi fakta dan aturan yang akan dipakai*/
  length_of([], Result, Result).		/*aturan yaitu lenght_of berisi [] atau list kosong memiliki result,result*/
  length_of([_|T],Result,Counter):-		/*aturan yaitu lenght_of berisi [_|T] atau list memiliki result dan counter*/
	NewCounter = Counter + 1,			/*jika, NewConter berisi dari counter + 1*/
	length_of(T, Result, NewCounter).		/*lenght_of berisi Tail , result dan NewCounter*/

goal			/*Tujuan akhir yang akan dicapai*/
  length_of([1,2,3],L,0). /* start with Counter = 0 */
  		/* mencari panjang list dari lenght_of dengan 0
  		   1 = head   = 1
  		   2,3 = tail = 2
  		  Counter 0
  		   NewCounter = Counter + 1
  		   	      = 0   +   1
  		   	      = i
  		   	      
  		  length_of = tail + NewCounter
  		   	    = 2   +   1
  		   	    = 3
  		   	      
  		  Jadi, hasil list akan keluar L = 3
  		*/
  		