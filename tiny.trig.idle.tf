
; ask me about trigger
/def -E'playerfriendly' -p0 -mregexp -t' asks you: Know anything about ' trigaskme = \
;/def -p0 -mregexp -t'^[a-zA-Z]* beeps you on the nose.$'  = \
    /set oldt=$[t]%; \
    /setdecapitalise %1%; \
    /set friend=$[t]%; \
    /set t=$[oldt]%; \
;    /set skill=%{PR};
; captures the entire request
    /set initialrequest=$[{PR}]%; \
; counts number of chars
    /set lengthofcommand=$[strlen({initialrequest})-1]%; \
; removes ? from initialrequest
    /set skill=$[strcat(substr({initialrequest}, 0, lengthofcommand))]%; \
; captures the last word on the line and removes the ? and decapitalises it.
;    /set skill=$[strcat(tolower(substr({7}, 0, 1)), tolower(substr({7}, 1, (strlen({7})-2))))] %; \
    /if (no_moonbathe =/ 1) \
        shake%; \
        whisper %{friend} timer's not up yet, friend.%; \
    /else \
;        /if (friend !/ '{araska|hirilonde|nisral|shandie|nimue|katelynn|cynan|calyril|krix}') \
        /if (skill =/ '{rej|rejuvenate|moonbathe|mb|spiritbind|rebirth|thump}') \
; next line is for triggers that contain the skill name
            %{skill} %{friend}%; \
;        /else \
;            shrug%; \
;        /endif%; \
        /endif%; \
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
    /setdecapitalise %1%; \
    /set subject=$[t]%; \
    /set t=$[oldt]%; \
    %; \
; event goes here
;    /if (no_moonbathe =/ 1) \
;        shake%; \
;        whisper %{friend} timer's not up yet, friend.%; \
;    /else \
;        mb %{subject}%; \
;    /endif %; \
;    /repeat -151 1 afk moonbathe
; spiritbind
;        spiritbind %{subject}
; give stones
    /if (subject =/ '{hirilonde|kristus}') \
        give sst to %{subject}%; \
    /elseif (subject =/ '{hirilonde|cobalt|shimmer}') \
        give swon to %{subject}%; \
    /endif
; end of beep trigger

/def -p0 -mglob -h'SEND {test}' = \
    c beep en%; \
    afk%; \


