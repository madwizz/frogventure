extends Node

var player: CharacterBody3D = null

var currentScenePath: String = ""

var counter: int = 1
var days := [
	"The Second Day",
	"The Third Day",
	"The Fourth Day",
	"The Fifth Day",
	"The Sixth Day",
	"The Day"
]

var daysRemain := [
	"-Five Days Remain-",
	"-Four Days Remain-",
	"-Three Days Remain-",
	"-Two Days Remain-",
	"-One Day Remains-",
	"-You've Been Waiting For-"
]

func toggleUi(state: bool) -> void:
	if player:
		player.ui.visible = state
		player.isFrozen = state

func reset():
	player = null
	currentScenePath = ""
