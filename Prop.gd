class_name Prop extends Interactable

@export var charId: String = ""
@export_enum("first", "second") var lineKey: String = "first"

@export var isDoor: bool
@export var hasText: bool
@export var finishDay: bool
@export var exitZone: Area3D

@export var keysDoor: bool
@export var keys: bool

@export var finishDoor: bool
@export var finishKeys: bool

@export var coffeeDoor: bool
@export var coffee: bool

@export var bookDoor: bool
@export var books: bool

@export var museumDoor: bool
@export var museumVisited: bool

@export var nextScenePath: String
@export var nextSceneName: String
@export var nextSceneTime: String
@export var nextSceneMessage: String

@export var initialSpawn: bool

func showKeyClue(message: String) -> void:
	Game.player.ui.visible = true
	Game.player.dialogBox.visible = true
	Game.player.label.text = message
	Game.player.isFrozen = true
	Game.player.pressCue.visible = false
	await get_tree().create_timer(0.5).timeout
	Game.player.dialogBox.visible = false
	Game.player.ui.visible = false
	Game.player.isFrozen = false

func interact(currentInteractable):
	if !Game.player:
		return
	
	if hasText:
		Game.player.dialogBox.visible = true
		Game.player.ui.visible = !Game.player.ui.visible
		
		if charId != "":
			var line = Dialogs.getLine(charId, lineKey)
			Game.player.label.text = line
			Game.player.labelName.text = charId
		else:
			Game.player.label.text = currentInteractable.message
		
		Game.player.isFrozen = Game.player.ui.visible
		Game.player.pressCue.visible = false
		
		if keys:
			Game.hasKeys = true
			var message = 'Got keys now. Ready to go outside.'
			await showKeyClue(message)
			return
		if coffee:
			Game.hasCoffee = true
			var message = 'Dobar dan, moze za mene Rwanda Ghetsi jadan komac, hvala, videmo se, cao'
			await showKeyClue(message)
			return
		if books:
			Game.hasBooks = true
			var message = 'Здраствуйте, я за своим заказом. Ага, спасибо, всего доброго.'
			await showKeyClue(message)
			return
		if museumVisited:
			Game.museumVisited = true
			var message = 'Mmmmm. Intresting. Well, i guess thats enough for today'
			await showKeyClue(message)
			return
		if finishKeys:
			Game.museumVisited = true
			var message = 'Mmmmm. Intresting. Well, i guess thats enough for today'
			await showKeyClue(message)
			return
			
	if isDoor and nextScenePath:
		if keysDoor and !Game.hasKeys:
			var message = 'Cant leave without keys. They should be on the right of the door.'
			await showKeyClue(message)
			return
		if coffeeDoor and !Game.hasCoffee:
			var message = 'It would be dumb to leave without some coffee. I should ask the barista.'
			await showKeyClue(message)
			return
		if bookDoor and !Game.hasBooks:
			var message = 'I am not leaving without books. No way.'
			await showKeyClue(message)
			return
		if museumDoor and !Game.museumVisited:
			var message = 'Well, i am already here, why not check the museum before going back'
			await showKeyClue(message)
			return
		if finishDoor and !Game.canFinish:
			var message = 'I just left. I need to run some errands before i can go back.'
			await showKeyClue(message)
			return
			
		Game.initialSpawn  = initialSpawn
		Game.player.dialogBox.visible = false
		Transition.changeScene(nextScenePath, nextSceneName, nextSceneTime, nextSceneMessage)
			
	if finishDay:
			pass
