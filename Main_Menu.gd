extends Control
@onready var bgm = $bgm


# Called when the node enters the scene tree for the first time.
func _ready():
	Hud.hide()
	bgm.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Hud.ui.endscreen.hide()
	var next_level = load("res://Scenes/sokoban_world.tscn").instantiate()
	get_tree().get_root().add_child(next_level)
	get_tree().current_scene = next_level
	get_tree().reload_current_scene()
	get_tree().get_root().get_children()[2].queue_free()
	bgm.stop()
	Hud.show()


func _on_button_2_pressed():
	var next_level = load("res://Scenes/autorennen/autorennen.tscn").instantiate()
	get_tree().get_root().add_child(next_level)
	get_tree().current_scene = next_level
	get_tree().reload_current_scene()
	get_tree().get_root().get_children()[2].queue_free()
	bgm.stop()
