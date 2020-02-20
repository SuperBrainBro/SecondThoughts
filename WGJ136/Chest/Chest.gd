extends Area2D
class_name Chest

const HEART_POWERUP: PackedScene = preload("res://Heart/Heart/Heart.tscn")
const PENETRATION_POWERUP: PackedScene = preload("res://PenetrationPowerup/PenetrationPowerup.tscn")
const DAMAGE_POWERUP: PackedScene = preload("res://PenetrationPowerup/Damage Up.tscn")
var opened: bool = false
export var whatPowerup: String

onready var audioFX: soundFX = $"/root/Main/soundFX"

func _ready() -> void:
# warning-ignore:return_value_discarded
	connect("body_entered", self, "on_Chest_body_entered")
	
func on_Chest_body_entered(body: PhysicsBody2D) -> void:
	if opened:
		return
	if body.is_in_group("Players"):
		var powerup
		if whatPowerup == "heart":
			powerup = HEART_POWERUP.instance()
		elif whatPowerup == "penetration":
			powerup = PENETRATION_POWERUP.instance()
		else:
			powerup = DAMAGE_POWERUP.instance()
		powerup.position = position + Vector2(0, 150)
		get_parent().get_parent().get_node("PowerupHolder").add_child(powerup)
		opened = true
		audioFX.playChest()
		$Sprite.texture = preload("res://Objects/chest_02_open.png")
