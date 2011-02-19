; /loaded tiny.macros.reloading.tf
;
; setdecap for token triggers
/def -p0 -mglob setdecapitalise = /set t=$[strcat(tolower(substr({*}, 0, 1)), tolower(substr({*}, 1)))]
;
;
;default: HUNT state, triggers off
;onship: remove all, load SHIP.tf, triggers on
;offship: remove all, load HUNT, triggers off
;huntsolo: HUNT state
;friendshunt: HUNT state but disable a category of SOLO triggers.
;States:
;HUNT
;TRON/TROFF (borg 1/0) (disable triggers)
;SHIP category (and disable all other triggers)
;SOLO subcategory (to disable for friends hunting)


/def -p0 -mglob -h'SEND {hunt}' = \
    /set solo=1 %; \
    /set borg=on%; \
    /set nothunting=0%; \
    /set playerfriendly=0%; \
    reload
/def -p0 -mglob -h'SEND {friends}' = \
    /unset solo %; \
    /set borg=on%; \
    /set nothunting=0%; \
    /set playerfriendly=1%; \
    reload
/def -p0 -mglob -h'SEND {idle}' = \
; whether solo or not doesn't matter
    /set borg=on%; \
    /set nothunting=1%; \
    /set playerfriendly=1%; \
    reload
/def -p0 -mglob -h'SEND {tron}' = /set borg=on %; /set borg
/def -p0 -mglob -h'SEND {troff}' = /set borg=off %; /set borg
/def -p0 -mglob -h'SEND {tog}' = \
  /if (borg =/ 'off') \
    tron %; \
  /elseif (borg =/ 'on') \
    troff %; \
  /endif

/def -p0 -mglob -h'SEND {ships}' = ship%; rest%; tron %; /load tiny.trig.shipbot.tf %; cheavy %; xfal
/def -p0 -mglob -i -h'SEND {reload}' = /purge %; \
    /load tiny.bind.tf %; \
    /load tiny.macros.reloading.tf %; \
    /load tiny.macros.combat.tf %; \
    /load tiny.macros.organise.tf %; \
    /load tiny.macros.travelling.tf %; \
    /load tiny.macros.timers.tf %; \
    /if (borg =/ 'on') \
; hunting check
        /if (nothunting =/ 0) \
            /load tiny.trig.hunt.tf %; \
; if hunting, is owl check
            /if (owl =/ 1) \
                /load tiny.trig.owlhpbot.tf %; \
            /else \
                /load tiny.trig.hpbot.tf %; \
                /load tiny.set.retrig.tf %; \
            /endif %; \
        /else \
            /load tiny.trig.idle.tf %; \
        /endif %; \
; friendly check
        /if (playerfriendly =/ 0) \
            /load tiny.trig.idle.tf %; \
        /endif %; \
    /endif %; \
    /load tiny.trig.gags.tf %; \
    tron



; add-on triggers
;
/def -p0 -mglob -h'SEND {lootl}' = /load tiny.trig.lootbot.tf
/def -p0 -mglob -h'SEND {lootr}' = /undef loottrig

/def -p0 -mglob -h'SEND {chaml}' = /load tiny.trig.chambot.tf
/def -p0 -mglob -h'SEND {chamr}' = /undef chamtrig

/def -p0 -mglob -h'SEND {hpl}' = /load tiny.trig.hpbot.tf
/def -p0 -mglob -h'SEND {hpr}' = /undef hpbottrig

/def -p0 -mglob -h'SEND {hiril}' = /load tiny.trig.hiribot.tf
/def -p0 -mglob -h'SEND {hirir}' = /undef hirihptrig %; /undef hiriburytrig %; /undef hirileavetrig

/def -p0 -mglob -h'SEND {cdl}' = /load tiny.trig.hirisolobot.tf
/def -p0 -mglob -h'SEND {cdr}' = /undef hirihptrig %; /undef hirileavetrig

/def -p0 -mglob -h'SEND {rs}' = rest %; /load tiny.trig.restbot.tf
/def -p0 -mglob -h'SEND {rsr}' = /undef wearytrig

/def -p0 -mglob -h'SEND {owlc}' = \
  shapechange %; \
  /set owl=1 %; \
  hunt
/def -p0 -mglob -h'SEND {owlr}' = \
  shapechange revert %; \
  /unset owl %; \
  hunt %; \
  ready

  






;  /echo -a -p @{Cyellow}+--------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}|           I N D E X            |@{x}%; \
;  /echo -a -p @{Cyellow}+----------+---------+-----------+@{x}%; \
;  /echo -a -p @{Cyellow}|     index:  index  :.reloading |@{x}%; \
;  /echo -a -p @{Cyellow}| companion:   hs    :.paracombat|@{x}%; \
;  /echo -a -p @{Cyellow}|  triggers:  trigs  :.paracombat|@{x}%; \
;  /echo -a -p @{Cyellow}|  ryumount:   ryu   :.travelling|@{x}%; \
;  /echo -a -p @{Cyellow}|    reload:  idle * :.tfstat    |@{x}%; \
;  /echo -a -p @{Cyellow}|   hunting:  solo * :.tfstat    |@{x}%; \
;  /echo -a -p @{Cyellow}+--------------------------------+@{x}
;
