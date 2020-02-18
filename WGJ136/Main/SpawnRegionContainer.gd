extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SpawnRegion_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion2_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion3_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion4_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion5_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion6_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion7_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion8_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion9_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion10_body_entered(body):
	playerEnterRegion(body)


func _on_SpawnRegion11_body_entered(body):
	playerEnterRegion(body)

func _on_SpawnRegion_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion2_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion3_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion4_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion5_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion6_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion7_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion8_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion9_body_exited(body):
	playerExitRegion(body)

func _on_SpawnRegion10_body_exited(body):
	playerExitRegion(body)
	
func _on_SpawnRegion11_body_exited(body):
	playerExitRegion(body)

func playerEnterRegion(body):
	var typeNode = body.get_class()
	print(typeNode)
	if not typeNode == "KinematicBody2D":
		return
	print("Player Entered")
	
func playerExitRegion(body):
	var typeNode = body.get_class()
	print(typeNode)
	if not typeNode == "KinematicBody2D":
		return
	print("Player Exited")
