class_name Prop extends Interactable

@export var isDoor: bool
@export var hasText: bool
@export var finishDay: bool
@export var exitZone: Area3D

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

func interact(currentInteractable):
	
	if hasText:
		player.dialogBox.visible = true
		player.ui.visible = !player.ui.visible
		player.label.text = currentInteractable.message
		player.isFrozen = player.ui.visible
	
	if finishDay:
		player.ui.visible = true
		player.dialogBox.visible = false
		player.dayText.visible = true
		player.today.text = days[counter]
		player.daysRemain.text = daysRemain[counter]
		counter += 1
		fadeIn()
		await player.animPlayer.animation_finished
		fadeOut()
	
	if isDoor and exitZone:
		player.dialogBox.visible = false
		fadeIn()
		await player.animPlayer.animation_finished
		player.global_transform.origin = exitZone.global_transform.origin
		var exitDir = exitZone.global_transform.basis
		player.global_transform.basis = exitDir
		fadeOut()

func fadeIn():
	player.ui.visible = true
	player.isFrozen = true
	player.animPlayer.play('fadeIn')

func fadeOut():
	player.isFrozen = false
	player.animPlayer.play('fadeOut')
	player.ui.visible = true
