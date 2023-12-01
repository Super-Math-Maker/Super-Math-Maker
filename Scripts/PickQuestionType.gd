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
	gm.qtype = gm.questionType.Q_FRACTION
	_picked()
func _choseGeo():
	gm.qtype = gm.questionType.Q_GEOMETRY
	_picked()
func _choseAlg():
	gm.qtype = gm.questionType.Q_PREALG
	_picked()

func _picked():
	gm.changeState(gm.gameState.STATE_ANSWER_QUESTION)
	pass
	
