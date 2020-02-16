extends Area2D
class_name Heart

func _ready() -> void:
	connect("body_entered", self, "on_Heart_body_entered")

func on_Heart_body_entered(body: PhysicsBody2D):
	if body is Player:
		if body.health < 100:
			body.health = 100
			queue_free()
		else:
			print("You already have full health")
