extends RigidBody2D
@onready var gm = get_node("/root/GameManager")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("SPRING")
	connect("body_entered",_shootPlayer)
	connect("body_shape_entered",_shootPlayer)
	
	pass # Replace with function body.

func _shootPlayer():
	print("Hit Player")
	#gm.player.velocity.y = -1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
