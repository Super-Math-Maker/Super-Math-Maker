extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered(body):
	if body.name == "Player":
		GameManager.nextLevel()
		# GameManager.beginState(GameManager.gameState.STATE_LEVEL_EDITOR)
		# GameManager.player.hitEnemy()
		# bounce off
		# var hitdir = (GameManager.player.position - position).normalized()
		# GameManager.player.velocity.y = -500
