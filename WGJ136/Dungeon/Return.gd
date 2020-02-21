extends Area2D

export var instructions: bool = true
func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		if instructions:
			get_tree().change_scene("res://Other/TitleScreen.tscn")
		else:
			get_tree().change_scene("res://Other/Credits/Credits.tscn")
