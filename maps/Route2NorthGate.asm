	object_const_def ; object_event constants

Route2NorthGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2NorthGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9,  0, ROUTE_2, 1
	warp_event  8,  0, ROUTE_2, 1
	warp_event  0,  4, VIRIDIAN_FOREST, 1
	warp_event  0,  5, VIRIDIAN_FOREST, 2


	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
