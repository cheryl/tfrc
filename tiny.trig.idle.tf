
; ask me about trigger
/def -E'playerfriendly' -p0 -mregexp -t' asks you: Know anything about ' trigaskme = \
;/def -p0 -mregexp -t'^[a-zA-Z]* beeps you on the nose.$'  = \
    /set raw_name=$[{1}]%; \
    /set modified_name_length=$[strlen({raw_name})-1]%; \
    /set friend=$[strcat(tolower(substr({raw_name}, 0, 1)), tolower(substr({raw_name}, 1, modified_name_length)))]%;\
    /unset raw_name%; \
    /unset modified_name_length%; \
; captures the entire request
; counts number of chars
; removes ? from initialrequest
    /set raw_request=$[{PR}]%; \
    /set modified_request_length=$[strlen({raw_lequest})-1]%; \
    /set skill=$[strcat(substr({raw_request}, 0, modified_request_length))]%; \
; captures the last word on the line and removes the ? and decapitalises it.
    /unset raw_request%; \
    /unset modified_request_length%; \
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
    /unset skill%; \
    /unset oldt %; \
    /unset friend %; \
; end of ask me about trigger

; clan trigger
/def -E'playerfriendly' -p0 -mregexp -t'^-\*\[Harmony]\*- [A-Za-z]* [A-Za-z]*: (clanlink|hsp|cl)$' trigclan = \
    /set skill=%L1%;\
;    /set oldt=$[t]%; \
;    /setdecapitalise %3%; \
;    /set clannie=$[t]%; \
;    /set t=$[oldt]%; \
    /set raw_name=$[{L2}]%; \
; counts number of chars
    /set modified_name_length=$[strlen({raw_name})-2]%; \
    /set clannie=$[strcat(tolower(substr({raw_name}, 0, 1)), tolower(substr({raw_name}, 1, modified_name_length)))]%;\
    /unset raw_name %; \
    /unset modified_name_length %; \
    /if (skill =/ 'hsp') \
        hsp %{clannie} 300 %; \
    /else \
        clanlink %{clannie}%; \
    /endif %; \
    /unset skill%; \
    /unset clannie %; \
; end of clan trigger

; beep trigger
/def -p0 -mregexp -t'^[a-zA-Z]* beeps you on the nose.$' trigbeep = \
    /set raw_name=$[{1}]%; \
    /set modified_name_length=$[strlen({raw_name})-1]%; \
    /set subject=$[strcat(tolower(substr({raw_name}, 0, 1)), tolower(substr({raw_name}, 1, modified_name_length)))]%;\
    /unset raw_name%; \
    /unset modified_name_length%; \
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
    /endif%;\
    /if (subject =/ '{hirilonde|cobalt|shimmer}') \
        give all swon to %{subject}%; \
    /endif
; end of beep trigger

/def -p0 -mglob -h'SEND {test}' = \
    c beep en%; \
    afk%; \


