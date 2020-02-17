extends Area2D
class_name Chest

const HEART_POWERUP: PackedScene = preload("res://Heart/Heart/Heart.tscn")
const PENETRATION_POWERUP: PackedScene = preload("res://PenetrationPowerup/PenetrationPowerup.tscn")
const DAMAGE_POWERUP: PackedScene = preload("res://PenetrationPowerup/Damage Up.tscn")

export var whatPowerup: String
func _ready() -> void:
	connect("body_entered", self, "on_Chest_body_entered")
	
func on_Chest_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		var powerup
		if whatPowerup == "heart":
			powerup = HEART_POWERUP.instance()
		elif whatPowerup == "penetration":
			powerup = PENETRATION_POWERUP.instance()
		elif whatPowerup == "damage":
			powerup = DAMAGE_POWERUP.instance()
		powerup.position = position + Vector2(0, 100)
		get_parent().get_parent().get_node("PowerupHolder").add_child(powerup)
		$Sprite.texture = preload("res://Objects/chest_02_open.png")
