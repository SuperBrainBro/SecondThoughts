extends KinematicBody2D
class_name Player

signal died()

const FIREBALL_SCENE: PackedScene = preload("res://Fireball/Fireball.tscn")

export var velocity: Vector2
export var speed: float
export var is_active: bool = true
export var health: float = 200
export var damage: float = 1
export var is_frostbite: bool

export var intendedFireMode: bool = false
export var is_dead: bool = false
export var can_penetrate: bool

export var followMouse: bool = true

onready var spr: Sprite = $Sprite
onready var cam1: Camera2D = $"../../PlayerHolder/Player1/Camera2D"
onready var cam2: Camera2D = $"../../PlayerHolder/Player2/Camera2D"
var health_bar: TextureProgress

func _ready() -> void:
	health = 500

func _process(_delta: float) -> void:
	if is_frostbite:
		health_bar = $"/root/Main/CanvasLayer/Control/HealthBarIce"
	else:
		health_bar = $"/root/Main/CanvasLayer/Control/HealthBarFire"
	($ActiveArrow as Sprite).visible = is_active
	health_bar.value = health
	if health <= 0:
		is_dead = true
		emit_signal("died")
		($"../../../ScoreTimer" as Timer).stop()
		$"../../../CanvasLayer/Control/GameOverScreen".show()
	if is_dead:
		is_active = true
	if Input.is_action_just_pressed("attack") and is_active:
		var fireball = FIREBALL_SCENE.instance()
		fireball.direction = position.direction_to(get_global_mouse_position())
		followMouse = true
		position += -fireball.direction * 15
		fireball.position = position
		fireball.fireMode = intendedFireMode
		fireball.can_penetrate = can_penetrate
		fireball.damage = damage
		$"../../FireballHolder".add_child(fireball)
		cam1.shake(0.3,64,11)
		cam2.shake(0.3,64,11)
	if Input.is_action_just_pressed("shoot_left") and is_active:
		shoot(Vector2(-1, 0))
	if Input.is_action_just_pressed("shoot_right") and is_active:
		shoot(Vector2(1, 0))
	if Input.is_action_just_pressed("shoot_up") and is_active:
		shoot(Vector2(0, -1))
	if Input.is_action_just_pressed("shoot_down") and is_active:
		shoot(Vector2(0, 1))
func _physics_process(_delta: float) -> void:
	if not is_active:
		return
	if followMouse:
		spr.look_at(get_global_mouse_position())
	velocity = Vector2()
	velocity.x += Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.y += Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)

func shoot(pos: Vector2):
	var fireball = FIREBALL_SCENE.instance()
	fireball.direction = pos
	followMouse = false
	spr.look_at(position+pos)
	position += -pos * 15
	fireball.position = position
	fireball.fireMode = intendedFireMode
	fireball.can_penetrate = can_penetrate
	fireball.damage = damage
	$"../../FireballHolder".add_child(fireball)
	cam1.shake(0.3,64,11)
	cam2.shake(0.3,64,11)
