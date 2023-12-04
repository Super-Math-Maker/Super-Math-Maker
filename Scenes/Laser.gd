extends Node2D

var dir = Vector2(0,0)
var lifeTime = 10.0

func setDirection(newDir):
	dir = newDir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lifeTime -= delta
	if lifeTime <= 0:
		get_parent().remove_child(self)
	pass
