extends Control
@onready var remaining_label = $VBoxContainer/HBoxContainer/Label
@onready var bgm = $AudioStreamPlayer2D
signal reset
@onready var label_2 = $VBoxContainer/HBoxContainer/PanelContainer/Label2

var is_stopped = true
var time_elapsed := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_stopped:
		time_elapsed += delta
		label_2.text = str(time_elapsed).pad_decimals(2)


func _on_button_pressed():
	reset.emit()
	time_elapsed = 0.0


func _on_audio_stream_player_2d_finished():
	bgm.play()
