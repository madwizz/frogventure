extends Node

var player: CharacterBody3D = null

var currentScenePath: String = ""

func _ready():
	$AudioStreamPlayer3D.stream.loop = true
	$AudioStreamPlayer3D.play()

	$AudioStreamPlayer3D2.stream.loop = true
	$AudioStreamPlayer3D2.play()

func toggleUi(state: bool) -> void:
	if player:
		player.ui.visible = state
		player.isFrozen = state

func reset():
	player = null
	currentScenePath = ""
