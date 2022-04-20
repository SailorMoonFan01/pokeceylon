	object_const_def ; object_event constants
	const ROUTE6_POKEFAN_M
	const ROUTE6_YOUNGSTER1
	const ROUTE6_YOUNGSTER2
	const ROUTE6_YOUNGSTER3
Route6_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerYoungsterXander:
	trainer YOUNGSTER, XANDER, EVENT_BEAT_YOUNGSTER_XANDER, YoungsterXanderSeenText, YoungsterXanderBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterXanderAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterGabe:
	trainer YOUNGSTER, GABE, EVENT_BEAT_YOUNGSTER_GABE, YoungsterGabeSeenText, YoungsterGabeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGabeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerYoungsterReid:
	trainer YOUNGSTER, REID, EVENT_BEAT_YOUNGSTER_REID, YoungsterReidSeenText, YoungsterReidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterReidAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText
	
YoungsterXanderSeenText:
	text "Reading week is"
	line "happening right at"
	cont "moment for me!"

	para "I really want to"
	line "battle you!"
	done

YoungsterXanderBeatenText:
	text "Unbelievable!"
	done

YoungsterXanderAfterBattleText:
	text "I think I should"
	line "wiser choices in"
	cont "terms of moves!"

	para "Maybe I'll have a"
	line "better chance in a"
	cont "rematch someday!"
	done

YoungsterGabeSeenText:
	text "So much bug bites"
	line "when walking out!"

	para "Ready to taste"
	line "some fire!"
	done

YoungsterGabeBeatenText:
	text "Ugh!"
	line "You sweeped me!"
	done

YoungsterGabeAfterBattleText:
	text "I'm going to raise"
	line "my #MON more"
	cont "often to get more"
	cont "stronger!"
	done

YoungsterReidSeenText:
	text "I've come to take"
	line "a break from my"
	cont "shift at LOWES!"

	para "I think I have"
	line "time for a match!"
	done

YoungsterReidBeatenText:
	text "Aigh!"
	line "You beat me!"
	done

YoungsterReidAfterBattleText:
	text "Well I better be"
	line "going back to"
	cont "work very soon."
	done

Route6PokefanMText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	db 4 ; object events
	object_event 15, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterXander, -1
	object_event  2,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGabe, -1
	object_event  6,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterReid, -1
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH

