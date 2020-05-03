extends Button

export var Scene := "res://Assets/Scenes/Game.tscn"
		
func _pressed():
	get_tree().change_scene(Scene)

func _process(_delta):
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene(Scene)
