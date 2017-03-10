Predicates
 	nondeterm pria(String)
 	nondeterm wanita(String)
 	nondeterm anak(String,String)
 	nondeterm istri(String,String)	
 	nondeterm ayah(String,String)
 	nondeterm ibu(String,String)
 	nondeterm adik(String,String)
 	nondeterm cucu(String,String)
 	nondeterm kakek(String,String)
 	nondeterm usia(String,Integer)
Clauses
	anak("Jhon","James").
	anak("James","Peter").
	anak("Sue","Ann").
	istri("Mary","Peter").
	istri("Ann","James").
	pria("Jhon").
	pria("James").
	pria("Peter").
	wanita("Mary").
	wanita("Sue").
	wanita("Ann").
	usia("Jhon",10).
	usia("Sue",13).
	
	ayah(A,B):-anak(B,A).
	kakek(A,B):-ayah(A,C),ayah(C,B).
	ibu(A,B):-istri(B,C),anak(A,C).
	cucu(A,B):-anak(A,C),anak(C,B).
	cucu(A,B):-anak(A,C),istri(C,D),anak(D,B).
	adik(A,B):-usia(A,C),usia(B,D),C<D.
	
Goal
	cucu(X,Y);
	ibu(X,Y);
	adik(X,Y);
	kakek(X,Y).	