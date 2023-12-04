extends CharacterBody2D

@onready var gm = get_node("/root/GameManager")

var shouldWalkOffEdges = true
var health = 1
var walkSpeed = 100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var direction = -1 #-1 = left 1 = right (just mult velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _test():
	print("enemy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gm.state != gm.gameState.STATE_GAMEPLAY:
		return

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = walkSpeed * direction
	
	move_and_slide()
