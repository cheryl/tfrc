;/loaded tiny.trig.hiribot.tf
;
; for when hiri is hunting alone
;
;
;
;

/load tiny.trig.solohunt.hiri.tf

/def -p0 -mglob -t'* dies in fits of twitching agony.' hiriburytrig = \
  ck %; \
  bury corpse %; \
  /repeat -2 1 get all %; \
  /repeat -2 1 x

; redefine hirileavetrig to include ck and repeated x's

/def -p0 -mglob -t'Hirilonde leaves *' hirileavetrig = \
  /repeat -5 1 x %; \
  /repeat -5 1 ck %; \
  /repeat -10 1 x %; \
  /repeat -15 1 x
