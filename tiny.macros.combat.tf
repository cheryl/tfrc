; /loaded tiny.macros.combat.tf
;
;
; major combat commands
;
/def -p0 -mglob -h'SEND {1l}' = lance %{t}
/def -p0 -mglob -h'SEND {1m}' = magnify %{t}
/def -p0 -mglob -h'SEND {hrd}' = harden %; /repeat -0:2:2 1 hrd
/def -p0 -mglob -h'SEND {ft}' = fs %{t}
/def -p0 -mglob -h'SEND {bt}' = be %{t}
/def -p0 -mglob -h'SEND {blt}' = blast %{elementvar} at %{t}
/def -p0 -mglob -h'SEND {mt}' = magnify %{t}
/def -p0 -mglob -h'SEND {ct}' = whisper h interrupt %{t}
/def -p0 -mglob -h'SEND {kt}' = /set anytarget=1 %; \
  /repeat -3 1 kill %{t} %; \
  /repeat -5 1 ktm
/def -p0 -mglob -h'SEND {ktm}' = \
  /if (anytarget !~ "0") \
; if foe negligible: next three lines allow companion control
;    cd %; \
;    /repeat -7 1 cc %; \
;    /repeat -10 1 c north %; \
    /if (spnow >= (spfull * 0.6)) \
; if just loaded: next line cancels 0/0 trigger
        /if (spnow !~ "0") \
; if hunting rats: next line restricts the following to rats
      /if (t =/ 'rat') \
; if excess SP: next line  pre-uses blast
            /if (spnow >= (spfull * 0.9)) \
                /repeat -4 1 blast %{elementvar} at %{t} %; \
; if excess SP: next line pre-uses magnify
            /elseif (spnow >= (spfull * 0.8)) \
                /repeat -4 1 1m %; \
            /elseif (spnow >= (spfull * 0.7)) \
                /repeat -4 1 lance %; \
            /endif %; \
; if feigi: next line incorporates foresee 
;        ft %; \
; if hunting rats: next line restricts the previous to rats
      /endif %; \
        /endif %; \
    /endif %; \
  /endif
/def -p0 -mglob -h'SEND {evl}' = /set elementvar=lightning
/def -p0 -mglob -h'SEND {evi}' = /set elementvar=ice
/def -p0 -mglob -h'SEND {evf}' = /set elementvar=fire
/def -p0 -mglob -h'SEND {evn}' = /set elementvar=


/def -p0 -mglob -h'SEND {weps}' = /set wep=staff
/def -p0 -mglob -h'SEND {wepw}' = /set wep=wand
/def -p0 -mglob -h'SEND {wepb}' = /set wep=baton
/def -p0 -mglob -h'SEND {ever}' = retrieve %{wep}
/def -p0 -mglob -h'SEND {eve}' = empower %{wep} with %{elementvar}
/def -p0 -mglob -h'SEND {eves}' = eve %; store %{wep}

;
; travelling bots. disable by removing "shunt" in tiny.trig.hunt.tf under macro "notarget"
;
/def -p0 -mglob -h'SEND {shunt}' = \
  /if (anytarget =~ 0) %; \
    %{dirvar}%; \
    /repeat -3 1 shunt %; \
    /set _shunt_pid=%?%;\
    /echo -a -p @{Ccyan}shuntr@{n} stops shunt when not in combat %; \
    /set shuntsteps=$[shuntsteps + 1]%; \
  /endif %; \
  /set dirvar%; \
  /set oldshunt%; \
  /set shuntsteps%; \
; bogs: 14.
; vest: 19.
  /if (shuntsteps >= 19)%; \
    /if (oldshunt < 19)%; \
      troff%; \
      dvr%; \
      /repeat -1 4 south %; \
      /repeat -6 1 tron%; \
    /else%; \
      shuntr%; \
      ks%; \
      gl%; \
    /endif%; \
  /endif

/def -p0 -mglob -h'SEND {shuntr}' = \
    /kill _shunt_pid%; \
    /set anytarget=1%; \
    /set shuntsteps

/def -p0 -mglob -h'SEND {dvr}' = \
        /if (dirvar =/ '{east|e}') \
                /set dirvar=go west %; \
        /elseif (dirvar =/ '{west|e}') \
                /set dirvar=go east %; \
        /endif %; \
        /set oldshunt=$[shuntsteps]%; \
        /set shuntsteps=0%; \
        dv

/def -p0 -mglob -h'SEND {dv}' = \
        /set dirvar%; \
        /set oldshunt%; \
        /set shuntsteps


; Apparently random combinations of attacks
;
/def -p0 -mglob -h'SEND {2l}' = 1l %; /repeat -5 1 1l
/def -p0 -mglob -h'SEND {3l}' = 1l %; /repeat -5 2 1l
/def -p0 -mglob -h'SEND {4l}' = 1l %; /repeat -6 3 1l
/def -p0 -mglob -h'SEND {3l20}' = 1l %; /repeat -20 2 1l
/def -p0 -mglob -h'SEND {4l20}' = 1l %; /repeat -20 3 1l
/def -p0 -mglob -h'SEND {5l20}' = 1l %; /repeat -20 4 1l
/def -p0 -mglob -h'SEND {2m30}' = 1m %; /repeat -30 1 1m
/def -p0 -mglob -h'SEND {3m30}' = 1m %; /repeat -30 2 1m

;
; and Rej's
;
/def -p0 -mglob -h'SEND {1r70}' = /repeat -70 1 rej
/def -p0 -mglob -h'SEND {2r70}' = rej %; /repeat -70 1 rej


; specific mob macros
;
;
/def -p0 -mglob -h'SEND {elk}' = /set t elk%; kt
/def -p0 -mglob -h'SEND {ram}' = /set t ram%; kt
/def -p0 -mglob -h'SEND {tree}' = /set t tree%; kt
/def -p0 -mglob -h'SEND {moose}' = /set t moose%; kt
/def -p0 -mglob -h'SEND {deer}' = /set t deer%; kt
/def -p0 -mglob -h'SEND {caribou}' = /set t caribou%; kt
/def -p0 -mglob -h'SEND {mole}' = /set t mole%; kt
/def -p0 -mglob -h'SEND {chipmunk}' = /set t chipmunk%; kt
/def -p0 -mglob -h'SEND {dryad}' = /set t dryad%; kt
/def -p0 -mglob -h'SEND {bramble}' = /set t bramble%; kt
/def -p0 -mglob -h'SEND {squirrel}' = /set t squirrel%; kt
/def -p0 -mglob -h'SEND {gopher}' = /set t gopher%; kt
/def -p0 -mglob -h'SEND {woodchuck}' = /set t woodchuck%; kt
/def -p0 -mglob -h'SEND {fairy}' = /set t fairy%; kt
/def -p0 -mglob -h'SEND {wolf}' = /set t wolf%; kt
/def -p0 -mglob -h'SEND {bear}' = /set t bear%; kt
/def -p0 -mglob -h'SEND {cat}' = /set t cat%; kt
/def -p0 -mglob -h'SEND {kobold}' = /set t kobold%; kt



;
; hirilonde macros
;
; states (assume not aggro)
/def -p0 -mglob -h'SEND {hsbegin}' = pc%; cto %; csu %; c follow
/def -p0 -mglob -h'SEND {hsaggro}' = c follow%; c wimpy 100 %; c wimpydir east
/def -p0 -mglob -h'SEND {hsbrief}' = c follow %; c wimpy 70 %; c wimpydir east %; c defend %; /repeat -20 1 c cease
/def -p0 -mglob -h'SEND {hsnorm}' = c follow %; c wimpy 30 %; c wimpydir east %; ck
/def -p0 -mglob -h'SEND {hsoops2}' = hxbusy%; csu%; c wimpy 0%; soothe
;
; normal combat (hsnorm)
/def -p0 -mglob -h'SEND {ck}' = c kill %{t}
/def -p0 -mglob -h'SEND {hc}' = x %; /repeat -0:0:30 1 hc
;
; (invisible stacks - for aggro)
/def -p0 -mglob -h'SEND {hxthrow}' = c throw powder %; /repeat -2 1 c east
/def -p0 -mglob -h'SEND {hxbusy}' = uw %; \
    drop torch%; \
    /repeat -1 1 get torch%; \
    /repeat -2 1 drop torch%; \
    /repeat -3 1 get torch%; \
    /repeat -4 1 drop torch%; \
    /repeat -5 1 get torch%; \
    /repeat -5 1 ready
;
; aggro combat (hsaggro)
/def -p0 -mglob -h'SEND {agatk}' = hxbusy%; hxthrow
/def -p0 -mglob -h'SEND {agii}' = hxbusy%; cii %; c east
/def -p0 -mglob -h'SEND {aggive}' = hxbusy%; give pouch to h %; c east
/def -p0 -mglob -h'SEND {agxh}' = hxbusy%; xh %; c east
;
;
