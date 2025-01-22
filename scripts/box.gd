class_name Box
extends Area2D

@onready var raycast = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_tree().current_scene.get_player()
	match player.facing:
		Global.directions.LEFT:
			raycast.target_position = Vector2(-16, 0)
		Global.directions.RIGHT:
			raycast.target_position = Vector2(16, 0)
		Global.directions.DOWN:
			raycast.target_position = Vector2(0, 16)
		Global.directions.UP:
			raycast.target_position = Vector2(0, -16)


func _on_body_entered(body):
		match body.facing:
			Global.directions.LEFT:
				if !raycast.is_colliding():
					global_position.x -= 16
				else: 
					body.global_position.x += 16
			Global.directions.RIGHT:
				if !raycast.is_colliding():
					global_position.x += 16
				else: 
						body.global_position.x -= 16
			Global.directions.UP:
				if !raycast.is_colliding():
					global_position.y -= 16
				else:
					body.global_position.y += 16
			Global.directions.DOWN:
				if !raycast.is_colliding():
					global_position.y += 16
				else: 
					body.global_position.y -= 16
		
