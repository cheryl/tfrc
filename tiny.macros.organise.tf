; /loaded tiny.macros.organise.tf
;
; organising stuff involved in combat that isn't actually combat.
; of which some involves the boh.
;
;
;
;
; Post-combat macros
;
/def -p0 -mglob -h'SEND {bc}' = bury %{bury}
/def -p0 -mglob -h'SEND {bce}' = /set bury corpse evil
/def -p0 -mglob -h'SEND {bcg}' = /set bury corpse good
/def -p0 -mglob -h'SEND {bcn}' = /set bury corpse
/def -p0 -mglob -h'SEND {finish}' = bc %; get all
/def -p0 -mglob -h'SEND {exc}' = \
  exchange copper for falcon %; \
  exchange falcon for eagle %; \
  exchange eagle for crown %; \
  exchange crown for tri
/def -p0 -mglob -h'SEND {bank}' = \
;  cge coins%; \
  balance %; \
  gboh coins %; \
  deposit all%; \
  balance
;  /repeat -3 1 deposit all %; \
;  /repeat -4 1 balance
;
;
;
; stacks for specific annoyances
;
/def -p0 -mglob -h'SEND {lb}' = \
  light torch %; \
  burn leech with torch %; \
  unlight torch
/def -p0 -mglob -h'SEND {sf}' = \
  swarm fireflies %; \
  /repeat -00:10:35 1 sf
/def -p0 -mglob -h'SEND {vready}' = \
  retrieve amulet %; \
  retrieve bracers %; \
  retrieve cloak %; \
  retrieve gloves %; \
  retrieve greaves %; \
  retrieve helm %; \
  retrieve ring %; \
  retrieve scale boots %; \
  retrieve suit
/def -p0 -mglob -h'SEND {vunready}' = \
  store amulet %; \
  store bracers %; \
  store cloak %; \
  store gloves %; \
  store greaves %; \
  store helm %; \
  store ring %; \
  store scale boots %; \
  store suit
/def -p0 -mglob -h'SEND {ctest}' = \
  eq armor %; \
  ue armor %; \
  eq armor %; \
  keep armor
/def -p0 -mglob -h'SEND {cheavy}' = \
  gboh coins %; \
  exc %; \
  pboh coins
/def -p0 -mglob -h'SEND {ht}' = get all from boh %; i
/def -p0 -mglob -h'SEND {rune}' = runes search %; \
  /repeat -00:01:30 1 runes stop %; \
  /repeat -00:01:35 1 rune
/def -p0 -mglob -h'SEND {ido}' = n %; \
    buy pouch %; \
    s %; \
    rest %; \
    /repeat -00:07:30 1 ido
;
;
; trigger command list
;

;  /echo -a -p @{Cyellow}+---------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}|         T R I G G E R S         |@{x}%; \
;  /echo -a -p @{Cyellow}+----------+---------+------------+@{x}%; \
;  /echo -a -p @{Cyellow}| function | command | subsection |@{x}%; \
;  /echo -a -p @{Cyellow}+----------+---------+------------+@{x}%; \
;  /echo -a -p @{Cyellow}|   ship   |  ships  |.travelling |@{x}%; \
;  /echo -a -p @{Cyellow}|   rest   |   rs    |.travelling |@{x}%; \
;  /echo -a -p @{Cyellow}|  clouds  |  cloud  |  .combat   |@{x}%; \
;  /echo -a -p @{Cyellow}|  hpbot*  |   hpb   |  .combat   |@{x}%; \
;  /echo -a -p @{Cyellow}| hirihunt |  hiril  |  .combat   |@{x}%; \
;  /echo -a -p @{Cyellow}|   loot   |  loots  |.paracombat |@{x}%; \
;  /echo -a -p @{Cyellow}+----------+---------+------------+@{x}%; \
;  /echo -a -p @{Cyellow}|       main menu: "index"        |@{x}%; \
;  /echo -a -p @{Cyellow}+---------------------------------+
;
;
; hirilonde commands list
;
;  /echo -a -p @{Cyellow}+----------------------------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}|                 C O M P A N I O N                  |@{x}%; \
;  /echo -a -p @{Cyellow}+----------------------------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}|                       Default                      |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+------------------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}| whisper | c follow            c report             |@{x}%; \
;  /echo -a -p @{Cyellow}|         | c wait              cd: c defend         |@{x}%; \
;  /echo -a -p @{Cyellow}|         | cii: c inventory    cc: c cease          |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+------------------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}| quiet   | pc: party create    cre: c' reincarnate  |@{x}%; \
;  /echo -a -p @{Cyellow}|         | cto: c' train on    cad: c' advance      |@{x}%; \
;  /echo -a -p @{Cyellow}|         | cst: c' status      csu: c' summon       |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+------------------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}|                       Custom                       |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+---------+-------------------+------------+@{x}%; \
;  /echo -a -p @{Cyellow}|         | command | function          | purpose    |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+---------+-------------------+------------+@{x}%; \
;  /echo -a -p @{Cyellow}| states  | hsbegin | pc, cto, csu, cd  | start      |@{x}%; \
;  /echo -a -p @{Cyellow}|         | hsnorm  | follow/w30, ck    | norm hunt  |@{x}%; \
;  /echo -a -p @{Cyellow}|         | hsbrief | follow/w70, cd/cc | brief hunt |@{x}%; \
;  /echo -a -p @{Cyellow}|         | hsaggro | wait/w100         | aggro hunt |@{x}%; \
;  /echo -a -p @{Cyellow}|         | hsoops  | follow + wimpy 0  | kill hiri  |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+---------+-------------------+------------+@{x}%; \
;  /echo -a -p @{Cyellow}| hsnorm  | ck      | kill %{t}                      |@{x}%; \
;  /echo -a -p @{Cyellow}|         | hc      | x every 30 seconds            |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+---------+--------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}| hsaggro | agii    | inventory while aggro          |@{x}%; \
;  /echo -a -p @{Cyellow}|         | agxh    | xh while aggro                 |@{x}%; \
;  /echo -a -p @{Cyellow}|         | aggive  | give pouch while aggro         |@{x}%; \
;  /echo -a -p @{Cyellow}|         | agatk   | throw powder while aggro       |@{x}%; \
;  /echo -a -p @{Cyellow}+---------+---------+--------------------------------+@{x}%; \
;  /echo -a -p @{Cyellow}|                 main menu: "index"                 |@{x}%; \
;  /echo -a -p @{Cyellow}+----------------------------------------------------+@{x}


