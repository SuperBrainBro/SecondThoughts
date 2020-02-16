extends Node
class_name Main

const ENEMY_SCENE: PackedScene = preload("res://Enemy/Enemy.tscn")

onready var player1: Player = $World/PlayerHolder/Player1
onready var player2: Player = $World/PlayerHolder/Player2
onready var cam1: Camera2D = $World/PlayerHolder/Player1/Camera2D
onready var cam2: Camera2D = $World/PlayerHolder/Player2/Camera2D

export var score: int

func _ready() -> void:
	randomize()
	player1.is_active = true
	player2.is_active = false
	cam1.current = player1.is_active
	cam2.current = player2.is_active
	$SpawnTimer.connect("timeout", self, "_on_SpawnTimer_timeout")
	$ScoreTimer.connect("timeout", self, "_on_ScoreTimer_timeout")

func _process(_delta: float) -> void:
	$CanvasLayer/Control/ScoreLabel.text = "Score: " + str(score)
	if Input.is_action_just_pressed("change_player"):
		#print('Switched Player')
		player1.is_active = not player1.is_active
		player2.is_active = not player2.is_active
		cam1.current = player1.is_active
		cam2.current = player2.is_active

func _on_SpawnTimer_timeout():
	for spawn_location in $"SpawnLocations".get_children():
		var enemy: Enemy = ENEMY_SCENE.instance()
		if randf() > .5:
			enemy.type = "creeper"
		else:
			enemy.type = "ghost"
		enemy.position = spawn_location.position
		$"/root/Main/World/EnemyHolder".add_child(enemy)

func _on_ScoreTimer_timeout():
	score += 1
