extends Node

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

@onready var nameLabel: Label = $UI/ColorRect/Info/Name
@onready var messageLabel: Label = $UI/ColorRect/Info/Message

var isActive: bool = false

func changeScene(scenePath: String, sceneName: String, sceneMessage: String) -> void:
	if isActive:
		return
	isActive = true
	
	nameLabel.text = sceneName
	messageLabel.text = sceneMessage
	
	animPlayer.play("fadeIn")
	await animPlayer.animation_finished
	
	var nextScene = load(scenePath)
	if nextScene and nextScene is PackedScene:
		get_tree().change_scene_to_packed(nextScene)
		await get_tree().process_frame
	
	animPlayer.play("fadeOut")
	await animPlayer.animation_finished
	isActive = false
