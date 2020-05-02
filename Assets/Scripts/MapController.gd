extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var edge = 0
var load_distance = 200

var scenes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var files = list_files_in_directory("res://Assets/MapSections/")
	print(files.size())
	for f in files:
		var file = load(f)
		scenes.push_back(file)	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	
	if global_position.x > edge - load_distance:
		generate_section(scenes[randi() % scenes.size()])

func generate_section(var scene):
	var section = scene.instance()
	section.position.x = edge
	var width = 0
	var cell_size = 0
	for child in section.get_children():
		if child is TileMap:
			var w = calculate_bounds(child)
			if w > width:
				width = w
				cell_size = child.cell_size.x
	edge += (width + 1 ) *  cell_size
	get_tree().root.add_child(section)

func calculate_bounds(tilemap):
	var used_cells = tilemap.get_used_cells()
	var max_x = 0
	for pos in used_cells:
		if pos.x > max_x:
			max_x = int(pos.x)
	return max_x

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(path + file)

	dir.list_dir_end()

	return files
