extends Node2D
@onready var gm = get_node("/root/GameManager")

var dir = Vector2(0,0)
var lifeTime = 10 

func setDirection(newDir):
	dir = newDir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gm.state != gm.gameState.STATE_GAMEPLAY:
		return
	position += Vector2(dir * delta * 1000,0)
	
	#auto delete
	lifeTime -= delta
	if lifeTime <= 0:
		free()
	pass


func _on_body_entered(body):
	if (body.name.find("Walker") != -1) or ( body.name.find("Flyer") != -1 ):
		body.queue_free()
		queue_free()
