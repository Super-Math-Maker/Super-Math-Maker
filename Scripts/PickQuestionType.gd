extends Node

@onready var gm = get_node("/root/GameManager")

@onready var fracButton = %FractionsButton
@onready var geoButton = %GeometryButton
@onready var algButton = %PreAlgebraButton

# Called when the node enters the scene tree for the first time.
func _ready():
	fracButton.pressed.connect(_choseFrac)
	geoButton.pressed.connect(_choseGeo)
	algButton.pressed.connect(_choseAlg)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _choseFrac():
	_picked()
func _choseGeo():
	_picked()
func _choseAlg():
	_picked()

func _picked():
	print("Picked")
	gm.changeState(gm.gameState.STATE_ANSWER_QUESTION)
	pass
	
