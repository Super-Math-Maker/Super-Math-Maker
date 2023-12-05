extends Node2D

class AssistButton:
	var label : Label
	var name : String
	var price : int

@onready var gm = get_node("/root/GameManager")
@onready var itemButtons = [$Spring, $Item2, $Item3, $Item4, $Item5, $Item6]
@onready var prices =      [    5  ,     5 ,    5  ,    5  ,    5  ,     5]
@onready var playButton = $"Play Game"
@onready var moneyLabel = $"Money Label"
@onready var springScene = "res://Scenes/Assists/SpringScene.tscn"
@onready var lasergunScene = "res://Scenes/Assists/LasergunScene.tscn"
var holdingItem = null


var buttons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	holdingItem = null
	playButton.pressed.connect(_playGame)
	itemButtons[0].pressed.connect(_buySpring)
	itemButtons[0].text = "Buy Spring: " + str(prices[0])
	itemButtons[1].pressed.connect(_buyLasergun)
	itemButtons[1].text = "Buy Lasergun: " + str(prices[1])
	
	pass # Replace with function body.

func _playGame():
	gm.changeState(gm.gameState.STATE_GAMEPLAY)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moneyLabel.text = "Money: " + str(GameManager.money)
	if holdingItem == null:
		return

	#Snap to the 64x64 grid
	var mp = get_local_mouse_position()
	mp.x = int(mp.x) / int(32)
	mp.y = int(mp.y) / int(32)
	mp.x *= 32
	mp.y *= 32
	mp.y -= 16 #Offset sprite center so ground touches bottom 
	holdingItem.position = mp
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		holdingItem.reparent(gm)
		gm.placedAssists.append(holdingItem)
		holdingItem = null
		pass
	
	#Right mouse cancels
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		remove_child(holdingItem)	
		holdingItem = null
		pass
		
	
			
func _buySpring():
	if (gm.money < prices[0]):
		print("Can't afford Spring")
		return
	GameManager.money -= prices[0]
	holdingItem = gm.ImmediateLoadObject(springScene,self)
	
func _buyLasergun():
	if (gm.money < prices[1]):
		print("Can't afford Lasergun")
	GameManager.money -= prices[1]
	holdingItem = gm.ImmediateLoadObject(lasergunScene,self)
	
