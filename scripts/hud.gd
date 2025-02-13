extends CanvasLayer

@onready var ui = $Control
var next_level

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_reset():
	ui.time_elapsed = Global.checkpoint_time
	get_tree().reload_current_scene()


func _on_control_reset_all():
	Global.level = 0
	next_lvl()
	ui.time_elapsed = 0.0

func next_lvl():
	match Global.level:
			0:
				Global.checkpoint_time += Hud.ui.time_elapsed
				next_level = load("res://Scenes/sokoban_world.tscn").instantiate()
			1:
				Global.checkpoint_time += Hud.ui.time_elapsed
				next_level = load("res://Scenes/sokoban_lv_2.tscn").instantiate()
			2:
				Global.checkpoint_time += Hud.ui.time_elapsed
				next_level = load("res://Scenes/sokoban_lv_3.tscn").instantiate()
			3:
				Global.checkpoint_time += Hud.ui.time_elapsed
				next_level = load("res://Scenes/sokoban_lv_4.tscn").instantiate()
			4:
				Global.checkpoint_time += Hud.ui.time_elapsed
				next_level = load("res://Scenes/sokoban_lv_5.tscn").instantiate()
			5:
				Hud.ui.is_stopped = true
				ui.game_finished(Global.checkpoint_time + ui.time_elapsed)
				get_tree().current_scene.get_child(3).hide()
				get_tree().current_scene.get_child(4).hide()
				for i in get_tree().current_scene.get_child(1).get_children():
					i.hide()
				for i in get_tree().current_scene.get_child(2).get_children():
					i.hide()
				return
	Global.level += 1
	get_tree().get_root().add_child(next_level)
	get_tree().current_scene = next_level
	get_tree().reload_current_scene()
	get_tree().get_root().get_children()[2].free()
