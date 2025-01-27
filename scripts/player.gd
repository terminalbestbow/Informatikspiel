class_name Player
extends CharacterBody2D

@onready var blocked = $blocked
@onready var move = $move


@onready var raycast = $RayCast2D
var direction = Vector2.ZERO

var facing = Global.directions.RIGHT

func _physics_process(delta):

	if direction and !raycast.is_colliding():
		global_position += direction * 16
		move.play()
	if raycast.is_colliding() and direction:
		blocked.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Vector2.ZERO
	if Input.is_action_just_pressed("left"):
		direction = Vector2(-1,0)
		facing = Global.directions.LEFT
		raycast.target_position = Vector2(-16, 0)
	if Input.is_action_just_pressed("right"):
		direction = Vector2(1,0)
		facing = Global.directions.RIGHT
		raycast.target_position = Vector2(16, 0)
	if Input.is_action_just_pressed("up"):
		direction = Vector2(0,-1)
		facing = Global.directions.UP
		raycast.target_position = Vector2(0, -16)
	if Input.is_action_just_pressed("down"):
		direction = Vector2(0,1)
		facing = Global.directions.DOWN
		raycast.target_position = Vector2(0, 16)

func on_box_blocked():
	print("blocked!")
	blocked.play()
