extends Area2D
class_name PenetrationPowerup
onready var audioFX: soundFX = $"/root/Main/soundFX"
func _ready() -> void:
	connect("body_entered", self, "_on_Body_Entered")
	
func _on_Body_Entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Players"):
		body.can_penetrate = true
		audioFX.playPower()
		queue_free()

