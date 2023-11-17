extends Node

var levelEditor = null
var level = null
var game = null

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
	

	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
