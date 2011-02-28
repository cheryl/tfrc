; loaded regardless of idle/active, solo/party or playerfriendly/defensive

/def -p0 -mglob -t'Araska is attempting to locate your astral signature.' arastral = /repeat -1 1 allow araska

/def -p0 -mglob -t'Daelid enters.' killd = \
    /set t=daelid%; \
    kill daelid

/def -p0 -mglob -t'You notice a daelid crawling into your inventory' dropd = \
    get daelid from boh %; \
    drop daelid%; \
    /set t=daelid%;\
    kill daelid

