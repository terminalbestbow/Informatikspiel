extends Node

# sokoban
var level = 5
var boxes_remaining = 0
enum directions {UP, DOWN, LEFT, RIGHT}
var checkpoint_time := 0.0

#autorennen
var scroll_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_boxes_remaining(number):
	boxes_remaining = 0
	boxes_remaining = number
