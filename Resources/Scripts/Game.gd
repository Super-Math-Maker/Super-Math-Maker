extends Node2D
@onready var gm = get_node("/root/GameManagerScene")
@onready var cam = %Camera
@onready var player = null

func _ready():
	_setGame()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ( Input.is_key_pressed(KEY_T)):
		cam.position = Vector2(0,0)
		pass
	
	#hack to tell gamemanger this is the game scene
func _setGame():
	gm.game = self
	pass

func _startGame():
	var pobj =  load("res://Resources/Scenes/player.tscn")
	player = pobj.instantiate()
	add_child(player)
	
	cam.position = Vector2(0,0)
	cam.reparent((player))
	
	pass
