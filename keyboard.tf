;; Common keyboard bindings
;; Antti Pietikäinen (heidel@operamail.com)
;; 2005

;; enter key doesn't store empty lines or lines 
;; shorter than 3 into input history

;; numpad enter recalls automatically last line (zmud-style)

;; Numeric keypad is bound as dirs
;; edit movehook if you want something
;; done every time you move using 
;; the keypad. Example:
;; /edit movehook=clairvoyance


;; ---------------------------------
;; ----------- movehook ------------
;; ---------------------------------
/def -i movehook=/test 0
;; ---------------------------------
;; ------------- ´´ ----------------
;; ---------------------------------
/def -i -b'´´' = /grab
;; ---------------------------------
;; ---------- ctrl + n -------------
;; ---------------------------------
/def -i -b'^n' = /fg ->
;; ---------------------------------
;; ----------- up/down -------------
;; ---------------------------------
/def -i key_up = /dokey RECALLB
/def -i key_down = /dokey RECALLF
;; ---------------------------------
;; -------- alt + up/down ----------
;; ---------------------------------
/def -i key_esc_up = /dokey HPAGEBACK
/def -i key_esc_down = /dokey HPAGE
/def -i key_meta_up = /dokey HPAGEBACK
/def -i key_meta_down = /dokey HPAGE
;; ---------------------------------
;; ------- alt + left/right --------
;; ---------------------------------
/def -i key_esc_left = /dokey WLEFT
/def -i key_esc_right = /dokey WRIGHT
/def -i meta_esc_left = /dokey WLEFT
/def -i meta_esc_right = /dokey WRIGHT
;; ---------------------------------
;; ------------ enter --------------
;; ---------------------------------
/def -i -b'^M' =\
	/if (kblen()==0) \
		/send -h%;\
	/elseif (kblen()<3) \
		/send -h $[kbhead()]$[kbtail()]%;\
		/grab%;\
	/else \
		/dokey NEWLINE%;\
	/endif
;; ---------------------------------
;; -------- enter (keypad) ---------
;; ---------------------------------
/def -i key_nkpEnt =\
	/if (kblen()==0) \
		/dokey RECALLB%;\
	/else \
		/dokey NEWLINE%;\
		/dokey RECALLB%;\
	/endif
;; ---------------------------------
;; ----------- keypad --------------
;; ---------------------------------
/def -i key_nkp0 = /send -h map
/def -i key_nkp5 = /send -h look
/def temp_key = /eval /def -i key_nkp%{1} = /send -h %{2}%%%;/movehook %{2}
/temp_key 1 sw
/temp_key 2 s
/temp_key 3 se
/temp_key 4 w
/temp_key 6 e
/temp_key 7 nw
/temp_key 8 n
/temp_key 9 ne
/temp_key - up
/temp_key + down
/temp_key * out
/undef temp_key