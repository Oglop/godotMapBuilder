extends Node2D

func _ready():
	var matrix = []
	for x in range(Global.SIZE_X):
		var row = []
		for y in range(Global.SIZE_Y):
			row.append({ 
					"type":0,
					"blocked": false,
					"mountain": false,
					"location": ""
				})
		matrix.append(row)
	Global.MAP = matrix
	
