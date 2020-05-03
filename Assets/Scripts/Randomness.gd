extends Node2D


export(int) var prob = 2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	if randi() % prob > 1:
		global_position.y = 1000
