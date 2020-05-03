extends KinematicBody2D

export var player1 := true
export var snap := false
export var move_speed := 250
export var jump_force := 540
export var gravity := 900
export var slope_slide_threshold: = 50.0
export var yValueToDie = 313.076
export var snapLength = 8
var spawnpoint

var canDoubleJump = false

var velocity := Vector2()
var right := "right1"
var left := "left1"
var jump := "jump1"
var down := "down1"

func _ready():
	spawnpoint = position
	if(!player1):
		right = "right2"
		left = "left2"
		down = "down2"
		jump = "jump2"
		pass
func _process(delta):
	Movement(delta)
	Fall()
		





func Fall():
	if(position.y > 313.076):
		if player1:
			get_tree().change_scene("res://Assets/Scenes/Player2Wins.tscn")
		else:
			get_tree().change_scene("res://Assets/Scenes/Player1Wins.tscn")
		#position = spawnpoint

func smash():
	#I tried something, but failed :(
	pass
	
	


func Movement(delta):
	var direction_x = Input.get_action_strength(right) - Input.get_action_strength(left)
	velocity.x = direction_x * move_speed
	
	if Input.is_action_just_pressed(down) and player1:
		smash()
	
	if Input.is_action_just_pressed(jump):
		if snap:
			velocity.y = -jump_force
			snap = false
			canDoubleJump = true
		elif canDoubleJump:
			velocity.y = -jump_force
			snap = false
			canDoubleJump = false
		
	velocity.y += gravity*delta
	var snap_vector = Vector2(0,snapLength) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector2.UP, slope_slide_threshold, 4, deg2rad(46))
	if is_on_floor() and (Input.is_action_just_released(right) or Input.is_action_just_released(left)):
		velocity.y = 0
	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true
	if !is_on_floor():
		snap = false
		pass
	pass




func _on_Area2D_body_entered(body):
	if(body.get_name() == "Player"):
		print("collided with PLaayer 1")
		get_tree().reload_current_scene()
		get_tree().change_scene("res://Assets/Scenes/Player2Wins.tscn")
		pass
	print(body)
	pass # Replace with function body.
