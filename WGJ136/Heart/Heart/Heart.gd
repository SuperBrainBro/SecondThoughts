extends Area2D
class_name Heart

func _ready() -> void:
	connect("body_entered", self, "on_Heart_body_entered")

func on_Heart_body_entered(body: PhysicsBody2D):
	if body.is_in_group("Players"):
		if body.health < 500:
			body.health = 500
			queue_free()
