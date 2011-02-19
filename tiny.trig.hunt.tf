;; /loaded tiny.trig.hunt.tf
;; syöttä (imperative "feed")
;; (2, 4, 3) action triggers

/def -E'solo' -p0 -mglob -t'The combat is over.' endcombat = \
  /if (fastrc !/ '{Butterfly|Bumblebee|Dwarf}') \
    get all %; \
  /endif %; \
  alignment %; \
  kt

/def -E'solo' -p0 -mglob -t'* dies in fits of twitching agony.' targetdead = \
  bc %; \
  /set fastrc=$[{L7}] %; \
  /if (fastrc =/ '{Butterfly|Bumblebee|Dwarf|Jack-O-Lantern}') \
    get all %; \
  /endif %; \
  xp

/def -p0 -mglob -t'Your current experience points: *' calcxp = \
  /set xpdiff=$[{L1}-{oldxp}] %; \
  /echo -a -p @{BCyellow}%{xpdiff}@{x} %; \
  /set oldxp=$[{L1}]

/def -p0 -mglob -t'You see no such thing to kill here.' notarget = \
  /set anytarget=0 %; \
  /if (t =/ 'rat') \
;    shunt %; \
  /endif

;/def -E'solo' -p0 -mregexp -t'(\bt(hree|wo)\b)?black rat(s)?$' = \
;/def -E'solo' -p0 -mregexp -t'^ three moaning skeletons$' = \
;  tog %; \
;  /repeat -5 1 kt %; \
;  /repeat -5 1 tog

/def -p0 -mglob -t'* you with {his|her|its|a|the} *' settarget = \
    /set oldt=$[t]%; \
    /setdecapitalise %1%; \
    /if (t =/ "zombie") \
        /set t=$[oldt]%; \
; do nothing
    /elseif (t =/ "bog") \
; set to another variable
        /set t=turtle %; \
    /endif%; \
    /unset oldt


/def -p0 -mregexp -t'^Laurealasse fl(ap|utter)s' = \
    /echo -a -p @{BCblack}--> Hit landed! <--@{x}%; \

;/def -p0 -mglob -t'OW! You notice a leech has been milking one of your veins!' = lb

; the following trigger goes better under "idle" than solo.
; but I'll leave it there for brevity.
/def -E'solo' -p0 -mglob \
-t'A Baby Jack-O-Lantern appears behind you and *' babykill = \
    /set t=baby%; \
    ck %; \
;    kt

/def -p0 -mglob -t'A daelid crawls into *' dropd = gd %; drop daelid
/def -p0 -mregexp -t'^Cobalt enters.$' zap = kazap cobalt

;////////////////////////
;// Intrinsic re-trigs //
;////////////////////////

/def -p0 -mglob -t'Your mind clouds and you lose focus on *' reforesee = /repeat -61 1 ft

/def -p0 -mregexp -t'^You close your eyes and (clench your fist around the stone|draw energy from your surroundings).$' reharden = /repeat -0:2:0 1 /echo -a -p @{BCblack}Harden is ready!@{x}

/def -p0 -mglob -t'You focus your internal heat for a last brief moment *' reinhale = /repeat -120 1 bi %; /echo -a -p @{BCyellow}Breath exhale!@{x}

/def -p0 -mglob -t'You unleash a humming blast of moonlight *' remb = \
    /set no_moonbathe=1%; \
    /repeat -151 1 /echo -a -p @{BCcyan} You can moonbathe again.@{x}%; \
    /repeat -151 1 /unset no_moonbathe %; \


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

; gags on empty lines
/def -p0 -ag -mregexp -t'^[\ \t]*$'

; services for
; other people

/def -p0 -mglob -t'Araska is attempting to locate your astral signature.' arastral = /repeat -1 1 allow araska
