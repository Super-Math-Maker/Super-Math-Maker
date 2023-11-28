extends Node

@onready var gm = get_node("/root/GameManager")
@onready var playButton = $PlayButton
@onready var exitButton = $ExitButton

# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.pressed.connect(_playGame)
	exitButton.pressed.connect(_exit)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _playGame():
	gm.changeState(gm.gameState.STATE_MENU_PICK_QUESTION)
	pass
	
func _exit():
	get_tree().quit()
