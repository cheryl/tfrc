;/loaded tiny.trig.gags
;
;


;
; gagging
;

;
; gag 1: beings
;
;/def -p0 -ag -mglob -t'A sly fox, *'
/def -p0 -ag -mglob -t'kobold \(*'
/def -p0 -ag -mglob -t'a swarm of fireflies *'
;
; gag 2: My/H's attacks
;
;/def -E'solo' -p0 -ag -mglob -t'Hirilonde {scrapes|slashes|swipes} *'
;/def -E'solo' -p0 -ag -mglob -t'You {attack|pummel|trounce|wallop|clobber|dive|fly|whirl|flap} *'
;/def -E'solo' -p0 -ag -mglob -t'You are too busy to make an attack*'
/def -E'solo' -p0 -ag -mglob -t'* jumps between you and *'
;
; gag 3: null responses
;
/def -p0 -ag -mglob -t'Whose movements do you wish to foresee?'
/def -p0 -ag -mglob -t'Sparks from the explosion rebrand the *'
/def -p0 -ag -mglob -t'There is nothing here for you to get.'
/def -p0 -ag -mglob -t'That is either not here, or not interesting.'
;
; gag 4: opponents' attacks
;
;/def -E'solo' -p0 -ag -mglob -t'* you with *'
;/def -E'solo' -p0 -ag -mglob -t'*s*Hirilonde and *'
;
; gag 5: just spam
;
/def -p0 -ag -mglob -t'Your swarm of fireflies rushes out before you.'
;/def -p0 -ag -mglob -t'Your fox companion sneaks in after you.'

