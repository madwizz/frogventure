extends Area3D

var isTrigger = false

func enterTrigger(body):
	if body.name == 'Player':
		isTrigger = true

func exitTrigger(body):
	if body.name == 'Player':
		isTrigger = false

func _process(_delta: float) -> void:
	if isTrigger && get_parent().current != true:
		get_parent().current = true
