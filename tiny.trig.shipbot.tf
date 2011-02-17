;; /loaded tiny.trig.shipbot.tf
;; calling macro should include rest %; /load 
;
/def -p0 -mglob -t'The Althrior windjammer arrives.' althshiptrig = \
  ship%; rest %; \
  /undef althshiptrig
/def -p0 -mglob -t'The Althrior windjammer arrives at *' althdocktrig = \
  dock %; rest%; \
  hunt %; \
  troff

/def -p0 -mglob -t'The Jewel of the East arrives.' sakshiptrig = \
  ship%; rest %; \
  /undef sakshiptrig
/def -p0 -mglob -t'The Jewel of the East arrives at *' sakdocktrig = \
  dock %; rest%; \
  hunt %; \
  troff

/def -p0 -mglob -t'The Sunwind arrives.' sunshiptrig = \
  ship%; rest %; \
  /undef sunshiptrig
/def -p0 -mglob -t'The Sunwind arrives at Sakai North.' sundocktrig = \
  dock %; rest%; \
  hunt %; \
  troff

/def -p0 -mglob -t'The Sunwind arrives at Altheon South.' sundocktrig2 = \
  dock %; rest%; \
  hunt %; \
  troff
; Sakai North, Altheon South

/def -p0 -mglob -t'The Starfall cutter arrives.' starshiptrig = \
  ship%; rest%; \
  /undef starshiptrig

/def -p0 -mglob -t'The Starfall cutter arrives at Starfall.' stardocktrig = \
  dock%; n%; n%; w%; w%; n%; e%; e%; n%; n%; n%; lift%; rest%; \
  /undef stardocktrig
/def -p0 -mglob -t'The lift arrives.' starlifttrig = \
  lift%; rest%; \
  /undef starlifttrig
/def -p0 -mglob -t'The Starfall Lift arrives at the top of the lift shaft.' starcitytrig = \
  city%; rest%; \
  hunt %; \
  troff

/def -p0 -mglob -t'The Starfall Lift arrives at the bottom of the lift shaft.' startunneltrig = \
  tunnel%; s%; s%; w%; w%; s%; e%; e%; s%; s%; ship%; rest%; \
  /undef startunneltrig
/def -p0 -mglob -t'The Starfall cutter arrives at Astaria.' stardocktrig2 = \
  dock%; rest%; \
  hunt %; \
  troff

