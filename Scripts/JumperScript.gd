extends CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_parent().speed = 100
	if abs(GameManager.player.position.x - get_parent().position.x) < 256:
		var v = (GameManager.player.position.y - get_parent().position.y)
		if v < -10:
			get_parent().velocity.y = -400
