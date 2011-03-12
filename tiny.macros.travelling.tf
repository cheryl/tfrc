; /loaded tiny.macros.travelling.tf
;
; How to use EP

; ### 2 ### Travelling stacks ###
/def -p0 -mglob -h'SEND {enc}' = unlock north gate with keyring%;open north gate%;n%;close gate%;lock gate with keyring
/def -p0 -mglob -h'SEND {lvc}' = unlock gate with keyring%;open gate%;s%;close north gate%;lock north gate with keyring
/def -p0 -mglob -h'SEND {ggh}' = n%;nw%;n%;n%;w%;w%;w%;w
/def -p0 -mglob -h'SEND {bbh}' = e%;e%;e%;e%;s%;s%;se%;s
/def -p0 -mglob -h'SEND {viewguard}' = l guard 1%;l guard 2%; l guard 3%; l guard 4%; l guard 5
/def -p0 -mglob -h'SEND {viewmerc}' = l merc 1%;l merc 2%; l merc 3%; l merc 4%; l merc 5
/def -p0 -mglob -h'SEND {ghn}' = n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n%;n
/def -p0 -mglob -h'SEND {ghs}' = s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s%;s
/def -p0 -mglob -h'SEND {ghe}' = e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e%;e
/def -p0 -mglob -h'SEND {ghw}' = w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w%;w
/def -p0 -mglob -h'SEND {n10}' = n%;n%;n%;n%;n%;n%;n%;n%;n%;n
/def -p0 -mglob -h'SEND {s10}' = s%;s%;s%;s%;s%;s%;s%;s%;s%;s
/def -p0 -mglob -h'SEND {w10}' = w%;w%;w%;w%;w%;w%;w%;w%;w%;w
/def -p0 -mglob -h'SEND {e10}' = e%;e%;e%;e%;e%;e%;e%;e%;e%;e
/def -p0 -mglob -h'SEND {n5}' = n%;n%;n%;n%;n
/def -p0 -mglob -h'SEND {s5}' = s%;s%;s%;s%;s
/def -p0 -mglob -h'SEND {w5}' = w%;w%;w%;w%;w
/def -p0 -mglob -h'SEND {e5}' = e%;e%;e%;e%;e
/def -p0 -mglob -h'SEND {n3}' = n%;n%;n
/def -p0 -mglob -h'SEND {s3}' = s%;s%;s
/def -p0 -mglob -h'SEND {w3}' = w%;w%;w
/def -p0 -mglob -h'SEND {e3}' = e%;e%;e
/def -p0 -mglob -h'SEND {bup}' = u%;w
/def -p0 -mglob -h'SEND {bdn}' = e%;d
/def -p0 -mglob -h'SEND {sga}' = search%;get all
/def -p0 -mglob -h'SEND {p1}' = s%;s%;s%;sw%;e%;sga
/def -p0 -mglob -h'SEND {p2}' = w%;s%;se%;s%;s%;e%;sga
/def -p0 -mglob -h'SEND {p3}' = w%;n%;n%;nw%;n%;ne%;n%;n%;n%;rest%;hp
/def -p0 -mglob -h'SEND {p4}' = w%;w%;w%;w%;w%;s%;e%;sell all
/def -p0 -mglob -h'SEND {p5}' = w%;n%;e%;e%;e%;e%;n%;e%;bank
/def -p0 -mglob -h'SEND {lluis}' = s%;s%;u%;n%;n%;e%;e%;o%;e
/def -p0 -mglob -h'SEND {gluis}' = o%;w%;w%;w%;s%;s%;d%;n%;n

; specific travelling stacks
/def -p0 -mglob -h'SEND {shup}' = n%;n%;nw%;n%;n%;n%;ne%;n%;n
/def -p0 -mglob -h'SEND {shdn}' = s%;s%;sw%;s%;s%;s%;se%;s%;s

; rats: ship to bogs
/def -p0 -mglob -h'SEND {rsb}' = rsb1 %; /repeat -3 1 rsb2
/def -p0 -mglob -h'SEND {rsb1}' = s%;se%;e%;e%;e%;e%;e%;se%;se%;se%;se%;rest%; /echo rsb2
/def -p0 -mglob -h'SEND {rsb2}' = e%;e%;e%;e%;se%;s%;s%;s%;e%;e%;n%;n%;rest

; rats: bogs to ship
/def -p0 -mglob -h'SEND {rbs}' = rbs1 %; /repeat -3 1 rbs2
/def -p0 -mglob -h'SEND {rbs1}' = s%;s%;w%;w%;n%;n%;n%;nw%;w%;w%;w%;w%;rest%; /echo rbs2
/def -p0 -mglob -h'SEND {rbs2}' = nw%;nw%;nw%;nw%;w%;w%;w%;w%;w%;nw%;n%;rest

; rats: ship to james
/def -p0 -mglob -h'SEND {rsj}' = rsj1 %; /repeat -3 1 rsj2
/def -p0 -mglob -h'SEND {rsj1}' = ne%;ne%;n%;n%;n%;n%;nw%;nw%;nw%;rest%; /echo rsj2
/def -p0 -mglob -h'SEND {rsj2}' = n%;e%;e%;e%;e%;n%;n%;rest

; rats: james to ship
/def -p0 -mglob -h'SEND {rjs}' = rjs1 %; /repeat -3 1 rjs2
/def -p0 -mglob -h'SEND {rjs1}' = s%;s%;w%;w%;w%;w%;s%;rest%; /echo rjs2
/def -p0 -mglob -h'SEND {rjs2}' = se%;se%;se%;s%;s%;s%;s%;sw%;sw%;rest

; rats: bogs to james
/def -p0 -mglob -h'SEND {rbj}' = rbs1 %; /repeat -3 1 rbs2 %; /repeat -6 1 rsj1 %; /repeat -9 1 rsj2
/def -p0 -mglob -h'SEND {rjb}' = rjs1 %; /repeat -3 1 rjs2 %; /repeat -6 1 rsb1 %; /repeat -9 1 rsb2

; rats: james to nuin
/def -p0 -mglob -h'SEND {rjn1}' = s%;s%;w%;w%;w%;w%;n%;n%;nw%;ne%;ne%;rest%; /echo rjn2
/def -p0 -mglob -h'SEND {rjn2}' = n%;n%;n%;n%;n%;nw%;nw%;n%;n%;n
/def -p0 -mglob -h'SEND {rjn}' = rjn1 %; /repeat -3 1 rjn2

; rats: nuin to james
/def -p0 -mglob -h'SEND {rnj1}' = s%;s%;s%;se%;se%;s%;s%;s%;s%;s%;rest%; /echo rnj2
/def -p0 -mglob -h'SEND {rnj2}' = sw%;sw%;se%;s%;s%;e%;e%;e%;e%;n%;n
/def -p0 -mglob -h'SEND {rnj}' = rnj1 %; /repeat -3 1 rnj2


;
;
; ship exchanges
;
/def -p0 -mglob -h'SEND {xfal}' = get 1 falcon from boh %; \
  exchange falcon for copper %; \
  put 9 copper in boh %; \
  /repeat -3 1 /echo -a -p @{Cyellow}if exchange didn't work, try xtri, xcro or xeag.@{x}
/def -p0 -mglob -h'SEND {xtri}' = get 1 tri from boh %; \
  exchange tri for crown %; \
  ph 9 crown %; \
  exchange crown for eagle %; \
  ph 9 eagle %; \
  exchange eagle for falcon %; \
  ph 9 falcon %; \
  exchange falcon for copper %; \
  ph 9 copper
/def -p0 -mglob -h'SEND {xcro}' = get 1 crown from boh %; \
  exchange crown for eagle %; \
  ph 9 eagle %; \
  exchange eagle for falcon %; \
  ph 9 falcon %; \
  exchange falcon for copper %; \
  ph 9 copper
/def -p0 -mglob -h'SEND {xeag}' = get 1 eagle from boh %; \
  exchange eagle for falcon %; \
  ph 9 falcon %; \
  exchange falcon for copper %; \
  ph 9 copper

;
;
; directions for ryu mountain
; (and any others where immediate arrival not recommended)
;
;
/def -p0 -mglob -h'SEND {ryu}' = rest %; \
  /echo -a -p @{Cyellow}0. north all the way@{x} %; \
  /echo -a -p @{Cyellow}1. e, ne, e, n, ne, u@{x} %; \
  /echo -a -p @{Cyellow}2. sw, sw, w, nw, u@{x} %; \
  /echo -a -p @{Cyellow}3. se, e ne u ***@{x}%; \
  /echo -a -p @{Cyellow}4. w, u, rest@{x}
/def -p0 -mglob -h'SEND {ryu1}' = e %; ne %; e %; n %; ne %; u %; rest %; hp
/def -p0 -mglob -h'SEND {ryudown4}' = d %; sw %; s %; w %; sw %; w %; rest %; hp
/def -p0 -mglob -h'SEND {ryu2}' = sw %; sw %; w %; nw %; u %; rest %; hp
/def -p0 -mglob -h'SEND {ryudown3}' = d %; se %; e %; ne %; ne %; rest %; hp
/def -p0 -mglob -h'SEND {ryu3}' = se %; e %; ne %; u %; rest %; hp
/def -p0 -mglob -h'SEND {ryudown2}' = d %; sw %; w %; nw %; rest %; hp
/def -p0 -mglob -h'SEND {ryu4}' = w %; u %; rest %; hp
/def -p0 -mglob -h'SEND {ryudown1}' = d %; e %; rest %; hp

;
;directions for searching fields
;(assume start with full EP)
;
/def -p0 -mglob -h'SEND {v1}' = e%; e%; e%; e%; e%; e%; n%; n
/def -p0 -mglob -h'SEND {v2}' = sr%; sr%; e%; sr%; sr%; e%; sr%; sr
/def -p0 -mglob -h'SEND {v3}' = s%; s%; e%; e%; n%; n
/def -p0 -mglob -h'SEND {v4}' = sr%; sr%; e%; sr%; sr%; e%; sr%; sr
/def -p0 -mglob -h'SEND {v5}' = s%; s%; s%; s%; sr%; sr%; w%; sr%; sr%; w%; sr%; sr
/def -p0 -mglob -h'SEND {v6}' = n%; n%; w%; w%; s%; s
/def -p0 -mglob -h'SEND {v7}' = sr%; sr%; w%; sr%; sr%; w%; sr%; sr%; n%; n%; w%; w%; /echo -a -p @{Cyellow}at fearn@{x}

;
; quert wonderstone
;

/def -p0 -mglob -h'SEND {cquert}' = \
    rq%; \
    mt quert%; \
    move boulder%; \
    /repeat -2 2 quertsearch%; \
    /repeat -8 1 quertfinish

/def -p0 -mglob -h'SEND {quertsearch}' = \
    dig hole%; \
    d%; \
    s%; \
    s%; \
    get stone%; \
    n%; \
    n%; \
    u%; \
    move boulder%; \

/def -p0 -mglob -h'SEND {quertfinish}' = \
    keep stone%; \
    mt beithe%; \
    rest

;roc's chick at top of oak (don't attack chicks unless you want to die).
;dive with fish for carp in akane river, search cave.
;ricecakes in the north house's kitchen cellar.
;fireplace stuff after killing fisherman's wife.


/def -p0 -mglob -h'SEND {sakai2}' = \
    remove shoes%; \
    e%;\
    e%;\
    move sacks%;\
    open trapdoor%;\
    d%;\
    ga%;\
    u%;\
    w%;\
    w%;\
    leave%;\
    rest%; \
    hp

/def -p0 -mglob -h'SEND {sakai3}' = \
    climb oak%; \
    search branches%;\
    get chick%;\
    u%;\
    nest%;\
    put chick in nest%;\
    search%;\
    get all%;\
    branch%;\
    d%;\
    d%;\
    rest%; \
    hp

/def -p0 -mglob -h'SEND {sakai4}' = \
    swim river%;\
    dive%;\
    throw fish downstream%;\
    enter cave%;\
    search%;\
    get all%;\
    river%;\
    u%;\
    w%;\
    rest%; \
    hp

/def -p0 -mglob -h'SEND {saks1}' = \
    saks1a%;\
    /repeat -2 1 saks1b
/def -p0 -mglob -h'SEND {saks3}' = \
    saks3a%; \
    /repeat -2 1 saks3b

/def -p0 -mglob -h'SEND {saks1a}' = \
    s%;\
    e%;\
    e%;\
    s%;\
    s%;\
    s%;\
    s%;\
    s%;\
    s%;\
    s%; \
    ii

/def -p0 -mglob -h'SEND {saks1b}' = \
    e%;\
    n%;\
    sa%;\
    s%;\
    e%;\
    s%;\
    sa%;\
    n%;\
    e%;\
    e%; \
    rest%; \
    hp

/def -p0 -mglob -h'SEND {saks2}' = \
    cii%; \
    gboh%; \
    sa%; \
    w%;\
    w%;\
    w%;\
    w%;\
    w%;\
    rest%; \
    hp

/def -p0 -mglob -h'SEND {saks3a}' = \
    cge coins%;\
    w%;\
    s%;\
    bank

/def -p0 -mglob -h'SEND {saks3b}' = \
    n%;\
    e%;\
    e%;\
    n%;\
    n%;\
    n%;\
    n%;\
    n%;\
    n%;\
    n%;\
    w%;\
    w%;\
    n%;\
    rest%; \
    hp

