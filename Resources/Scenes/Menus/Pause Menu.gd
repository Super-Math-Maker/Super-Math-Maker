extends Node2D

@onready var continueButton = %ContinueGame
@onready var settingsButton = %Settings
@onready var exitMenuButton = %"Exit to Menu"

@onready var gm = get_node("/root/GameManagerScene")

# Called when the node enters the scene tree for the first time.
func _ready():
	continueButton.pressed.connect(gm.killEscapeMenu)
	settingsButton.pressed.connect(_unimpl)
	exitMenuButton.pressed.connect(_unimpl)
	pass # Replace with function body.

func _unimpl():
	print("unimpl")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_viewport().get_camera_2d().get_screen_center_position() - Vector2(get_viewport().size/2)
	pass
