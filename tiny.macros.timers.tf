;; /loaded tiny.macros.timers.tf

/def -p0 -mglob -h'SEND {tick_warn}' = /echo -a -p @{Cyellow}-@{x}
/def -p0 -mglob -h'SEND {tick_action}' = \
  /if (nt == 1) \
    /echo -a -p @{Cyellow}$[{nt}] minute@{x} %; \
  /else \
    /echo -a -p @{Cyellow}$[{nt}] minutes@{x} %; \
  /endif

/def -p0 -mglob -h'SEND {tick}' = \
  /if (next_tick) \
    /eval /echo %% $$[next_tick - $(/time @)] seconds until tick%;\
  /else \
    /echo -e %% Tick counter is not running.%;\
  /endif

/def -p0 -mglob -h'SEND {tickon}' = \
  tickoff %;\
  /@test next_tick := $(/time @) + ticksize %;\
  /repeat -$[ticksize - 30] 1 \
    /set _tick_pid1=0%%;\
    tick_warn%;\
  /set _tick_pid1=%?%;\
  /repeat -%ticksize 1 \
    /set _tick_pid2=0%%;\
    tick_action%%;\
    tickon%;\
  /set _tick_pid2=%? %; \
  /set nt=$[nt + 1]

/def -p0 -mglob -h'SEND {tickoff}' = \
  /@test _tick_pid1 & (kill(_tick_pid1), _tick_pid1:=0)%;\
  /@test _tick_pid2 & (kill(_tick_pid2), _tick_pid2:=0)%;\
  /set next_tick=0

;/def -p0 -mglob -h'SEND {tickset}' = tickoff %; tickon %*

/def -p0 -mglob -h'SEND {ticksize}' = /set ticksize %*

/def -E'playerfriendly' -p0 -mglob -h'SEND {check}' = \
    clanwho%; \
    /repeat -20 1 check%; \
    /set _check_pid=%?

/def -E'playerfriendly' -p0 -mglob -h'SEND {nocheck}' = \
    /kill %{_check_pid}
