extends Node2D
@onready var player = $Player
var next_level

# Called when the node enters the scene tree for the first time.
func _ready():
	print(Global.level)
	match Global.level:
		1:
			Global.set_boxes_remaining(1) #3
			Hud.ui.is_stopped = false
			Hud.ui.bgm.play()
		2:
			Global.set_boxes_remaining(1) #3
		3:
			Global.set_boxes_remaining(1) #6
		4:
			Global.set_boxes_remaining(1) #7
		5:
			Global.set_boxes_remaining(1) #14


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Hud.ui.remaining_label.text = " Boxes remaining: " + str(Global.boxes_remaining)
	if Global.boxes_remaining == 0:
		match Global.level:
			1:
				next_level = load("res://Scenes/sokoban_lv_2.tscn").instantiate()
			2:
				next_level = load("res://Scenes/sokoban_lv_3.tscn").instantiate()
			3:
				next_level = load("res://Scenes/sokoban_lv_4.tscn").instantiate()
			4:
				next_level = load("res://Scenes/sokoban_lv_5.tscn").instantiate()
			5:
				Hud.ui.bgm.stop()
				Hud.ui.is_stopped = true
		Global.level += 1
		get_tree().get_root().add_child(next_level)
		get_tree().current_scene = next_level
		get_tree().reload_current_scene()
		get_tree().get_root().get_children()[2].free()
		


func get_player():
	return player
