NameMenuHeader:
	db STATICMENU_NO_TOP_SPACING
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"

PlayerNameArray:
IF DEF(_GOLD)
	db "NATE@"
	db "JOHN@"
	db "RIDLEY@"
	db "DRAKE@"
ELIF DEF(_SILVER)
	db "MURA@"
	db "PAUL@"
	db "HAROLD@"
	db "SILVER@"
ENDC
	db 2
	db "NAME@" ; title
