extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var x = (int(get_viewport().get_mouse_position().x) / 16) * 16
	var y = (int(get_viewport().get_mouse_position().y) / 16) * 16
	self.global_position = Vector2(x, y)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("LEFT Mouse Click/Unclick at: ", self.position)
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			print("RIGHT Mouse Click/Unclick at: ", self.position)
	

