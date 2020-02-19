extends Node
class_name Main

const ENEMY_SCENE: PackedScene = preload("res://Enemy/Enemy.tscn")
const OGRE_SCENE = preload("res://Enemy/Ogre.tscn")
const SKELETON_SCENE = preload("res://Enemy/Skeleton.tscn")
const FIRE_ARCHER_SCENE = preload("res://Enemy/FireArcher.tscn")

onready var player1: Player = $World/PlayerHolder/Player1
onready var player2: Player = $World/PlayerHolder/Player2

onready var shader1: Camera2D = $World/PlayerHolder/Player1/Camera2D/Vignette
onready var shader2: Camera2D = $World/PlayerHolder/Player2/Camera2D/Vignette

onready var cam1: Camera2D = $World/PlayerHolder/Player1/Camera2D
onready var cam2: Camera2D = $World/PlayerHolder/Player2/Camera2D

onready var intendedIntendedFireMode: bool = true;

export var score: int
export var instructions: bool

func _ready() -> void:
	randomize()
	
	player1.is_active = false
	player2.is_active = true
	
	cam1.current = player1.is_active
	cam2.current = player2.is_active
	
	shader1.visible = player1.is_active
	shader2.visible = player2.is_active
	
	player1.intendedFireMode = false
	player2.intendedFireMode = true
	
	if not instructions:
		$CanvasLayer/Control/GameOverScreen.hide()
		$SpawnTimer.connect("timeout", self, "_on_SpawnTimer_timeout")
		$ScoreTimer.connect("timeout", self, "_on_ScoreTimer_timeout")
		$CanvasLayer/Control/GameOverScreen/PlayAgainButton.connect("pressed", self, "_on_PlayAgainButton_Pressed")
	
func _process(_delta: float) -> void:
	if not instructions:
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
	if not instructions:
		return
		#for spawn_location in $"SpawnLocations".get_children():
			#var enemy: Enemy
			#var rand_num = round(rand_range(0, 4))
			#if rand_num == 0:
			#	enemy = FIRE_ARCHER_SCENE.instance()
			#elif rand_num == 1 or rand_num == 2:
			#	enemy = SKELETON_SCENE.instance()
			#else:
			#	enemy = OGRE_SCENE.instance()
			#enemy.position = spawn_location.position
			#$"/root/Main/World/EnemyHolder".add_child(enemy)

func _on_ScoreTimer_timeout():
	if not instructions:
		return
	
func _on_PlayAgainButton_Pressed() -> void:
	if not instructions:
		get_tree().change_scene("res://Main/Main.tscn")
