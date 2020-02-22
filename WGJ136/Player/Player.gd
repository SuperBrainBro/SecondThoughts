extends KinematicBody2D
class_name Player

var horizontal_input
var vertical_input
var direction = Vector2()

#spacial speed
var horizontal_speed
var vertical_speed

#velocity vectors
var delta_velocity = Vector2()

#speed managers
export var max_speed = 20
var speed_multiplier = 1000
var true_max_speed = max_speed * speed_multiplier

#acceleration/deceleration lerping weight
const ACCEL_WEIGHT = .25

signal died()

onready var collider: CollisionShape2D = $CollisionShape2D

const FIREBALL_SCENE: PackedScene = preload("res://Fireball/Fireball.tscn")

onready var player1: Player = $"/root/Main/World/PlayerHolder/Player1"
onready var player2: Player = $"/root/Main/World/PlayerHolder/Player2"

export var linear_velocity: Vector2

export var velocity: Vector2
export var speed: Vector2
export var is_active: bool = true
export var health: float = 200
export var damage: float = 1
export var is_frostbite: bool
export var acceleration: float
export var intendedFireMode: bool = false
export var is_dead: bool = false
export var can_penetrate: bool

export var followMouse: bool = true

onready var spr: Sprite = $Sprite
onready var cam: CameraMain = $"/root/Main/World/Camera/NewCamera"
var health_bar: TextureProgress

func _ready() -> void:
	health = 500
	horizontal_input = 0
	vertical_input = 0
	
	horizontal_speed = 0;
	vertical_speed = 0;
	pass


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
	if is_dead: #player1.is_dead and player2.is_dead
		($"../../../ScoreTimer" as Timer).stop()
		$"../../../CanvasLayer/Control/GameOverScreen".show()
	if is_dead:
		return
	
	if Input.is_action_just_pressed("attack") and is_active:
		var fireball = FIREBALL_SCENE.instance()
		fireball.direction = position.direction_to(get_global_mouse_position())
		followMouse = true
		#position += -fireball.direction * 15
		fireball.position = position
		fireball.fireMode = intendedFireMode
		fireball.can_penetrate = can_penetrate
		fireball.damage = damage
		$"../../FireballHolder".add_child(fireball)
		cam.shake(0.3,64,11)
	if Input.is_action_just_pressed("shoot_left") and is_active:
		shoot(Vector2(-1, 0))
	if Input.is_action_just_pressed("shoot_right") and is_active:
		shoot(Vector2(1, 0))
	if Input.is_action_just_pressed("shoot_up") and is_active:
		shoot(Vector2(0, -1))
	if Input.is_action_just_pressed("shoot_down") and is_active:
		shoot(Vector2(0, 1))
		
func _physics_process(delta):
	
	if not is_active:
		if is_frostbite:
			player1.collider.scale = Vector2(1, 1)
			player2.collider.scale = Vector2(.15, .15)
			player1.z_index = 0
			player2.z_index = 1
			linear_velocity = position.direction_to(player2.position)
			spr.look_at(player2.position)
			linear_velocity = linear_velocity.normalized() * max_speed/2
		else:
			player1.collider.scale = Vector2(.15, .15)
			player2.collider.scale = Vector2(1, 1)
			player2.z_index = 0
			player1.z_index = 1
			linear_velocity = position.direction_to(player1.position)
			spr.look_at(player1.position)
			linear_velocity = linear_velocity.normalized() * max_speed/2
		if is_dead:
			return
		move_and_slide(linear_velocity)
		return
	if is_dead:
		return
	if followMouse:
		spr.look_at(get_global_mouse_position())
	
	var is_moving = Input.is_action_pressed("move_up") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left")

	if is_moving:
		horizontal_input = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
		vertical_input = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
		
		horizontal_speed = lerp(horizontal_speed, abs(horizontal_input), ACCEL_WEIGHT)
		vertical_speed = lerp(vertical_speed, abs(vertical_input), ACCEL_WEIGHT)
	else:
		horizontal_speed = lerp(horizontal_speed, 0, ACCEL_WEIGHT)
		vertical_speed = lerp(vertical_speed, 0, ACCEL_WEIGHT)
	
	direction = Vector2(horizontal_input, vertical_input).normalized()
	speed = Vector2(horizontal_speed, vertical_speed)

	velocity = direction * speed
	delta_velocity = true_max_speed * velocity * delta

	move_and_slide(delta_velocity)
	pass
func shoot(pos: Vector2):
	var fireball = FIREBALL_SCENE.instance()
	fireball.direction = pos
	followMouse = false
	spr.look_at(position+pos)
	#position += -pos * 10
	fireball.position = position
	fireball.fireMode = intendedFireMode
	fireball.can_penetrate = can_penetrate
	fireball.damage = damage
	$"../../FireballHolder".add_child(fireball)
	cam.shake(0.3,64,11)
