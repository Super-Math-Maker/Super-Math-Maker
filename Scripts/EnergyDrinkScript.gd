extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if GameManager.state != GameManager.gameState.STATE_GAMEPLAY:
		return
	
	if body.name == "Player":
		GameManager.player.addEnergy()
		queue_free()
