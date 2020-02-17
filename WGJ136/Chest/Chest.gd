extends Area2D
class_name Chest

const HEART_POWERUP: PackedScene = preload("res://Heart/Heart/Heart.tscn")
const PENETRATION_POWERUP: PackedScene = preload("res://PenetrationPowerup/PenetrationPowerup.tscn")

func _ready() -> void:
	connect("body_entered", self, "on_Chest_body_entered")
	
func on_Chest_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		var rand = round(rand_range(0, 1))
		var powerup
		if rand == 1:
			powerup = HEART_POWERUP.instance()
		else:
			powerup = PENETRATION_POWERUP.instance()
		powerup.position = position
		get_parent().get_parent().get_node("PowerupHolder").add_child(powerup)
		queue_free()
