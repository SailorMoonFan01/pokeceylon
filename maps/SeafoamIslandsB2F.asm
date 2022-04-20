	object_const_def
	const SEAFOAMB2F_BOULDER1
	const SEAFOAMB2F_BOULDER2

SeafoamIslandsB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 11, SEAFOAMB2F_BOULDER1, .Boulder1
	stonetable 10, SEAFOAMB2F_BOULDER2, .Boulder2
	db -1 ; end

.Boulder1:
	disappear SEAFOAMB2F_BOULDER1
	clearevent EVENT_BOULDER_IN_SEAFOAM_8
	sjump .FinishBoulder

.Boulder2:
	disappear SEAFOAMB2F_BOULDER2
	clearevent EVENT_BOULDER_IN_SEAFOAM_7
	sjump .FinishBoulder

.FinishBoulder:
	pause 30
	scall .BoulderFallsThrough
	opentext
	writetext SeafoamB2FBoulderFellThroughText
	waitbutton
	closetext
	end

.BoulderFallsThrough:
	playsound SFX_STRENGTH
	earthquake 80
	end
	
SeafoamB2FBoulder:
	jumpstd StrengthBoulderScript
	
SeafoamHiddenBigPearl:
	hiddenitem BIG_PEARL, EVENT_SEAFOAM_HIDDEN_BIG_PEARL
	
SeafoamB2FBoulderFellThroughText:
	text "The boulder fell"
	line "through."
	done

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 21, 15, SEAFOAM_ISLANDS_B1F, 6
	warp_event  5,  3, SEAFOAM_ISLANDS_B1F, 4
	warp_event 25, 11, SEAFOAM_ISLANDS_B1F, 5
	warp_event 13,  7, SEAFOAM_ISLANDS_B1F, 7
	warp_event 25,  3, SEAFOAM_ISLANDS_B3F, 3
	warp_event  5, 13, SEAFOAM_ISLANDS_B3F, 2
	warp_event 25, 13, SEAFOAM_ISLANDS_B3F, 1
	warp_event 19,  5, SEAFOAM_ISLANDS_B1F, 10 ; holes
	warp_event 22,  6, SEAFOAM_ISLANDS_B1F, 11
	warp_event 19,  6, SEAFOAM_ISLANDS_B3F, 6
	warp_event 22,  7, SEAFOAM_ISLANDS_B3F, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17, 15, BGEVENT_ITEM, SeafoamHiddenBigPearl

	db 2 ; object events
	object_event 23,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_5
	object_event 18,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamB2FBoulder, EVENT_BOULDER_IN_SEAFOAM_6
