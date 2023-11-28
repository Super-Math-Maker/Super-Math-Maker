extends Node2D

@onready var gm = get_node("/root/GameManager")
@onready var itemButtons = [$Item1, $Item2, $Item3, $Item4, $Item5, $Item6]
@onready var playButton = $"Play Game"
# Called when the node enters the scene tree for the first time.
func _ready():
	playButton.pressed.connect(_playGame)
	pass # Replace with function body.

func _playGame():
	gm.changeState(gm.gameState.STATE_GAMEPLAY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
