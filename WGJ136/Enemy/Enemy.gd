extends KinematicBody2D
class_name Enemy

const FIREBALL_SCENE: PackedScene = preload("res://Enemy/EnemyFireball.tscn")

onready var player1 = $"../../PlayerHolder/Player1"
onready var player2 = $"../../PlayerHolder/Player2"

export var follow_speed: float
export var damage: float = 1
export var health: float
export var frozen: bool

export var is_ghost: bool
export var is_fire_archer: bool

var target_player

export var linear_velocity: Vector2

func _ready() -> void:
	randomize()
	target_player = player1 if randf() > 0.5 else player2
	$ShootTimer.connect("timeout", self, "shoot")
	player1.connect("died", self, "queue_free")
	player2.connect("died", self, "queue_free")

func _physics_process(delta: float) -> void:
	if frozen == true:
		return
	if target_player:
		$Sprite.look_at(target_player.position)
		if is_fire_archer:
			return
		$RayCast2D.set_cast_to(((target_player.position.normalized()) * 50))
		if ($RayCast2D as RayCast2D).is_colliding():
			var collider = $RayCast2D.get_collider()
			if collider.is_in_group("Players"):
				collider.health -= damage
		linear_velocity += position.direction_to(target_player.position)
		linear_velocity = linear_velocity.normalized() * follow_speed
		move_and_slide(linear_velocity)

func _process(delta: float) -> void:
	if health <= 0:
		queue_free()

#func on_Enemy_area_entered(area: Area2D):
#	if area.is_in_group("Fireballs"):
#		if area.fireMode == true:
#			#print("fireMode was fire, so enemy was killed")
#			if not is_fire_archer:
#				print(health)
#				health -= area.damage
#				print(health)
#			if not area.can_penetrate:
#				area.queue_free()
#		if area.fireMode == false:
#			#print("fireMode was ice, so enemy was frozen")
#			print(health)
#			health -= area.damage
#			print(health)
#			if is_fire_archer:
#				queue_free()
#			frozen = true
#			$FreezeTimer.start(4)
#			if not area.can_penetrate:
#				area.queue_free()
func _on_FreezeTimer_timeout():
	frozen = false

func shoot():
	if not is_fire_archer:
		return
	var fireball = FIREBALL_SCENE.instance()
	fireball.position = position
	fireball.direction = position.direction_to(target_player.position)
	$"/root/Main/World/FireballHolder".add_child(fireball)
