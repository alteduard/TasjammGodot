extends TextureButton

export var Scene := "res://Assets/Scenes/Game.tscn"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _pressed():
	get_tree().change_scene(Scene)
