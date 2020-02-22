extends KinematicBody2D
class_name Toad

const SPIT = preload("res://Toad/ToadSpit.tscn")

export var velocity: Vector2
export var speed: float = 100

onready var raycast: RayCast2D = $RayCast2D

var prev_pos
var screen_size = 1280

var shoot_timer: Timer = Timer.new()

func _ready() -> void:
	shoot_timer.wait_time = 5.0
	shoot_timer.autostart = true
	shoot_timer.connect("timeout", self, "shoot")
	add_child(shoot_timer)

func _physics_process(delta: float) -> void:
	velocity.x += 1
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
	if position == prev_pos:
		velocity = -velocity
	prev_pos = position

func shoot():
	var spit = SPIT.instance()
	add_child(spit)
	spit.direction = Vector2.UP
