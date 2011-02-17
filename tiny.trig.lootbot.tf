;; /loaded tiny.trig.solohunt.lootbot.tf
; debugged for envinyatuvar
;
;
;; (2) loot trigger
/def -E'solo' -p0 -mglob -t'You take [a-z]*' loottrig = %; \
  /if (strcat(tolower(substr({L1}, 0, 1)), tolower(substr({L1}, 1, (strlen({L1})-2)))) !~ holding|tricks) \
    /set i=$[strcat(tolower(substr({L1}, 0, 1)), tolower(substr({L1}, 1, (strlen({L1})-2))))] %; \
  /endif %; \
;; ## sift suffixes to produce a /set i which can be pboh*'d ##
  /if (i =/ '{(tempered)|(sharpened)|(balanced)|(holy)}') \
    /set i=$[strcat(tolower(substr({L2}, 0, 1)), tolower(substr({L2}, 1, (strlen({L2})-1))))] %; \
    /if (i =/ '{(tempered)|(sharpened)|(balanced)|(holy)}') \
      /set i=$[strcat(tolower(substr({L3}, 0, 1)), tolower(substr({L3}, 1, (strlen({L3})-1))))] %; \
      /if (i =/ '{(tempered)|(sharpened)|(balanced)|(holy)}') \
	/set i=$[strcat(tolower(substr({L4}, 0, 1)), tolower(substr({L4}, 1, (strlen({L4})-1))))] %; \
      /elseif (i =/ '}') \
        /set i=$[strcat(tolower(substr({L6}, 0, 1)), tolower(substr({L6}, 1, (strlen({L6})-1))))] %; \
      /endif %; \
    /elseif (i =/ '}') \
      /set i=$[strcat(tolower(substr({L5}, 0, 1)), tolower(substr({L6}, 1, (strlen({L6})-1))))] %; \
    /endif %; \
;; last 3 words are "{ flaming }"
  /elseif (i =/ '}') \
    /set i=$[strcat(tolower(substr({L4}, 0, 1)), tolower(substr({L4}, 1, (strlen({L4})-1))))] %; \
    /if (i =/ '{(tempered)|(sharpened)|(balanced)|(holy)}') \
      /set i=$[strcat(tolower(substr({L5}, 0, 1)), tolower(substr({L5}, 1, (strlen({L5})-1))))] %; \
      /if (i =/ '{(tempered)|(sharpened)|(balanced)|(holy)}') \
	/set i=$[strcat(tolower(substr({L6}, 0, 1)), tolower(substr({L6}, 1, (strlen({L6})-1))))] %; \
      /endif %; \
    /endif %; \
  /endif %; \
;;  ## action on /set i ##
;; don't want, ph
  /if (i =/ '{trident|reed|shurikens|helm|rapier|wakizashi|boomerang|shield|talisman|staff|darts|shortbow|vambraces|axe|ear-spoon|katana|bardiche|blowgun|club|shortsword|dagger|fork|rod|quarterstaff|mace|scimitar|gorget|kukri|longbow|robes|spetum|hood|shield|sling|javelin|slippers|chainmail|robe|longsword|wand|wany-tongued|star|sickle}') \
    ph %{i}%; \
;; leave it in the inventory, id at leisure or drop
  /elseif (i =/ '{shawl|ring|necklace|hauberk|coat|cuirass|habergeon}') \
    /echo -a -p @{Cwhite}@{Cblack}Remember to id a @{x}@{Cred}%{i}@{x} %; \
; comment this line out for normal hunting
;    keep %{i}%; \
    ph %{i}%; \
  /elseif (i =/ '{honeyy|herbs}') \
    /set i=$[strcat(tolower(substr({L1}, 0, 1)), tolower(substr({L1}, 1, (strlen({L1})-2))))] %; \
; comment this line out for normal hunting
;    keep %{i}%;\
    ph %{i}%; \
;; overlapping want/notwant
  /elseif (i =/ '{armor|greaves|gauntlets|bracers|cloak|gloves|hood|boots|hilt}') \
;; strange names
    /if (i =/ 'hilt') \
      ph dagger%; \
    /else %; \
;; check 2nd last word
      /set j=$[strcat(tolower(substr({L2}, 0, 1)), tolower(substr({L2}, 1, (strlen({L2})-1))))] %; \
      /set k=$[strcat({j}, ' ', {i})] %; \
      /if (j =/ '{plate|brass|steel|mailed|leather|velvet|padded|iron}') \
	ph %{k} %; \
      /elseif (j =/ '{lambskin|scale|glossy|creation|sullied|frosty|lionskin}') \
; comment this line out for normal hunting
;	keep %{k} %; \
	ph %{k} %; \
      /endif %; \
    /endif %; \
  /endif
