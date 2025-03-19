class_name Frogger_Enemy
extends Node2D

enum directions {LEFT, RIGHT}
var direction : directions
@onready var my_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match direction:
		directions.LEFT:
			position.x -= Global.frogger_enemy_speed * my_speed * delta
		directions.RIGHT:
			position.x += Global.frogger_enemy_speed * delta
