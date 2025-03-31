extends Node3D

@export var player1: CharacterBody3D
@export var player2: CharacterBody3D

func _ready():
	if Game.initialSpawn:
		if is_instance_valid(player2):
			player2.queue_free()
		Game.player = player1
	else:
		if is_instance_valid(player1):
			player1.queue_free()
		Game.player = player2
		if Game.player == player2:
			Game.canFinish = true
