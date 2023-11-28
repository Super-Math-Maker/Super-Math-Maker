extends Node

@onready var mainMenuScene = "res://Scenes/Menus/mainmenu.tscn"
@onready var pickQuestionTypeScene = "res://Scenes/Menus/pickquestiontype.tscn"
@onready var answerQuestionScene = "res://Scenes/Menus/AnswerQuestion.tscn"
@onready var levelEditorScene = "res://Scenes/Menus/LevelEditorScene.tscn"
@onready var pauseMenuScene = "res://Scenes/Menus/Pause Menu.tscn"

@onready var level1Scene = "res://Scenes/Level/Level1.tscn"
@onready var playerScene = "res://Scenes/Player.tscn"

#Note: do not changeState(pause), just call pause game and unpause game
enum gameState{
	STATE_NONE,
	STATE_MAIN_MENU,
	STATE_MENU_PICK_QUESTION,
	STATE_ANSWER_QUESTION,
	STATE_LEVEL_EDITOR,
	STATE_GAMEPLAY,
	STATE_PAUSE_MENU
}

var state = gameState.STATE_NONE
var currentMenuObj = null
var currentLevel = null
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	changeState(gameState.STATE_MAIN_MENU)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_A) and just_pressed:
		if ( state == gameState.STATE_GAMEPLAY ):
			pauseGame()
		else:
			unPauseGame()

func changeState(newState):
	if newState == state:
		print("Cant change state to same state: " + str(newState))
		return
	endState()
	beginState(newState)
		
func beginState(newstate):
	if newstate == gameState.STATE_MAIN_MENU:
		currentMenuObj = ImmediateLoadObject(mainMenuScene)
	elif newstate == gameState.STATE_MENU_PICK_QUESTION:
		currentMenuObj = ImmediateLoadObject(pickQuestionTypeScene)
	elif newstate == gameState.STATE_ANSWER_QUESTION:
		currentMenuObj = ImmediateLoadObject(answerQuestionScene)
	elif newstate== gameState.STATE_GAMEPLAY:
		_StartGame()
	elif newstate == gameState.STATE_LEVEL_EDITOR:
		_startLevelEditor()
	state = newstate
	
func endState():
	if (currentMenuObj):
		remove_child(currentMenuObj)
		currentMenuObj = null
	if state == gameState.STATE_MAIN_MENU:
		pass
	elif state == gameState.STATE_MENU_PICK_QUESTION:
		pass
	elif state == gameState.STATE_ANSWER_QUESTION:
		pass
	elif state == gameState.STATE_GAMEPLAY:
		print("TODO END GAME. FREE RESOURCES")
		pass
		
func _startLevelEditor():
	currentLevel = ImmediateLoadObject(level1Scene)
	currentMenuObj = ImmediateLoadObject(levelEditorScene)
	pass
	
func _StartGame():
	player = ImmediateLoadObject(playerScene)


func pauseGame():
	if state != gameState.STATE_GAMEPLAY:
		print("Cant pause unless gameplay state")
		return
	state = gameState.STATE_PAUSE_MENU
	currentMenuObj = ImmediateLoadObject(pauseMenuScene)
func unPauseGame():
	if state != gameState.STATE_PAUSE_MENU:
		print("Cant unpause unless pause state")
		return
		
	state = gameState.STATE_GAMEPLAY
	remove_child(currentMenuObj)
	pass

#Loads and adds child
func ImmediateLoadObject( path ):
	var scene = load(path)
	var obj = scene.instantiate()
	add_child(obj)
	return obj
