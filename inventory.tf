;;
;; tf-diku/inventory.tf
;;
/loaded __tf_diku_inventory__

/require alias.tf
/require tf-util/variables.tf

/alias pc /diku_putContainer %{*}
/alias gc /diku_getContainer %{*}
/alias pac \
    pc all
/alias pcc \
    pc all.coin


/util_declareVar inv.container.main pouch

/def diku_putContainer = \
    /let _container=$[util_getVar("inv.container.main")]%;\
    put %{1} %{2-%{_container}}

/def diku_getContainer = \
    /let _container=$[util_getVar("inv.container.main")]%;\
    get %{1} %{2-%{_container}}

/alias lc /diku_lookInContainer %{*}
/def diku_lookInContainer = \
    /let _container=$[util_getVar("inv.container.main")]%;\
    look in %{_container}

/alias pack /diku_setPack %{*}
/def diku_setPack = \
    /if ({#}) \
        /util_setVar inv.container.main %{1}%;\
    /endif%;\
    /echo Pack is set to '$[util_getVar("inv.container.main")]'

