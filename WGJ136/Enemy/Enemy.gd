extends Area2D
class_name Enemy

const FIREBALL_SCENE: PackedScene = preload("res://Enemy/EnemyFireball.tscn")

onready var player1 = $"../../PlayerHolder/Player1"
onready var player2 = $"../../PlayerHolder/Player2"

export var follow_speed: float
export var damage: float = 1
export var max_health: float
export var frozen: bool

export var is_ghost: bool
export var is_fire_archer: bool

onready var health: float = max_health

var target_player

func _ready() -> void:
	randomize()
	target_player = player1 if randf() > 0.5 else player2
	connect("area_entered", self, "on_Enemy_area_entered")
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
		position += position.direction_to(target_player.position) * delta * follow_speed
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body is Player:
				body.health -= damage

func on_Enemy_area_entered(area: Area2D):
	if area is Fireball:
		if area.fireMode == true:
			print("fireMode was fire, so enemy was killed")
			area.queue_free()
			if not is_fire_archer:
				queue_free()
		if area.fireMode == false:
			print("fireMode was ice, so enemy was frozen")
			area.queue_free()
			if is_fire_archer:
				queue_free()
			frozen = true
			$FreezeTimer.start(3)
			
func _on_FreezeTimer_timeout():
	frozen = false

func shoot():
	if not is_fire_archer:
		return
	var fireball: EnemyFireball = FIREBALL_SCENE.instance()
	fireball.position = position
	fireball.direction = position.direction_to(target_player.position)
	$"/root/Main/World/FireballHolder".add_child(fireball)
