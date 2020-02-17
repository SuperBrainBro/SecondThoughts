extends Area2D
class_name PenetrationPowerup

func _ready() -> void:
	connect("body_entered", self, "_on_Body_Entered")
	
func _on_Body_Entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Players"):
		queue_free()
		body.can_penetrate = true
		body.get_node("PenetrateTimer").start(20)
