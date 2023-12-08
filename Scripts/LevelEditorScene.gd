extends Node2D

class AssistButton:
	var label : Label
	var name : String
	var price : int

@onready var gm = get_node("/root/GameManager")
@onready var itemButtons = [$Spring, $Item2, $Item3, $Item4, $Item5, $Item6]
@onready var prices =      [    5  ,     5 ,    15  ,    25  ,    5  ,     5]
@onready var playButton = $"Play Game"
@onready var moneyLabel = $"Money Label"
@onready var springScene = "res://Scenes/Assists/SpringScene.tscn"
@onready var lasergunScene = "res://Scenes/Assists/LasergunScene.tscn"
@onready var springBootsScene = "res://Scenes/Assists/SpringShoesScene.tscn"
@onready var platformScene = "res://Scenes/Assists/PlatformScene.tscn"
@onready var energyDrinkScene =  "res://Scenes/Assists/EnergyDrinkScene.tscn"
var holdingItem = null


var names = ["Spring","Lasergun","Extra Life","Spring Shoes","Platform","Energy Drink"]

# NOTE TO DALY: Godot as of this version does not allow you to pass paramters
# when you connect buttons to events. as such each button connection has to
# be a seperate function that does almost the same thing. 
func _ready():

	holdingItem = null
	playButton.pressed.connect(_playGame)
	itemButtons[0].pressed.connect(_buySpring)
	itemButtons[1].pressed.connect(_buyLasergun)
	itemButtons[2].pressed.connect(_buyLife)
	itemButtons[3].pressed.connect(_buySpringShoes)
	itemButtons[4].pressed.connect(_buyPlatform)
	itemButtons[5].pressed.connect(_buyEnergyDrink)

	for i in names.size():
		itemButtons[i].text = "Buy " + names[i] + ": " + str(prices[i]) + "$" 


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
		
func _buyLife():
	if gm.money < prices[2]:
		print("Cant afford extra life")
		return
	gm.money -= prices[2]
	GameManager.player.addLives(1)

func _buySpring():
	if (gm.money < prices[0]):
		print("Can't afford Spring")
		return
	GameManager.money -= prices[0]
	holdingItem = gm.ImmediateLoadObject(springScene,self)
	
	
func _buyLasergun():
	if (gm.money < prices[1]):
		print("Can't afford Lasergun")
		return
	GameManager.money -= prices[1]
	holdingItem = gm.ImmediateLoadObject(lasergunScene,self)
	
func _buySpringShoes():
	if (gm.money < prices[3]):
		print("Can't afford Lasergun")
		return
	GameManager.money -= prices[3]
	holdingItem = gm.ImmediateLoadObject(springBootsScene,self)

func _buyPlatform():
	if (gm.money < prices[4]):
		print("Can't afford Platform")
		return
	GameManager.money -= prices[4]
	holdingItem = gm.ImmediateLoadObject(platformScene,self)

func _buyEnergyDrink():
	if (gm.money < prices[5]):
		print("Can't afford Platform")
		return
	GameManager.money -= prices[5]
	holdingItem = gm.ImmediateLoadObject(energyDrinkScene,self)
