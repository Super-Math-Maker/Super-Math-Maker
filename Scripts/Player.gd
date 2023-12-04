extends CharacterBody2D
@onready var gm = get_node("/root/GameManager")
@onready var camera = gm.camera

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var wallJumpsLeft = 3
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var area2d = $Area2D

func _ready():
	area2d.connect("area_entered",_hit)
	pass

func _hit():
	print("Collided: " + str(Time.get_datetime_string_from_system()))
	pass

func _physics_process(delta):
		
	if gm.state != gm.gameState.STATE_GAMEPLAY:
		return
	camera.reparent(self) #todo fix needing this here, should only have to call once
	
	#Decelerate
	velocity.x *= .55
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		wallJumpsLeft = 3
	
	var lastHit = get_last_slide_collision()

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		#Normal Jump
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		#Wall jump
		elif wallJumpsLeft > 0:
			var hits = get_slide_collision_count()
			if hits > 0:
				velocity.y = JUMP_VELOCITY
				velocity.x = get_last_slide_collision().get_normal().x * SPEED * 1
				wallJumpsLeft -= 1
	
	if direction:
		velocity.x += direction * SPEED
	else:
		velocity.x += move_toward(velocity.x, 0, SPEED)

	move_and_slide()
