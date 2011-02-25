; /loaded tiny.trig.hpbot.tf
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

;
;
; tinyfugue 4 does not support variable substitution in flags
; /def -p2 -mglob -c100 -t
; cygwin:
; /def -p2 -mglob -c(hpc) -t
;
/def -p2 -mglob -c100 -t"HP: * SP: * EP: *" hpbottrig = \
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
  /if (hpfull !~ 0) \
;; #1: if HP is less than 40%, heal.
    /if (hpnow < (hpfull * 0.4)) \
;      rej %; \
        cd%; \
    /endif %; \
;;
;; #2: if SP is nearly full - options
;;
;; ORDER:
;; - most uncommon
;; - most expensive (but desirable)
;; - least economical
;;
;; because more economical skills will be used
;; when there is less SP.
;;
    xa %; \
;    xh %; \
    /if (spnow >= (spfull * 0.9)) \
      /if (needempower =/ 1) \
	reempower %; \
      /else %; \
;	bst %; \
	/if (needbk =/ 1) \
	  /if (autospell =/ 1) \
	    rebk %; \
	  /endif %; \
        /elseif (hpnow < (hpfull * 0.5)) \
;            rej %; \
            cd%; \
;        /elseif (autospell =/ 1) \
;            magnify%; \
;            troff %; \
	  /repeat -5 1 tron %; \
	/endif %; \
      /endif %; \
    /endif %; \
;; #3: if no barkskin and SP is decent (more than 60%)
    /if (needbk =/ 1) \
      /if (spnow >= (spfull * 0.61)) \
	/if (autospell =/ 1) \
	  /echo -a -p @{Cyellow}          no bark and sp > .6@{n} %; \
	  rebk %; \
	/endif %; \
      /endif %; \
    /endif %; \
;; #4: if no empower and SP is decent (more than 60%)
    /if (needempower =/ 1) \
      /if (spnow >= (spfull * 0.61)) \
	/if (autospell =/ 1) \
	  /echo -a -p @{Cred}          no empower and SP > .6@{n} %; \
	  reempower %; \
	/endif %; \
      /endif %; \
    /endif %; \
;; #5: if SP is less than 0%
    /if (spnow <= (spfull * 0.2)) \
      /echo -a -p @{Cblack}....................@{BCred}< 20%@{x} %; \
    /endif %; \
  /endif


;back to altheon ship:
;from ship to gate: n%;2w%;4s%;shdn
;from gate to gh: ghw
;from gh to shop: 5w%;s%;e%;sell all
;from shop to pvault: w
