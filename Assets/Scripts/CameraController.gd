extends Node2D


export(NodePath) var player1
export(NodePath) var player2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var p1 = get_node(player1)
	var p2 = get_node(player2)

	global_position.x = p1.global_position.x + 100 + (p2.global_position.x - p1.global_position.x) * 0.5
