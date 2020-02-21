extends KinematicBody2D
class_name CameraMain

export var playerCam: bool
var pos = Vector2()
var x = 2

onready var player1 = $"/root/Main/World/PlayerHolder/Player1"
onready var player2 = $"/root/Main/World/PlayerHolder/Player2"

func _process(delta):
	characterChange()

func shake(duration, frequency, amplitude):
	$NewCamera.shake(duration, frequency, amplitude)
	
func characterChange():
	if playerCam == false:
		if global_position.distance_to(player1.global_position) > 10:
			pos = player1.global_position - global_position
			x = 0.1
			move_and_collide(pos * x)
		else:
			x = 0.1
			move_and_collide(Vector2(0, 0))
	elif playerCam == true:
		if global_position.distance_to(player2.global_position) > 10:
			pos = player2.global_position - global_position
			x = 0.1
			move_and_collide(pos * x)
		else:
			x = 0.1
			move_and_collide(Vector2(0, 0))
