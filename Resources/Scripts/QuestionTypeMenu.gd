extends Node
@onready var gm = get_node("/root/GameManagerScene")
@onready var fractionButton = %Fractions 
@onready var geometryButton = %Geometry
@onready var preAlgButton = %PreAlg

# Called when the node enters the scene tree for the first time.
func _ready():
	fractionButton.pressed.connect(_unimpl)
	geometryButton.pressed.connect(_unimpl)
	preAlgButton.pressed.connect(_unimpl)
	pass # Replace with function body.

func _unimpl():
	print("unimpl")
	_run()

func _run():
		get_tree().change_scene_to_file("res://Resources/Scenes/AnswerQuestion.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
