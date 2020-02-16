extends Node
class_name Main

onready var player1: Player = $World/PlayerHolder/Player1
onready var player2: Player = $World/PlayerHolder/Player2
onready var cam1: Camera2D = $World/PlayerHolder/Player1/Camera2D
onready var cam2: Camera2D = $World/PlayerHolder/Player2/Camera2D

func _ready() -> void:
	player1.is_active = true
	player2.is_active = false
	cam1.current = player1.is_active
	cam2.current = player2.is_active

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("change_player"):
		print('Switched Player')
		player1.is_active = not player1.is_active
		player2.is_active = not player2.is_active
		cam1.current = player1.is_active
		cam2.current = player2.is_active
