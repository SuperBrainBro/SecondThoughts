extends Area2D

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		get_tree().change_scene("res://Other/TitleScreen.tscn")
