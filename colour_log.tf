;; add colour to logs, with encode_attr

;; Antti Pietik�inen (heidel@operamail.com)
;; 2005
/loaded __tf_diku_colour_log__

/def -ag -Fp4000 -1 -q -hCONFLICT temp_hide_conflict
/def -i log=\
	/test getopts("c")%;\
	/if (opt_c==1) \
		/def -Fp0 -aL -mregexp -t"^.+" colour_logs=\
			/echo -agG - $$[encode_attr({*})]%;\
;			/echo -agG - $$[encode_ansi({*})]%;\
	/else \
		/if ({#}>0) \
			/if (ismacro("colour_logs")) \
				/undef colour_logs%;\
			/endif%;\
		/endif%;\
	/endif%;\
	/@log %{*}

/def -i log_view=\
	/test getopts("q")%;\
	/dokey pause%;\
	/if (!opt_q) \
		/echo -aLGBCyellow ######## LOG STARTS #########%;\
	/endif%;\
	/quote -S /log_view_helper '"%{*}"%;\
	/if (!opt_q) \
		/echo -aLGBCyellow ######### LOG ENDS ##########%;\
	/endif%;\
	/dokey page


/def -i log_view_helper=\
	/result decode_attr({*})
;	/result decode_ansi({*})
