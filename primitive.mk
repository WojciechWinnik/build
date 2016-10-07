# primitive.mk

empty :=
space := $(empty) $(empty)
comma := ,
semicolon := ;

space2 := $(space)$(space)
space4 := $(space2)$(space2)
space8 := $(space4)$(space4)

indent_arg := $(space)
indent := $(space)$(indent_arg)

indent0 := $(empty)
indent1 := $(indent0)$(indent)
indent2 := $(indent1)$(indent1)
indent3 := $(indent2)$(indent1)
indent4 := $(indent3)$(indent1)
indent5 := $(indent4)$(indent1)
indent6 := $(indent5)$(indent1)
indent7 := $(indent6)$(indent1)
indent8 := $(indent7)$(indent1)

arg1 := $$(1)
arg2 := $(arg1),$$(2)
arg3 := $(arg2),$$(3)
arg4 := $(arg3),$$(4)
arg5 := $(arg4),$$(5)
arg6 := $(arg5),$$(6)
arg7 := $(arg6),$$(7)
arg8 := $(arg7),$$(8)

define append
$(strip \
  $(if $(__DEBUG__),$(info $(0)($(1),$(2)))) \
  $(eval $(1) := $($(strip $(1))) $(2)) \
)
endef

define bind
$(strip \
  $(if $(__DEBUG__),$(info $(0)($(1),$(2),$(3)))) \
  $(eval $(1) = $$(eval $$(call $(strip $(2)),$(3),$(arg8)))) \
)
endef
