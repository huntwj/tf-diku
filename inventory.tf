;;
;; tf-diku/inventory.tf
;;
/loaded __tf_diku_inventory__

/require alias.tf
/require tf-util/variables.tf

/alias pc /diku_putContainer %*
/alias gc /diku_getContainer %*
/alias pac pc all
/alias pcc pc all.coin


/test util_declareVar("inv.container.main", "pouch")

/def diku_putContainer = \
    /let _container=$[util_getVar("inv.container.main")]%;\
    put %{1} %{2-%{_container}}

/def diku_getContainer = \
    /let _container=$[util_getVar("inv.container.main")]%;\
    get %{1} %{2-%{_container}}

/def diku_lookInContainer = \
    /let _container=$[util_getVar("inv.container.main")]%;\
    look in %{_container}

