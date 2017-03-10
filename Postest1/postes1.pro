predicates 
  nondeterm berwarna(symbol,symbol)
  %- nondeterm (i,o)
  
clauses
   berwarna(mobil,hitam).
   berwarna(motor,hijau).
   berwarna(motor,hitam).
   berwarna(angkot,kuning).
   berwarna(Kendaraan,biru):-
      berwarna(Kendaraan,hitam).
   
goal
   berwarna(Kendaraan,biru).