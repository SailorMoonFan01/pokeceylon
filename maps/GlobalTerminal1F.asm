	object_const_def

GlobalTerminal1F_MapScripts:
	db 0

	db 0

GlobalTerminal1F_MapEvents:
	db 0, 0 ; filler

	db 2
	warp_event  8, 11, GLOBAL_TERMINAL_OUTSIDE, 1
	warp_event  9, 11, GLOBAL_TERMINAL_OUTSIDE, 1

	db 0

	db 0

	db 0
