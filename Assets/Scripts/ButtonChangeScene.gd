extends Button

export var Scene := "res://Assets/Scenes/Game.tscn"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_SPACE:
		get_tree().change_scene(Scene)
		
func _pressed():
	get_tree().change_scene(Scene)

