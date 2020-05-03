extends Node


export(int) var prob = 2

func _ready():
	randomize()
	if randi() % prob > 1:
		get_parent().remove_child(self)
