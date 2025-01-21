extends CharacterBody3D

@export var speed: float = 5.0
@export var rotation_speed: float = 3.0

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("endSession"):
		get_tree().quit()
	
	var move_input = Input.get_action_strength("back") - Input.get_action_strength("forward")
	var turn_input = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	if turn_input != 0:
		rotation.y += turn_input * rotation_speed * delta
	
	var dir = -transform.basis.z * move_input * speed
	dir.y = 0
	
	velocity = dir
	move_and_slide()
