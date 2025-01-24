extends Area3D

var isTrigger = false

func enterTrigger(body):
	if body.is_in_group('player'):
		isTrigger = true

func exitTrigger(body):
	if body.is_in_group('player'):
		isTrigger = false

func _process(_delta: float) -> void:
	if isTrigger && get_parent().current != true:
		get_parent().current = true
