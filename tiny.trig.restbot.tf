;;/loaded tiny.trig.restbot.tf

/def -p0 -mglob -t'You are too weary to exit *' wearytrig = \
  rest%; \
  /undef wearytrig %; \
  /repeat -10 1 rs
