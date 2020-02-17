extends Area2D
class_name Chest

const HEART_POWERUP: PackedScene = preload("res://Heart/Heart/Heart.tscn")

func _ready() -> void:
	connect("body_entered", self, "on_Chest_body_entered")
	
func on_Chest_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		var powerup = HEART_POWERUP.instance()
		powerup.position = position
		get_parent().get_parent().get_node("PowerupHolder").add_child(powerup)
		queue_free()
