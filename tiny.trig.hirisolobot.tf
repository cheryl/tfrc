;/loaded tiny.trig.hirisolobot.tf - activated with cd and deactivated with cc
;
; for when hiri is hunting alongside me
; overlaps tiny.trig.hiribot.tf

;
; 1. hirihp - rej for H if bruised or below
;

/def -p0 -mglob -t'A sly fox, Envinyatuvar\'s animal companion (*)' hirihptrig = \
  /set hphiri=$[strcat(tolower(substr({7}, 1, 1)), tolower(substr({7}, 2, (strlen({7})-2))))] %; \
  /if (hphiri =/ '{bruised|critically|almost}') \
    rej h %; \
  /elseif (hphiri =/ '{stunned\)|slightly|perfect}') \
    %; \
  /endif

;
; 2. hwimpy - 5 sec and 10 sec x when H leaves.
;

/def -p0 -mglob -t'Hirilonde leaves *' hirileavetrig = \
  /repeat -5 1 x %; \
  /repeat -10 1 x

