extends Node2D

enum lanes{LEFT, CENTER, RIGHT}
# Called when the node enters the scene tree for the first time.
func _ready():
	Hud.settings_button.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_wave():
	var enemies_number = randi_range(1, 2)
	
	var dir_name := "res://Scenes/autorennen/enemies/"
	var dir := DirAccess.open(dir_name)
	var file_names := dir.get_files()
	var random_file = load((dir_name + file_names[randi_range(0, file_names.size() - 1)]).trim_suffix(".remap")).instantiate()
	match enemies_number:
		1:
			var spawn_lane = lanes.values().pick_random()
			match spawn_lane:
				lanes.LEFT:
					random_file.global_position.x += 9
				lanes.CENTER:
					random_file.global_position.x += 26
				lanes.RIGHT:
					random_file.global_position.x += 43
			add_child(random_file)

func _on_timer_timeout():
	spawn_wave()
