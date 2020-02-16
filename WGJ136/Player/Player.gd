extends KinematicBody2D
class_name Player

const FIREBALL_SCENE: PackedScene = preload("res://Fireball/Fireball.tscn")

export var velocity: Vector2
export var speed: float = 100
export var is_active: bool = true
export var health: float = 100

onready var wand: Sprite = $Wand
onready var cam1: Camera2D = $"../../PlayerHolder/Player1/Camera2D"
onready var cam2: Camera2D = $"../../PlayerHolder/Player2/Camera2D"

func _process(_delta: float) -> void:
	($ActiveArrow as Sprite).visible = is_active
	$HealthBar.value = health
	if health == 0:
		$"../../../AnimationPlayer".play("GameOver")
	if Input.is_action_just_pressed("attack") and is_active:
		var fireball = FIREBALL_SCENE.instance()
		fireball.direction = position.direction_to(get_global_mouse_position())
		fireball.position = position
		#fireball.look_at(fireball.direction)
		#fireball.rotation_degrees -= 270
		$"../../FireballHolder".add_child(fireball)
		cam1.shake(0.15,21,9)
		cam2.shake(0.15,21,9)
		
func _physics_process(_delta: float) -> void:
	if not is_active:
		return
	wand.look_at(get_global_mouse_position())
	velocity = Vector2()
	velocity.x += Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y += Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
