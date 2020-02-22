extends KinematicBody2D
class_name Toad

const SPIT = preload("res://Toad/ToadSpit.tscn")

export var velocity: Vector2
export var speed: float = 100

onready var raycast: RayCast2D = $RayCast2D

var prev_pos
var screen_size = 1280

var shoot_timer: Timer = Timer.new()
onready var val: float = 1

func _ready() -> void:
	shoot_timer.wait_time = .75
	shoot_timer.autostart = true
	shoot_timer.connect("timeout", self, "shoot")
	add_child(shoot_timer)
	$AnimationPlayer.play("toadBoss")

#func _process(delta):
#	if raycast.is_colliding():
#		if val == 1:
#			raycast.cast_to = Vector2(-150, 0)
#			val = -1
#		elif val == -1:
#			raycast.cast_to = Vector2(150, 0)
#			val = 1
#func _physics_process(_delta: float) -> void:
#	velocity.y = 0
#	velocity.x = 1 + speed/2
#	velocity = Vector2(abs(velocity.x), abs(velocity.y)) * val
#	velocity = velocity.clamped(speed)
#	move_and_slide(velocity)

func shoot():
	var spit = SPIT.instance()
	add_child(spit)
	spit.direction = Vector2.UP


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("toadBoss")
