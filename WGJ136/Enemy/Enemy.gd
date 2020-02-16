extends Area2D
class_name Enemy

onready var player1: Player = $"../../PlayerHolder/Player1"
onready var player2: Player = $"../../PlayerHolder/Player2"

export var follow_speed: float = 30
export var type: String = "creeper"

var target_player: Player

func _ready() -> void:
	randomize()
	target_player = player1 if rand_range(0,1) > 0.5 else player2
	connect("area_entered", self, "on_Enemy_area_entered")
	player1.connect("died", self, "queue_free")
	player2.connect("died", self, "queue_free")

func _process(delta: float) -> void:
	match(type):
		"creeper":
			$Sprite.texture = preload("res://Enemy/creeper.png")
			follow_speed = 30
		"ghost":
			$Sprite.texture = preload("res://Enemy/ghost.png")
			follow_speed = 60

func _physics_process(delta: float) -> void:
	if target_player:
		position += position.direction_to(target_player.position) * delta * follow_speed
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body is Player:
				body.health -= 1

func on_Enemy_area_entered(area: Area2D):
	if area is Fireball:
		area.queue_free()
		queue_free()
		
func _on_Player_died():
	queue_free()
