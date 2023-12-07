extends Area2D

var offset = 0
var index = 0.0


var start = 224
var max = 224 + 32
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	index += delta * 20
	
	if index > 32:
		index -= 64
	
	var sprite = get_node("Sprite2D")
	var reg = sprite.get_region_rect()
	reg.position.x = index + start
	
	sprite.set_region_rect(reg)
	pass


func _on_body_entered(body):
	if body.name == "Player":
		GameManager.player.hitEnemy()
		
		#bounce off 		
		var hitdir = (GameManager.player.position - position).normalized()
		GameManager.player.velocity.y = -500
