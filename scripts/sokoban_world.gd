extends Node2D
class_name sokoban_level

@onready var player = $Player
var next_level
@onready var texture_rect = $TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	texture_rect.z_index = -5
	print(Global.level)
	match Global.level:
		1:
			Global.set_boxes_remaining(3) #3
			Hud.ui.is_stopped = false
			Hud.ui.bgm.play()
		2:
			Global.set_boxes_remaining(3) #3
		3:
			Global.set_boxes_remaining(6) #6
		4:
			Global.set_boxes_remaining(7) #7
		5:
			Global.set_boxes_remaining(14) #14


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Hud.ui.remaining_label.text = " Verbleibende Boxen: " + str(Global.boxes_remaining)
	if Global.boxes_remaining == 0:
		Hud.next_lvl(false)

func get_player():
	return player
