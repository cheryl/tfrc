;; /loaded tiny.trig.hunt.tf
;; syöttä (imperative "feed")
;; (2, 4, 3) action triggers

/def -E'solo' -p0 -mglob -t'The combat is over.' endcombat = \
;  /if (fastrc !/ '{Butterfly|Bumblebee|Dwarf|Jack-O-Lantern}') \
; if companion has already buried, fails harmlessly
; occurs second
;    bc%; \
;    get all %; \
;  /endif %; \
  alignment %; \
  kt

/def -E'solo' -p0 -mglob -t'* dies in fits of twitching agony.' targetdead = \
  /set fastrc=$[{L7}] %; \
  /if (fastrc =/ '{Butterfly|Bumblebee|Jack-O-Lantern}') \
; this branch only activates for those types
    bc %; \
    get all %; \
  /else \
; this branch fails harmlessly if don't have a companion
; occurs first
;    cfin%; \
    bc %; \
    get all %; \
  /endif %; \
  xp

/def -p0 -mglob -t'Your current experience points: *' calcxp = \
  /set xpdiff=$[{L1}-{oldxp}] %; \
  /echo -a -p @{BCyellow}%{xpdiff}@{x} %; \
  /set oldxp=$[{L1}]

;/def -p0 -mglob -t'You see no such thing to kill here.' notarget = \
;  /set anytarget=0 %; \
;  /if (t =/ '{rat|skeleton}') \
;    /if (solo =/ 1) \
;        shunt %; \
;    /endif%; \
;  /endif

/def -p0 -mglob -t'* you with {his|her|its|a|the} *' settarget = \
    /set oldt=$[t]%; \
    /setdecapitalise %1%; \
    /if (t =/ "zombie") \
        /set t=$[oldt]%; \
; do nothing
    /elseif (t =/ "bog") \
        /set t=turtle %; \
    /elseif (t =/ "carrion") \
        /set t=crawler %; \
    /elseif (t =/ "{old|worker|harvester}") \
        /set t=peasant %; \
    /elseif (t =/ "{sting|moray}") \
        /set t=fish %; \
    /endif%; \
    /unset oldt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;  CHARACTER-SPECIFIC TRIGGERS  ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

/def -p0 -mregexp -t'^Laurealasse fl(ap|utter)s' = \
    /echo -a -p @{BCblack}--> Hit landed! <--@{x}%; \

;/def -p0 -mglob -t'You focus your internal heat for a last brief moment *' reinhale = /repeat -120 1 bi %; /echo -a -p @{BCyellow}Breath exhale!@{x}

;/def -E'playerfriendly' -p0 -mregexp -t'^Cobalt enters.$' zap = kazap cobalt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                          ;;
;;  AREA-SPECIFIC TRIGGERS  ;;
;;                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;/def -p0 -mglob -t'OW! You notice a leech has been milking one of your veins!' = lb

; borging auto-attock for baby jack-o-lanterns
;/def -E'solo' -p0 -mglob \
;-t'A Baby Jack-O-Lantern appears behind you and *' babykill = \
;    /set t=baby%; \
;    ck %; \
;    kt

; borging auto-attack for rats
;/def -E'solo' -p0 -mregexp -t'(\bt(hree|wo)\b)?black rat(s)?$' = \
;/def -E'solo' -p0 -mregexp -t'^ t(hree|wo) moaning skeletons$' = \
;/def -E'solo' -p0 -mregexp -t' moaning skeleton' = \
;  /kill %{_shunt_pid}%; \
;  tog %; \
;  kt %; \
;  /repeat -2 1 tog

; finishing borg for rats
;/def -E'solo' -p0 -mglob -t'15 of 15 rats have now been killed.' = \
;    tog%; \
;    rest%; \
;    /repeat -5 1 friends%; \
;    finish

;/def -E'solo' -p0 -mglob -t'You search about the muck and garbage and are disgusted as a rat pops out!' = \
;    /set t rat%; \
;    ln %{t}%;\
;    k %{t}

;////////////////////////
;// Intrinsic re-trigs //
;////////////////////////

/def -p0 -mglob -t'Your mind clouds and you lose focus on *' reforesee = /repeat -61 1 ft

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    ;;
;;  Only if hunting geared (not owl)  ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


/def -E'notowl' -p0 -mglob -t'You unleash a humming blast of moonlight *' remb = \
    /set no_moonbathe=1%; \
    /repeat -151 1 /echo -a -p @{BCcyan} You can moonbathe again.@{x}%; \
    /repeat -151 1 /unset no_moonbathe %; \

;
/def -E'notowl' -p0 -mregexp -t'^You close your eyes and (clench your fist around the stone|draw energy from your surroundings).$' reharden = /repeat -0:2:0 1 /echo -a -p @{BCblack}Harden is ready!@{x}

/def -E'notowl' -p0 -mglob -t"*'s power fades back to the ambient." reempowertrig = \
  /set wep=$[strcat(substr({L7}, 0, (strlen({L7})-3)))] %; \
;  /set nt%; \
;  /set needempower=1 %; \
    /repeat -5 1 reempower%; \
;  /set nt=1

/def -E'notowl' -p0 -mglob -t'Tough bark covers * of your skin.' barkstatus = \
  /set bstatus=$[strcat(substr({L4}, 0, (strlen({L4})-1)))] %; \
  /if (bstatus <= 8) \
    /set needbk=1 %; \
  /endif

/def -E'notowl' -p0 -mglob -c60 -t'Your toughened barkskin absorbs some damage.' bkdamage = bst


;"Inch-long thorns cover xx% of your skin"
;"Tough bark covers xx% of your skin"

