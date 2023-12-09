extends Node
@onready var gm = get_node("/root/GameManager")
@onready var titleText = %Title
@onready var timeLeftText =  %"Time Left Text"
@onready var questionText = %"Question Text"
@onready var textBox = %TextBox
@onready var correctText = %CorrectLabel
@onready var incorrectText = %"Incorrect Label"
@onready var moneyText = %"MoneyLabel"

const MAX_ANSWER_TIME = 5
var timeLeft = 10.0
var currentQuestion = null
var correct = 0
var incorrect = 0


class Question:
	var problem: String
	var answer: String
	

# Called when the node enters the scene tree for the first time.
func _ready():
	timeLeft = MAX_ANSWER_TIME
	currentQuestion = _generateQuestion()
	correct =0 
	incorrect = 0
	pass # Replace with function body.

func _checkAnswer():
	var yours = textBox.text.strip_edges(true,true)
	var ansr = currentQuestion.answer.strip_edges(true,true)
	if gm.qtype == gm.questionType.Q_FRACTION:
		ansr = float(ansr)
		var yourAns = yours.split("/")
		if yourAns.size() != 2:
			print("incorrect format")
			return false
		var yourNum = int(yourAns[0])
		var yourDen = int(yourAns[1])
		yourAns = float(yourNum) / yourDen
		# print("yours: ", yourAns, "ans: ", ansr)
		return abs(yourAns - ansr) <= .001
	return yours == ansr

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Check for enter in text box
	if ( Input.is_action_just_pressed("ui_text_newline")):
		if _checkAnswer() == true:
			print("Correct")
			correct += 1
			gm.money += 5
		else:
			incorrect +=1 
			print("Incorrect")
		
		textBox.text = ""
		currentQuestion = _generateQuestion()
		
	timeLeft -= delta
	_updateUI()
	#currentQuestion = _generateQuestion()
	if ( timeLeft <= 0 ):
		gm.changeState(gm.gameState.STATE_LEVEL_EDITOR)
		
func _updateUI():
	timeLeftText.text = "Time Left: " + str(int(timeLeft))
	if ( currentQuestion != null):
		questionText.text = currentQuestion.problem
		
	correctText.text = "Correct:   " + str(correct)
	incorrectText.text =   "Incorrect: " + str(incorrect)
	moneyText.text =       "Money:     " + str(gm.money)

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
		q.answer = str(float(n) / d)
	else:
		q.problem = str(n1) + "/" + str(d1) + " / " + str(n2) + "/" + str(d2)
		var n = n1 * d2
		var d = n2 * d1
		q.answer = str(float(n) / d)
	
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
	
	#Y should always be even to make divisions simpler
	if int(y) % 2 != 0:
		y+=1
	
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
