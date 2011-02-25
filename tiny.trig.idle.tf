
; ask me about trigger
/def -E'playerfriendly' -p0 -mglob -t'* asks you: Know anything about *' trigaskme = \
;/def -p0 -mregexp -t'^[a-zA-Z]* beeps you on the nose.$'  = \
    /set oldt=$[t]%; \
    /setdecapitalise %1%; \
    /set friend=$[t]%; \
    /set t=$[oldt]%; \
    /set skill=$[strcat(tolower(substr({L1}, 0, 1)), tolower(substr({L1}, 1, (strlen({L1})-2))))] %; \
    /if (no_moonbathe =/ 1) \
        shake%; \
        whisper %{friend} timer's not up yet, friend.%; \
    /else \
;        /if (friend =/ '{araska|hirilonde|nisral|shandie|nimue|katelynn|cynan|calyril|krix}') \
            /if (owl =/ 1) \
                owlr%; \
            /endif %; \
; next line is for triggers that contain the skill name
            %{skill} %{friend}%; \
; next line is for triggers that don't
;            mb %{friend}%; \
;        /else \
;            shrug%; \
;        /endif%; \
    /endif %; \
    /unset oldt %; \
    /unset friend %; \
; end of ask me about trigger

; clan trigger
/def -E'playerfriendly' -p0 -mregexp -t'^-\*\[Harmony]\*- [A-Za-z]* [A-Za-z]*: clanlink$' trigclan = \
    /set oldt=$[t]%; \
    /setdecapitalise %3%; \
    /set clannie=$[t]%; \
    /set t=$[oldt]%; \
; replace next line with 'clanlink unavailable' message
;    /if (no_moonbathe =/ 1) \
;        y %{clannie}: timer's not up yet%; \
;    /else \
        clanlink %{clannie}%; \
;    /endif %; \
    /unset oldt %; \
    /unset clannie %; \
; end of clan trigger

; beep trigger
/def -p0 -mregexp -t'^[a-zA-Z]* beeps you on the nose.$' trigbeep = \
    /set oldt=$[t]%; \
    /setdecapitalise %3%; \
    /set target=$[t]%; \
    /set t=$[oldt]%; \
; end of beep trigger

