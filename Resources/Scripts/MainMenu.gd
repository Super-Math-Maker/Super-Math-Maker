extends Node

@onready var playButton = %"Play Game Button"
@onready var exitButton = %"Exit Game Button"

# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.pressed.connect(_unimpl)
	exitButton.pressed.connect(_exit)
	pass # Replace with function body.

func _unimpl():
	print("Unimplemented")

func _exit():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
