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
		queue_free()
	pass


func _on_body_entered(body):
	print(body.name)
	if body.name.find("Jumper") != -1:
		body.queue_free()
		queue_free()


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var name = area.owner.name
	if name.find("Jumper") != -1 or name.find("Flyer") != -1 or name.find("Walker") != -1:
		area.owner.queue_free()
		queue_free()
