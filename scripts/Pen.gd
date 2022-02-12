extends Node2D

onready var tile = $Tile

func _startTimer() -> void:
	Global.DRAW_BLOCK_COUNTER = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func showTile() -> void:
	if Global.DRAW_VALUE != 0:
		tile.visible = true
		if Global.DRAW_VALUE == 1:
			tile.animation = "grass_green"
		elif Global.DRAW_VALUE == 2:
			tile.animation = "mountain"
	else:
		tile.visible = false
		

func _physics_process(delta):
	if Global.DRAW_BLOCK_COUNTER > 0:
		Global.DRAW_BLOCK_COUNTER -= 1
	var x = (int(get_viewport().get_mouse_position().x) / 16) * 16
	var y = (int(get_viewport().get_mouse_position().y) / 16) * 16
	self.global_position = Vector2(x, y)
	if Global.DRAW_BLOCK_COUNTER == 0:
		if (Input.is_action_just_pressed("INCREASE")):
			_startTimer()
			Global.DRAW_VALUE += 1
			print("INCREASE to ", Global.DRAW_VALUE )
		if (Input.is_action_just_pressed("DECREASE")):
			_startTimer()
			Global.DRAW_VALUE -= 1
			print("DECREASE to ", Global.DRAW_VALUE )
	showTile()

func _input(event):
	if event is InputEventMouseButton:
		var x = (int(get_viewport().get_mouse_position().x) / 16)
		var y = (int(get_viewport().get_mouse_position().y) / 16)
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("LEFT Mouse Click/Unclick at: ", self.global_position)
			Global.MAP[x][y].type = Global.DRAW_VALUE
			print("DRAW : ", Global.DRAW_VALUE, " x ", x, " y ", y)
			
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			print("RIGHT Mouse Click/Unclick at: ", self.global_position)
			Global.MAP[x][y].type = 0
			
	

func _on_Timer_timeout():
	pass
