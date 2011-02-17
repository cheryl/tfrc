;/loaded tiny.set.retrig
;
; This file contains hooks, triggers and variables 
; that concern active maintainence other than those
; attached to the hpbot, ie:
; 1. maintaining foresee
; 2. maintaining empower
; 3. maintaining barkskin
; 4. hunting groups of rats
;

;--------------------HOOKS--------------------;

/def -p0 -mglob -h'SEND {retrig}' = \
	/echo -a -p @{B}commands in tiny.set.retrig.tf %; \
	/echo -a -p @{Ccyan}reempower@{n} (if needempower 1, then %emvar, needempower=0) %; \
	/echo -a -p @{Ccyan}rebk@{n} (if needbk 1, bk off, bk, needbk=0) %; \
	/echo -a -p @{Ccyan}reforesee@{n} (-61 1 fsee) %; \
	/echo -a -p @{Ccyan}reempowertrig@{n} (nt, needempower=1, -5 reempower, nt=1) %; \
	/echo -a -p @{Ccyan}barkstatus@{n} (catch bst data, if bstatus<9, then needbk=1) %; \
	/echo -a -p @{Ccyan}bkdamage@{n} (catch bark damage, occasional bst)  %; \
	/echo -a -p @{Ccyan}blackrats@{n} (if "* black rats", then kt)


/def -p0 -mglob -h'SEND {reempower}' = \
;  /if (needempower =/ 1) \
    empower staff with %{elementvar} %; \
    /set needempower=0 %; \
;  /endif

/def -p0 -mglob -h'SEND {rebk}' = \
  /if (needbk =/ 1) \
;    bk off %; \
;    bk %; \
;    /set needbk=0 %; \
  /endif

;--------------------TRIGGERS--------------------;


;/def -p0 -mglob -t"*'s power fades back to the ambient." reempowertrig = \
;  /set nt%; \
;  /set needempower=1 %; \
;  /repeat -5 1 reempower%; \
;  /set nt=1

/def -p0 -mglob -t'Tough bark covers * of your skin.' barkstatus = \
  /set bstatus=$[strcat(substr({L4}, 0, (strlen({L4})-1)))] %; \
  /if (bstatus <= 8) \
    /set needbk=1 %; \
  /endif

/def -p0 -mglob -c60 -t'Your toughened barkskin absorbs some damage.' bkdamage = bst


;"Inch-long thorns cover xx% of your skin"
;"Tough bark covers xx% of your skin"

