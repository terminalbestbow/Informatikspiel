extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	var height = randi_range(1, 6)
	var x_position = randi_range(0,1)
	var balls : Frogger_Enemy = load("res://Scenes/frogger_enemy.tscn").instantiate()
	
	var dir_name := "res://assets/frogger_gegner"
	var dir := DirAccess.open(dir_name)
	var file_names := dir.get_files()
	var randomindex = randi_range(0,2)
	var myImage : Image = Image.new()
	balls.sprite_2d.texture = myImage.load_svg_from_string(file_names[randomindex])
	
	add_child(balls)
	balls.position = Vector2(128 + 9, height * 16 + 8)
	balls.direction = balls.directions.LEFT
	#balls.my_speed = randf_range(1, 3)
