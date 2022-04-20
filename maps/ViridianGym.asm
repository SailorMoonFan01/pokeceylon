	object_const_def ; object_event constants
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUY
	const VIRIDIANGYM_YOUNGSTER1
	const VIRIDIANGYM_YOUNGSTER2
	const VIRIDIANGYM_YOUNGSTER3

ViridianGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript:
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script
	
TrainerYoungsterLiam:
	trainer YOUNGSTER, LIAM, EVENT_BEAT_YOUNGSTER_LIAM, YoungsterLiamSeenText, YoungsterLiamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterLiamAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterLucas:
	trainer YOUNGSTER, LUCAS, EVENT_BEAT_YOUNGSTER_LUCAS, YoungsterLucasSeenText, YoungsterLucasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterLucasAfterBattleText
	waitbutton
	closetext
	end
	
TrainerYoungsterMateo:
	trainer YOUNGSTER, MATEO, EVENT_BEAT_YOUNGSTER_MATEO, YoungsterMateoSeenText, YoungsterMateoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMateoAfterBattleText
	waitbutton
	closetext
	end

LeaderBlueBeforeText:
	text "BLUE: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at CINNABAR,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "You're telling me"
	line "you conquered all"
	cont "the GYMS in JOHTO?"

	para "Heh! JOHTO's GYMS"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, JOHTO boy?"
	done

LeaderBlueWinText:
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "EARTHBADGE."
	done

LeaderBlueAfterText:
	text "BLUE: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

LeaderBlueEpilogueText:
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done

ViridianGymGuyText:
	text "Yo, CHAMP in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The GYM LEADER is"
	line "a guy who battled"

	para "the CHAMPION three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuyWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done
	
YoungsterLiamSeenText:
	text "Oh a challenger"
	line "awaits VIRIDIAN"
	cont "GYM!"

	para "Let's battle!"
	done

YoungsterLiamBeatenText:
	text "Impossible!"
	done

YoungsterLiamAfterBattleText:
	text "BLUE has trained"
	line "hard enough to "
	cont "beat RED in a"
	cont "rematch!"

	para "You better not"
	line "mess with him!"
	done
	
YoungsterLucasSeenText:
	text "VIRIDIAN GYM has"
	line "been renovated"
	cont "after GIOVANNI was"
	cont "leader!"

	para "I feel blessed to"
	line "be a trainer here!"
	done

YoungsterLucasBeatenText:
	text "I should train"
	line "more!"
	done

YoungsterLucasAfterBattleText:
	text "You don't stand a"
	line "chance against the"
	cont "new leader!"
	done
	
YoungsterMateoSeenText:
	text "Oh a new face!"

	para "Ready to battle"
	line "my friend!"
	done

YoungsterMateoBeatenText:
	text "How!"
	done

YoungsterMateoAfterBattleText:
	text "If you beat the"
	line "leader then I'd"
	cont "be shocked!"
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	db 5 ; object events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterLiam, EVENT_VIRIDIAN_GYM_BLUE
	object_event  4,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterLucas, EVENT_VIRIDIAN_GYM_BLUE
	object_event  4, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterMateo, EVENT_VIRIDIAN_GYM_BLUE

