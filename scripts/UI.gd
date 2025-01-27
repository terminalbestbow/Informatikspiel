extends Control
@onready var remaining_label = $VBoxContainer/HBoxContainer/Label
@onready var bgm = $AudioStreamPlayer2D
signal reset
# Called when the node enters the scene tree for the first time.
func _ready():
	bgm.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	reset.emit()
