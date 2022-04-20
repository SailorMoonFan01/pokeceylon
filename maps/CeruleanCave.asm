	object_const_def
	const CERULEAN_CAVE_MEWTWO

CeruleanCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Mewtwo
	
.Mewtwo:
	checkevent EVENT_MEWTWO
	iftrue .NoAppear
	sjump .Appear

.Appear:
	appear CERULEAN_CAVE_MEWTWO
	return

.NoAppear:
	disappear CERULEAN_CAVE_MEWTWO
	return
	
Mewtwo:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_MEWTWO
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEWTWO, 85
	startbattle
	disappear CERULEAN_CAVE_MEWTWO
	reloadmapafterbattle
	end
	
MewtwoText:
	text "Mew!"
	done

CeruleanCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 35, 35, CERULEAN_CITY, 7

	db 0 ; coord events

	db 0 ; bg events
	
	db 1 ; object events
	object_event 21,  4, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_MEWTWO
