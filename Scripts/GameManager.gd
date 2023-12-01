extends Node

@onready var mainMenuScene = "res://Scenes/Menus/mainmenu.tscn"
@onready var pickQuestionTypeScene = "res://Scenes/Menus/pickquestiontype.tscn"
@onready var answerQuestionScene = "res://Scenes/Menus/AnswerQuestion.tscn"
@onready var levelEditorScene = "res://Scenes/Menus/LevelEditorScene.tscn"
@onready var pauseMenuScene = "res://Scenes/Menus/Pause Menu.tscn"

@onready var level1Scene = "res://Scenes/Level/Level1.tscn"
@onready var playerScene = "res://Scenes/Player.tscn"
@onready var camera = $Camera2D

#Note: do not call changeState(pause), just call pause game and unpause game
#Note: For rest of states call changeState(state)
enum gameState{
	STATE_NONE,
	STATE_MAIN_MENU,
	STATE_MENU_PICK_QUESTION,
	STATE_ANSWER_QUESTION,
	STATE_LEVEL_EDITOR,
	STATE_GAMEPLAY,
	STATE_PAUSE_MENU
}

enum questionType{
	Q_NONE,
	Q_FRACTION,
	Q_GEOMETRY,
	Q_PREALG
};

var state = gameState.STATE_NONE
var currentMenuObj = null
var currentLevel = null
var player = null
var qtype = questionType.Q_NONE
var money = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	changeState(gameState.STATE_MAIN_MENU)
	pass # Replace with function body.

#Maybe this should be in the editor class but may be neater to keep here
func _process(delta):
	if state == gameState.STATE_LEVEL_EDITOR:
		var directionx = Input.get_axis("ui_left", "ui_right")
		var directiony = Input.get_axis("ui_up", "ui_down")
		var CAM_SPEED = 500
		camera.position += Vector2(directionx,directiony) * CAM_SPEED * delta		
		
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
		currentMenuObj = ImmediateLoadObject(mainMenuScene,camera)
	elif newstate == gameState.STATE_MENU_PICK_QUESTION:
		currentMenuObj = ImmediateLoadObject(pickQuestionTypeScene,camera)
	elif newstate == gameState.STATE_ANSWER_QUESTION:
		currentMenuObj = ImmediateLoadObject(answerQuestionScene,camera)
	elif newstate== gameState.STATE_GAMEPLAY:
		_StartGame()
	elif newstate == gameState.STATE_LEVEL_EDITOR:
		_startLevelEditor()
		player = currentLevel.get_node("Player")
		camera.position = player.position
	state = newstate
	
func endState():
	if (currentMenuObj):
		camera.remove_child(currentMenuObj)
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
	currentLevel = ImmediateLoadObject(level1Scene, self)
	currentMenuObj = ImmediateLoadObject(levelEditorScene,camera)
	pass
	
func _StartGame():
		camera.reparent(player)
		camera.position = Vector2(0,0)
		
func pauseGame():
	if state != gameState.STATE_GAMEPLAY:
		print("Cant pause unless gameplay state")
		return
	state = gameState.STATE_PAUSE_MENU
	currentMenuObj = ImmediateLoadObject(pauseMenuScene,camera)

func unPauseGame():
	if state != gameState.STATE_PAUSE_MENU:
		print("Cant unpause unless pause state")
		return
		
	state = gameState.STATE_GAMEPLAY
	camera.remove_child(currentMenuObj)
	pass

#Loads and adds child
func ImmediateLoadObject( path, parent ):
	var scene = load(path)
	var obj = scene.instantiate()
	parent.add_child(obj)
	
	#Menu objects need an offset of the screenSize/2
	if parent == camera:
		obj.position = Vector2(-640,-360)
	return obj
