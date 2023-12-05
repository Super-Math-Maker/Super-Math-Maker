extends Node
@onready var gm = get_node("/root/GameManager")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if gm.state != gm.gameState.STATE_GAMEPLAY:
		return
	if body.name == "Player":
		gm.player.addAmmo(5)
	queue_free()
