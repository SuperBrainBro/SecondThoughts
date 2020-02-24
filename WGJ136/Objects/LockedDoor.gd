extends Node2D

onready var spr: Sprite = $StaticBody2D/Sprite
onready var statBod: StaticBody2D = $StaticBody2D
onready var areaBod: Area2D = $Area2D

onready var keyOverlay: GameCanvas = $"/root/Main/CanvasLayer"

func _ready():
	spr.z_index = 2

func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):
		if not body.is_active:
			print("Player Entered Locked Area, But Player Was Not Active")
			return
	else:
		return
	
	keyOverlay.NeedAKey.show()

func _on_Area2D_body_exited(body):
	if body.is_in_group("Players"):
		if not body.is_active:
			print("Player Exited Locked Area")
			return
	else:
		return
	
	keyOverlay.NeedAKey.hide()
