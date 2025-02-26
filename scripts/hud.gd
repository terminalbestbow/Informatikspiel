extends CanvasLayer
@onready var settings_button = $settings_button
@onready var car_bgm = $car_bgm

@onready var settings = $settings
@onready var ui = $Control
var next_level
var in_settings := false

#autorennen
@onready var crashscreen = $crashscreen
var cartime := 0.0
var car_paused := true
@onready var car_time_label = $car_timer/car_time
@onready var car_timer = $car_timer
var autorennen_active = false
@onready var crash_label = $crashscreen/PanelContainer/VBoxContainer/crash_label
var sokoban_active = false
var in_crash_screen := false

# Called when the node enters the scene tree for the first time.
func _ready():
	car_timer.hide()
	crashscreen.hide()
	ui.endscreen.hide()
	settings.hide()
	ui.hide()

func sokoban():
	ui.show()
	settings_button.show()
	sokoban_active = true

func autorennen():
	car_bgm.play()
	car_timer.show()
	autorennen_active = true
	car_paused = false
	crashscreen.hide()
	print(get_tree().current_scene)
	print(get_tree().current_scene is autorennen_level)
	settings_button.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if autorennen_active and !car_paused:
		cartime += delta
		car_time_label.text = str(cartime).pad_decimals(2)


func _on_control_reset():
	in_settings = true
	Global.level -=1
	ui.time_elapsed = Global.checkpoint_time
	next_lvl(true)
	_on_settings_button_pressed()


func _on_control_reset_all():
	in_settings = true
	Global.level = 0
	Global.checkpoint_time = 0.0
	next_lvl(true)
	ui.time_elapsed = 0.0
	_on_settings_button_pressed()

func next_lvl(reset):
	match Global.level:
			0:
				if !reset:
					Global.checkpoint_time += Hud.ui.time_elapsed - Global.checkpoint_time
				next_level = load("res://Scenes/sokoban_world.tscn").instantiate()
			1:
				if !reset:
					Global.checkpoint_time += Hud.ui.time_elapsed - Global.checkpoint_time
				next_level = load("res://Scenes/sokoban_lv_2.tscn").instantiate()
			2:
				if !reset:
					Global.checkpoint_time += Hud.ui.time_elapsed - Global.checkpoint_time
				next_level = load("res://Scenes/sokoban_lv_3.tscn").instantiate()
			3:
				if !reset:
					Global.checkpoint_time += Hud.ui.time_elapsed - Global.checkpoint_time
				next_level = load("res://Scenes/sokoban_lv_4.tscn").instantiate()
			4:
				if !reset:
					Global.checkpoint_time += Hud.ui.time_elapsed - Global.checkpoint_time
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


func _on_settings_button_pressed():
	if !in_crash_screen or sokoban_active:
		if in_settings:
			car_paused = true
			settings.hide()
			get_tree().paused = false
			in_settings = false
			if get_tree().current_scene is sokoban_level:
				ui.is_stopped = false
		else:
			car_paused = true
			ui.is_stopped = true
			settings.show()
			get_tree().paused = true
			in_settings = true


func _on_main_menu_button_pressed():
	in_crash_screen = false
	sokoban_active = false
	car_timer.hide()
	cartime = 0.0
	crashscreen.hide()
	get_tree().paused = false
	autorennen_active = false
	ui._on_main_menu_pressed()
	car_bgm.stop()


func _on_restart_car_pressed():
	in_crash_screen = false
	car_paused = false
	cartime = 0.0
	crashscreen.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func crashed():
	in_crash_screen = true
	get_tree().paused = true
	car_paused = true
	crash_label.text = "Du hast ganze " + str(cartime).pad_decimals(2) + "s keinen Unfall gebaut!"
	crashscreen.show()
