; /loaded tiny.trig.owlhpbot.tf
/set hpfull=0
/set spfull=0
/set hpnow=0
/set spnow=0
/set hplen=0
/set splen=0
;
;012345678
;[123/456]
;[12/456]
;[1/456]
;
;
;
/def -p0 -mglob -t'A sly fox, Envinyatuvar\'s animal companion (*)' hirihp = \
  /set hphiri=$[strcat(tolower(substr({7}, 1, 1)), tolower(substr({7}, 2, (strlen({7})-2))))] %; \
  /if (hphiri =/ '{bruised|critically|almost}') \
    /if (hpnow > (hpfull * 0.9)) \
      cc %; \
    /elseif (hpnow < (hpfull * 0.3)) \
      shapechange revert %; \
      ready %; \
      rej %; \
      rej h %; \
    /endif %; \
  /elseif (hphiri =/ '{stunned\)|slightly|perfect}') \
    %; \
  /endif

/def -p0 -mglob -t'Hirilonde leaves *' hirileavetrig = \
  /repeat -5 1 x %; \
  /repeat -10 1 x
;
/def -p2 -mglob -c100 -t"HP: * SP: * EP: *" owlhpbottrig = \
  /set hplen=$[strlen({2})] %; \
  /set splen=$[strlen({4})] %; \
;; 3-figure, 2-figure, or 1-figure current HP
  /if (hplen =/ 10) \
    /set hpfull=$[substr({2}, 5, 3)] %; \
    /set hpnow=$[substr({2}, 1, 3)]%; \
  /elseif (hplen =/ 9) \
    /set hpfull=$[substr({2}, 4, 3)] %; \
    /set hpnow=$[substr({2}, 1, 2)]%; \
  /elseif (hplen =/ 8) \
    /set hpfull=$[substr({2}, 3, 3)] %; \
    /set hpnow=$[substr({2}, 1, 1)]%; \
  /endif %; \
;; 3-figure, 2-figure, or 1-figure current SP
  /if (splen =/ 10) \
    /set spfull=$[substr({4}, 5, 3)] %; \
    /set spnow=$[substr({4}, 1, 3)]%; \
  /elseif (splen =/ 9) \
    /set spfull=$[substr({4}, 4, 3)] %; \
    /set spnow=$[substr({4}, 1, 2)]%; \
  /elseif (splen =/ 8) \
    /set spfull=$[substr({4}, 3, 3)] %; \
    /set spnow=$[substr({4}, 1, 1)]%; \
  /endif %; \
;; ignore freshly reloaded HP
  /if (hpfull !~ 0) \
;; #1: if HP is less than 50%, cd. - not coded due to spam.
    xa %; \
    /if (spnow >= (spfull * 0.9)) \
      /echo -a -p magnify | lc | bf/bl/bi [target] %; \
    /endif %; \
;; #5: if SP is less than 50%
    /if (spnow <= (spfull * 0.20)) \
      /echo -a -p @{Cblack}....................@{BCred}< 20%@{x} %; \
    /endif %; \
  /endif
