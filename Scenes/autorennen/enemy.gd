extends Area2D
class_name enemy_car
var was_visible := false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += Global.enemy_car_speed


func _on_visible_on_screen_enabler_2d_screen_exited():
	if was_visible:
		queue_free()


func _on_visible_on_screen_enabler_2d_screen_entered():
	was_visible = true


func _on_body_entered(body):
	Hud.crashed()
