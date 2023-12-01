extends Node
@onready var gm = get_node("/root/GameManager")
@onready var titleText = %Title
@onready var timeLeftText =  %"Time Left Text"
@onready var questionText = %"Question Text"
@onready var textBox = %TextBox

const MAX_ANSWER_TIME = 2
var timeLeft = 0.0
var currentQuestion = null

class Question:
	var problem: String
	var answer: String
	

# Called when the node enters the scene tree for the first time.
func _ready():
	timeLeft = MAX_ANSWER_TIME
	currentQuestion = _generateQuestion()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeLeft -= delta
	_updateUI()
	#currentQuestion = _generateQuestion()
	if ( timeLeft <= 0 ):
		gm.changeState(gm.gameState.STATE_LEVEL_EDITOR)
		
func _updateUI():
	timeLeftText.text = "Time Left: " + str(int(timeLeft))
	if ( currentQuestion != null):
		questionText.text = currentQuestion.problem

func _generateQuestion():
	if gm.qtype == gm.questionType.Q_FRACTION:
		return _generateFractionQuestion()	
	elif gm.qtype == gm.questionType.Q_GEOMETRY:
		return _generateGeometryQuestion()	
	elif gm.qtype == gm.questionType.Q_PREALG:
		return _generatePreAlgQuestion()	
	else:
		print("Cant create qtype")

func _generateFractionQuestion():
	var q = Question.new()
	
	var op = randi_range(0,1)

	var n1 = randi_range(1,10)
	var d1 = randi_range(1,10)
	
	var n2 = randi_range(1,10)
	var d2 = randi_range(1,10)
	
	#Multiply
	if op == 0:
		q.problem = str(n1) + "/" + str(d1) + " * " + str(n2) + "/" + str(d2)
		var n = n1 * n2
		var d = d1 * d2
		q.answer = str(n) + "/" + str(d)
	else:
		q.problem = str(n1) + "/" + str(d1) + " % " + str(n2) + "/" + str(d2)
		var n = n1 * d2
		var d = n2 * d1
		q.answer = str(n) + "/" + str(d)
	
	return q
	
func _generateGeometryQuestion():
	var q = Question.new()

	var i = randi_range(0,1)
	var div = 1 #easy way to divide tri area by 2
	#0 = rect
	#1 = triangle
	var shape = ""
	if i == 0:
		shape = "rectangle"
	else:
		shape = "triangle"
		div = 2
	
	var base = roundf(randf_range(1,16))
	var height = roundf(randf_range(3,16))
	
	q.problem = "Find the area of a " + str(shape) + "\n" + "Base: " + str(base) + "\nHeight: " + str(height)
	q.answer = str( (base * height) / div )
	return q
	
func _generatePreAlgQuestion():
	var q = Question.new()
	
	var x = roundf(randf_range(1,16)) 
	var y = roundf(randf_range(1,4))
	var z = roundf(randf_range(1,16))
	
	#Either do xx + yy = zz
	#or do     xx - yy = zz
	var op = randi_range(0,1)
	if op == 0:
		q.problem = "Solve for X: " + str(x) + " + " + str(y) + "x " + "= " + str(z)
		q.answer = str((z - x)/y)
	if op == 1:
		q.problem = "Solve for X: " + "-" + str(x) + " + " + str(y) + "x " + "= " + str(z)
		q.answer = str((z + x)/y)
	return q	
