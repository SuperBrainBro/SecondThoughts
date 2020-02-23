extends KinematicBody2D
class_name CameraMain

export var playerCam: bool
var pos = Vector2()
var x = .04

onready var player1 = $"/root/Main/World/PlayerHolder/Player1"
onready var player2 = $"/root/Main/World/PlayerHolder/Player2"

func _physics_process(_delta):
	characterChange()

func shake(duration, frequency, amplitude):
	$NewCamera.shake(duration, frequency, amplitude)
	
func characterChange():
	if playerCam:
		set_camera_to_player(player2)
	else:
		set_camera_to_player(player1)
	
func set_camera_to_player(p):
	if global_position.distance_to(p.global_position) > .5:
		pos = p.global_position - global_position
# warning-ignore:return_value_discarded
		move_and_collide(pos * x)
	else:
# warning-ignore:return_value_discarded
		move_and_collide(Vector2(0, 0))
