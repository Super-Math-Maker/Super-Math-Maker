extends Node
@onready var gm = get_node("/root/GameManager")
@onready var titleText = %Title
@onready var timeLeftText =  %"Time Left Text"
@onready var questionText = %"Question Text"
@onready var textBox = %TextBox

const MAX_ANSWER_TIME = 0
var timeLeft = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	timeLeft = MAX_ANSWER_TIME
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeLeft -= delta
	_updateUI()
	
	if ( timeLeft <= 0 ):
		gm.changeState(gm.gameState.STATE_LEVEL_EDITOR)
		
func _updateUI():
	timeLeftText.text = "Time Left: " + str(int(timeLeft))
