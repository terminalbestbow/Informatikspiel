extends Area2D

var filled : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area is Box:
		print("entered!")
		filled = true
		Global.boxes_remaining -= 1


func _on_area_exited(area):
	if area is Box:
		filled = false
		Global.boxes_remaining += 1
