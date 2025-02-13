class_name Wall
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area is Box:
		var player : Player = get_tree().get_player()
		pass


func _on_body_entered(body):
		if body is Player:
			match body.facing:
				Global.directions.LEFT:
					body.global_position.x += 16
				Global.directions.RIGHT:
					body.global_position.x -= 16
				Global.directions.UP:
					body.global_position.y += 16
				Global.directions.DOWN:
					body.global_position.y -= 16
