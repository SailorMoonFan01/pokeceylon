SeafoamIslandsEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandsEntrance_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 21,  9, ROUTE_20, 1
	warp_event  5,  9, ROUTE_20, 2
	warp_event 23,  7, SEAFOAM_ISLANDS_1F, 1
	warp_event  5,  7, SEAFOAM_ISLANDS_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
