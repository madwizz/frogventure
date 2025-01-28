class_name Prop extends Interactable

@export var isDoor: bool
@export var exitZone: Area3D

func interact():
	if isDoor and exitZone:
		player.global_transform.origin = exitZone.global_transform.origin
