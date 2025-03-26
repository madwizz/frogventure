class_name Prop extends Interactable

@export var isDoor: bool
@export var hasText: bool
@export var finishDay: bool
@export var exitZone: Area3D

@export var nextScenePath: String

func interact(currentInteractable):
	
	print('interact')
	
	if hasText:
		Game.player.dialogBox.visible = true
		Game.player.ui.visible = !Game.player.ui.visible
		Game.player.label.text = currentInteractable.message
		Game.player.isFrozen = Game.player.ui.visible
	
	if finishDay:
		Game.player.ui.visible = true
		Game.player.dialogBox.visible = false
		Game.player.dayText.visible = true
		Game.player.today.text = Game.days[Game.counter]
		Game.player.daysRemain.text = Game.daysRemain[Game.counter]
		Game.counter += 1
		#fadeIn()
		#await player.animPlayer.animation_finished
		#fadeOut()
	
	if isDoor and nextScenePath:
		Game.player.dialogBox.visible = false
		#fadeIn()
		#await Game.player.animPlayer.animation_finished
		Transition.changeScene(nextScenePath)
		#fadeOut()

#func fadeIn():
	#player.ui.visible = true
	#player.isFrozen = true
	#player.animPlayer.play('fadeIn')
#
#func fadeOut():
	#player.isFrozen = false
	#player.animPlayer.play('fadeOut')
	#player.ui.visible = true
