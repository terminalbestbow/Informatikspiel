extends TextureRect

var is_visible = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_enabler_2d_screen_entered():
	var new_road = self.duplicate()
	new_road.position.y = position.y - 900
	get_parent().add_child(new_road)
	


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
