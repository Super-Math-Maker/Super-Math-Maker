extends Area2D
@onready var gm = get_node("/root/GameManager")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass	


func _on_body_entered(body):
	if body.name == "Player":
		gm.player.velocity.y = -1000
	pass # Replace with function body.
