class_name Prop extends Interactable

@export var isDoor: bool
@export var hasText: bool
@export var finishDay: bool
@export var exitZone: Area3D

@export var nextScenePath: String
@export var nextSceneName: String
@export var nextSceneMessage: String

func interact(currentInteractable):
	if hasText:
		Game.player.dialogBox.visible = true
		Game.player.ui.visible = !Game.player.ui.visible
		Game.player.label.text = currentInteractable.message
		Game.player.isFrozen = Game.player.ui.visible
	
	if isDoor and nextScenePath:
		Game.player.dialogBox.visible = false
		Transition.changeScene(nextScenePath, nextSceneName, nextSceneMessage)
