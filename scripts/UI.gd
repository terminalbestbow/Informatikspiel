extends Control
@onready var remaining_label = $VBoxContainer/HBoxContainer2/PanelContainer2/Label
@onready var bgm = $AudioStreamPlayer2D
signal reset
signal reset_all
@onready var v_box_container = $VBoxContainer
@onready var label_2 = $VBoxContainer/HBoxContainer2/PanelContainer/Label2

# durchgespielt
@onready var endscreen = $endscreen
@onready var finished_label = $endscreen/finished_label
@onready var new_game = $endscreen/new_game
@onready var main_menu = $endscreen/main_menu

var is_stopped = true
var time_elapsed := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	endscreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_stopped:
		time_elapsed += delta
		label_2.text = str(time_elapsed).pad_decimals(2)


func _on_button_pressed():
	reset.emit()


func _on_audio_stream_player_2d_finished():
	bgm.play()


func _on_reset_all_pressed():
	reset_all.emit()

func game_finished(time):
	v_box_container.hide()
	finished_label.text = "Du hast alle Boxen in " + str(time).pad_decimals(2) + " Sekunden an den richtigen Ort gebracht!"
	endscreen.show()


func _on_new_game_pressed():
	endscreen.hide()
	_on_reset_all_pressed()


func _on_main_menu_pressed():
	time_elapsed = 0.0
	self.hide()
	if get_parent().in_settings:
		get_parent()._on_settings_button_pressed()
	bgm.stop()
	var next_level = load("res://Scenes/mainmenu.tscn").instantiate()
	get_tree().get_root().add_child(next_level)
	get_tree().current_scene = next_level
	get_tree().reload_current_scene()
	get_tree().get_root().get_children()[2].free()
