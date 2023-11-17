extends Node2D

@onready var continueButton = %ContinueGame
@onready var settingsButton = %Settings
@onready var exitMenuButton = %"Exit to Menu"



# Called when the node enters the scene tree for the first time.
func _ready():
	continueButton.pressed.connect(_unimpl)
	settingsButton.pressed.connect(_unimpl)
	exitMenuButton.pressed.connect(_unimpl)
	pass # Replace with function body.

func _unimpl():
	print("unimpl")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
