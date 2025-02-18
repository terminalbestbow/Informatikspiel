extends CharacterBody2D
class_name car_player
@onready var move_timer = $Timer

var tween
var moving := false
enum lanes{LEFT, CENTER, RIGHT}
var current_lane
var buffer := "nothing"

func _ready():
	current_lane = lanes.CENTER

func _process(delta):
	if Input.is_action_just_pressed("right"):
		if !moving and current_lane != lanes.RIGHT:
			match current_lane:
				lanes.CENTER:
					current_lane = lanes.RIGHT
				lanes.LEFT:
					current_lane = lanes.CENTER
			tween = get_tree().create_tween()
			tween.tween_property(self, "position", Vector2(position.x+17, position.y), 0.2)
			moving = true
			move_timer.start()
			print(current_lane)
		else:
			if moving:
				buffer = "right"
	if Input.is_action_just_pressed("left"):
		if !moving and current_lane != lanes.LEFT:
			match current_lane:
				lanes.CENTER:
					current_lane = lanes.LEFT
				lanes.RIGHT:
					current_lane = lanes.CENTER
			tween = get_tree().create_tween()
			tween.tween_property(self, "position", Vector2(position.x-17, position.y), 0.2)
			moving = true
			move_timer.start()
			print(current_lane)
		else:
			if moving:
				buffer = "left"



func _on_timer_timeout():
	if buffer != "nothing":
		match buffer:
			"right":
				if current_lane != lanes.RIGHT:
					match current_lane:
						lanes.CENTER:
							current_lane = lanes.RIGHT
						lanes.LEFT:
							current_lane = lanes.CENTER
					tween = get_tree().create_tween()
					tween.tween_property(self, "position", Vector2(position.x+17, position.y), 0.2)
					moving = true
					move_timer.start()
			"left":
				if current_lane != lanes.LEFT:
					match current_lane:
						lanes.CENTER:
							current_lane = lanes.LEFT
						lanes.RIGHT:
							current_lane = lanes.CENTER
					tween = get_tree().create_tween()
					tween.tween_property(self, "position", Vector2(position.x-17, position.y), 0.2)
					moving = true
					move_timer.start()
		buffer = "nothing"
	else:
		moving = false
