extends Node
@onready var doneButton = %"Done Button"
@onready var gm = get_node("/root/GameManagerScene")

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Init Level Editor()")
	doneButton.pressed.connect(_startGame)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_viewport().get_camera_2d().get_screen_center_position()
	_mouseMovement(delta)
	# This keeps UI to the side, gets World space position of cam and sets node's to it.
	# Note: should work if resized 

func _startGame():
	print("Start")
	gm._startGame()
	pass

func _mouseMovement(delta):
	
	var cam = get_viewport().get_camera_2d()
	
	var pxToEdge = 75
	var moveSpeed = 500
	# Mouse at edge of screen will move in that direction
	var mp = get_window().get_mouse_position()
	var screenSize = get_window().size
	
	#Right
	if ( mp.x > screenSize.x - pxToEdge ):
		cam.position += Vector2(moveSpeed * delta, 0)
	
	#Left
	if ( mp.x < pxToEdge ):
		cam.position += Vector2(-moveSpeed * delta, 0)
	
	#Bottom
	if ( mp.y > screenSize.y - pxToEdge ):
		cam.position += Vector2(0,moveSpeed * delta)
	
	#Top
	if ( mp.y < pxToEdge ):
		cam.position += Vector2(0, -moveSpeed * delta)
	
