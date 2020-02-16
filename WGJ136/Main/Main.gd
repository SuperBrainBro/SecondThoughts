extends Node
class_name Main

const ENEMY_SCENE: PackedScene = preload("res://Enemy/Enemy.tscn")
const OGRE_SCENE = preload("res://Enemy/Ogre.tscn")
const SKELETON_SCENE = preload("res://Enemy/Skeleton.tscn")

onready var player1: Player = $World/PlayerHolder/Player1
onready var player2: Player = $World/PlayerHolder/Player2

onready var shader1: Camera2D = $World/PlayerHolder/Player1/Camera2D/Vignette
onready var shader2: Camera2D = $World/PlayerHolder/Player2/Camera2D/Vignette

onready var cam1: Camera2D = $World/PlayerHolder/Player1/Camera2D
onready var cam2: Camera2D = $World/PlayerHolder/Player2/Camera2D

onready var intendedIntendedFireMode: bool = true;

export var score: int

func _ready() -> void:
	randomize()
	
	player1.is_active = true
	player2.is_active = false
	
	cam1.current = player1.is_active
	cam2.current = player2.is_active
	
	shader1.visible = player1.is_active
	shader2.visible = player2.is_active
	
	player1.intendedFireMode = false
	player2.intendedFireMode = true
	
	$CanvasLayer/Control/GameOverScreen.hide()
	$SpawnTimer.connect("timeout", self, "_on_SpawnTimer_timeout")
	$ScoreTimer.connect("timeout", self, "_on_ScoreTimer_timeout")

func _process(_delta: float) -> void:
	$CanvasLayer/Control/ScoreLabel.text = "Score: " + str(score)
	if Input.is_action_just_pressed("change_player"):
		print('Switched Player')
		
		player1.is_active = not player1.is_active
		player2.is_active = not player2.is_active
		
		cam1.current = player1.is_active
		cam2.current = player2.is_active
		
		shader1.visible = player1.is_active
		shader2.visible = player2.is_active
		
		player1.intendedFireMode = false
		player2.intendedFireMode = true

func _on_SpawnTimer_timeout():
	for spawn_location in $"SpawnLocations".get_children():
		var enemy: Enemy
		if randf() > 0.5:
			enemy = OGRE_SCENE.instance()
		else:
			enemy = SKELETON_SCENE.instance()
		enemy.position = spawn_location.position
		$"/root/Main/World/EnemyHolder".add_child(enemy)

func _on_ScoreTimer_timeout():
	score += 1
