extends CharacterBody2D
@onready var gm = get_node("/root/GameManager")
@export var direction : float = 1
const MAX_PAUSE_TIME = 1
var pauseTime =0 

enum enemyState{
	STATE_NORMAL,
	STATE_CHASE
}

var target : Vector2 = Vector2(0,0)
var state : enemyState = enemyState.STATE_NORMAL
var speed = 250
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if gm.state != gm.gameState.STATE_GAMEPLAY:
		return
	#make sure on screen
	var distance = abs( GameManager.player.position.x - position.x )
	#player is centered
	
	#Bat stops after hitting target for a second
	if pauseTime > 0:
		pauseTime -= delta
		return
	
	if distance > 720:
		return
	
	if state == enemyState.STATE_NORMAL:
		#change direction if hit wall
		var other = get_last_slide_collision()
		if other != null:
			direction = -direction
		
		#look for player
		var levelSpace = get_world_2d().space
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsRayQueryParameters2D.create(position, GameManager.player.position)
		var result = space_state.intersect_ray(query)
		if result != null:
			if result.collider != null:
				if result.collider.name == "Player":
					state = enemyState.STATE_CHASE
					target = GameManager.player.position
					return
			
		#Move
		velocity = Vector2(direction * speed, 0)
		move_and_slide()
		pass
		
	elif state == enemyState.STATE_CHASE:
		var deltaToPlayer : Vector2 = (target - position)
		if position.distance_to(target) < 10 :
			state = enemyState.STATE_NORMAL
			pauseTime = MAX_PAUSE_TIME
		
		velocity = deltaToPlayer.normalized() * speed
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		GameManager.player.hitEnemy()
	pass # Replace with function body.
