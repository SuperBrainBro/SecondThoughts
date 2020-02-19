extends Area2D
class_name DamageUp

func _ready() -> void:
	connect("body_entered", self, "_on_Body_Entered")
	
func _on_Body_Entered(body: PhysicsBody2D) -> void:
	if body is Player:
		body.damage += 1;
		queue_free()
