extends Node

var levelEditor = null
var level = null
var game = null
var pauseMenu = null

enum gameState {
	STATE_MENU,
	STATE_LEVEL_EDITOR,
	STATE_GAMEPLAY,
	STATE_PAUSED
};

func getState():
	return state

var state = gameState.STATE_LEVEL_EDITOR
var currentLevel = 1
var levelNode = null 
var escapeMenu = null
#Table for Paths.

# Increments Level then loads it. Levels must be named level#.tscn in the level folder
func _loadLevel(node):
	var levelpath = "res://Resources/Scenes/Levels/level" + str(currentLevel) + ".tscn"
	var inst = load(levelpath)
	level = inst.instantiate()
	add_child(level)
	
func _initLevelEditor(node):
	_loadLevel(node)
	var lvlEditor = load("res://Resources/Scenes/Menus/LevelEditorScene.tscn")
	levelEditor = lvlEditor.instantiate()
	node.add_child(levelEditor)
	pass
	
func _startGame():
	remove_child(levelEditor)
	game._startGame()
	
func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_ESCAPE) and just_pressed:
		if escapeMenu == null:
			var escape = load("res://Resources/Scenes/Menus/Pause Menu.tscn")
			escapeMenu = escape.instantiate()
			add_child(escapeMenu)
		else:
			killEscapeMenu()

func killEscapeMenu():
	remove_child(escapeMenu)
	escapeMenu = null	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
