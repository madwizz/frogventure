extends Area3D

class_name Interactor

var controller: Node3D

func interact(interactable: Interactable) -> void:
	interactable.interacted.emit(self)

func focus(interactable: Interactable) -> void:
	interactable.focused.emit(self)

func unfocus(interactable: Interactable) -> void:
	interactable.unfocused.emit(self)

func get_closest_interactable() -> Interactable:
	var list: Array[Area3D] = get_overlapping_areas()
	var dist: float
	var closest_dist: float = INF
	var closest: Interactable = null
	
	for interactable in list:
		dist = interactable.global_position.distance_to(global_position)
		
		if dist < closest_dist:
			closest = interactable as Interactable
			closest_dist = dist
	
	return closest
