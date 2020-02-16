extends Area2D
class_name Enemy

onready var player1: Player = $"../../PlayerHolder/Player1"
onready var player2: Player = $"../../PlayerHolder/Player2"

export var follow_speed: float
export var damage: float
export var max_health: float
export var type: String
export var frozen: bool

onready var health: float = max_health

var target_player: Player

func _ready() -> void:
	randomize()
	target_player = player1 if randf() > 0.5 else player2
	connect("area_entered", self, "on_Enemy_area_entered")
	player1.connect("died", self, "queue_free")
	player2.connect("died", self, "queue_free")

func _physics_process(delta: float) -> void:
	if frozen == true:
		return
	if target_player:
		position += position.direction_to(target_player.position) * delta * follow_speed
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body is Player:
				body.health -= 1

func on_Enemy_area_entered(area: Area2D):
	if area is Fireball:
		if area.fireMode == true:
			print("fireMode was fire, so enemy was killed")
			area.queue_free()
			queue_free()
		if area.fireMode == false:
			print("fireMode was ice, so enemy was frozen")
			area.queue_free()
			frozen = true
			$FreezeTimer.start(3)
			
func _on_FreezeTimer_timeout():
	frozen = false
