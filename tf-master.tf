Section -1: Vital functions always loaded
1. trig.solohunt - triggers that happen during/at end of combat.
2. macros.combat - macros for things that happen during/@end of combat.  Should be merged with trig.solohunt.
3. macros.paracombat - REALLY NEEDS REFORM no real function.
4. macros.travelling - stacks.
5. bind.tf
6. static.tf
7. reloading - what is the purpose of this file? - delete it.  need ONE reload macro, put it in something "important" like static.
8. tfstat - same. put it in with reloading.
9. solohunt.loot.tf and idling.tf are for xiella (idling=inspire trigs).  rename as such to prevent confusion.  eg "/xiella-tiny.trig.loot.tf	

Section -1.1: Side functions:
1. Individual trigger situation files (cham, hiril, rest, ships loot)
2. Major trigger files (hpbot, gags, retrig)

Section 0: what files not to change:
tiny.bind.tf
tiny.static.tf - maybe add later but doesn't need overhaul

Section 0.1: what files to delete
tiny.clouds.tf - remove all references later as well - we don't need that.

Section 0.2: what files require merging and rejigging:
hiri.tf and solohunt.hiri.tf.  They have almost the same application - create 2 commands that reference various files.

Section 0.3: what files need complete overhaul:
macros.combat.tf



Section 1: all commands in paracombat

/def -p0 -ag -mregexp -t'^$'

/def -p0 -mglob -h'SEND {loots}' = /load tiny.trig.loot.tf
/load tiny.macros.timers.tf
/def -p0 -mglob -h'SEND {bc}' = bury %{bury}
/def -p0 -mglob -h'SEND {bce}' = /set bury corpse evil
/def -p0 -mglob -h'SEND {bcg}' = /set bury corpse good
/def -p0 -mglob -h'SEND {bcn}' = /set bury corpse
/def -p0 -mglob -h'SEND {finish}' = bc %; get all
/def -p0 -mglob -h'SEND {exc}' = \
/def -p0 -mglob -h'SEND {bank}' = \
/def -p0 -mglob -h'SEND {lb}' = \
/def -p0 -mglob -h'SEND {sf}' = \
/def -p0 -mglob -h'SEND {vready}' = \
/def -p0 -mglob -h'SEND {vunready}' = \
/def -p0 -mglob -h'SEND {ctest}' = \
/def -p0 -mglob -h'SEND {cheavy}' = \
/def -p0 -mglob -h'SEND {safekeep}' = \
/def -p0 -mglob -h'SEND {ht}' = get all from bot %; get all 


Section 2: trig.loot

contains 1 trigger You take *

Section 3: tfstat
/set tfstat=2

- need HUNT for starting to hunt (previously solo) (HUNT)
- need a borg on/off for between travelling/hunting while "solohunting" (trigon/trigoff)
- need no trigs but ship/trigon, for getting onto the ship (include trigon in ships sequence rather than making a new state)
- need HUNT/trigoff after getting off the ship
- need no solo trigs/trigon for friends hunting.

default: HUNT state, triggers off
onship: remove all HUNT, load SHIP.tf, triggers on
offship: remove all, load HUNT, triggers off
huntsolo: HUNT state
friendshunt: HUNT state but disable a category of SOLO triggers.

States:
HUNT
TRIGON/TRIGOFF (borg 1/0) (disable triggers)
SHIP category (and disable all other triggers)
SOLO subcategory (to disable for friends hunting)

/def -p0 -mglob -h'SEND {solo}' = reload-solohunt 
--------------------------- default state, but disabled on load (borg=0).  in solo state, borg=1.
/def -p0 -mglob -h'SEND {friends}' = reload-solohunt 
--------------------------- only applies to paracombat stuff.  create a separate "disable" macro to disable end-of-combat triggers.
/def -p0 -mglob -h'SEND {idle}' = reload %; /set idli
--------------------------- not necessary except xiella - set code aside and set "idle" to borg=0
/def -p0 -mglob -h'SEND {bot}' = reload %; /set idlin
--------------------------- not necessary
/def -p0 -mglob -h'SEND {nsp}' = /set collectingsp=1 ---------------------------\
/def -p0 -mglob -h'SEND {ssp}' = /set collectingsp ---------------------------these 3 not really necessary
/def -p0 -mglob -h'SEND {ysp}' = /set collectingsp=0 ---------------------------/
/def -p0 -mglob -h'SEND {statkey}' = /echo -a -p 
