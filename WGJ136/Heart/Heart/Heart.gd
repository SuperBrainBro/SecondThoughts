extends Area2D
class_name Heart

onready var player1: Player = $"../../PlayerHolder/Player1"
onready var player2: Player = $"../../PlayerHolder/Player2"

func _ready() -> void:
	connect("body_entered", self, "on_Heart_body_entered")

func on_Heart_body_entered(body: PhysicsBody2D):
	if body is Player:
		body.health = 100
		queue_free()
