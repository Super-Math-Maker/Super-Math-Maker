extends Node2D

@onready var continueButton : Button = $"Continue Button"
@onready var exitButton : Button = $"Exit Button"
@onready var settingsButton : Button = $"Settings Button"

# Called when the node enters the scene tree for the first time.
func _ready():
	continueButton.pressed.connect(_continue)
	exitButton.pressed.connect(_quit)
	pass # Replace with function body.

func _openSettings():
	remove_child(continueButton)
	remove_child(exitButton)
	pass
	
func _closeSettings():
	add_child(continueButton)
	add_child(exitButton)

func _continue():
	GameManager.unPauseGame()

func _quit():
	get_tree().quit()
