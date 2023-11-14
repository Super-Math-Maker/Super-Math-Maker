extends Node2D

#note: will have to get a second answer label for fractions 
@onready var questionLabel = $AnswerCanvas/Question
@onready var answerBox =  $AnswerCanvas/Question
@onready var timeLabel =  $AnswerCanvas/TimeLeft

var time = 0.0
var MAX_TIME = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	time = MAX_TIME
	_setTimeLabel()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ( Input.is_action_just_pressed("ui_accept") ):
		answerBox.clear()
	
	time -= delta
	_setTimeLabel()
	
	if ( time <= 0.0 ):
		get_tree().change_scene_to_file("res://Resources/Scenes/Game.tscn")
	
func _setTimeLabel():
	var t = int(time)
	timeLabel.text = str(t)
		
