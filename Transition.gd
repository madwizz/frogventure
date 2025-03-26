extends Node

@onready var ui: CanvasLayer = $UI
@onready var colorRect: ColorRect = $UI/ColorRect
@onready var dayText: Control = $UI/ColorRect/DayText
@onready var dialogBox: PanelContainer = $UI/DialogBox
@onready var label: Label = $UI/DialogBox/Label

@onready var today: Label = $UI/ColorRect/DayText/Today
@onready var daysRemain: Label = $UI/ColorRect/DayText/DaysRemain

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

var isActive: bool = false

func changeScene(scenePath: String) -> void:
	if isActive:
		return
	isActive = true
	
	#animPlayer.play("fadeIn")
	#await animPlayer.animation_finished
	
	var nextScene = load(scenePath)
	if nextScene and nextScene is PackedScene:
		get_tree().change_scene_to_packed(nextScene)
		await get_tree().process_frame
	
	#animPlayer.play("fadeOut")
	#await animPlayer.animation_finished
	isActive = false
