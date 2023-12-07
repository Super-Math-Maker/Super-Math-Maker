extends CharacterBody2D

var direction = -1.0
var speed = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.state != GameManager.gameState.STATE_GAMEPLAY:
		return
	#make sure on screen
	var distance = abs( GameManager.player.position.x - position.x )
	#player is centered
	
	if distance > 720:
		return
	
	var other = get_last_slide_collision()
	if other != null and get_floor_normal().x != 0:
		direction = -direction
	
	velocity.x = direction * speed
	
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	move_and_slide()
		


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		GameManager.player.hitEnemy()
