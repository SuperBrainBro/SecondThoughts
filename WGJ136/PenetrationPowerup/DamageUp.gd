extends Area2D
class_name DamageUp

onready var audioFX: soundFX = $"/root/Main/soundFX"

func _ready() -> void:
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_Body_Entered")
	
func _on_Body_Entered(body: PhysicsBody2D) -> void:
	if body is Player:
		body.damage += 1;
		audioFX.playPower()
		queue_free()
