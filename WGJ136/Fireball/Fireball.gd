extends Area2D
class_name Fireball

export var direction: Vector2
export var speed: float = 650
export var damage: float = 1
export var fireMode: bool = true
export var can_penetrate: bool

func _ready():
	print('Bullet Created')
	$DespawnTimer.connect("timeout", self, "despawn")
	if fireMode == true:
		print('fireMode is 1')
		$Sprite.texture = preload("res://Fireball/fireball.png")
		$CPUParticles2D.texture = preload("res://Fireball/fireball.png")
		$FireSound.volume_db = 0
		$IceSound.volume_db = -80
	elif fireMode == false:
		print('fireMode is 0')
		$Sprite.texture = preload("res://Fireball/frost_thing_02.png")
		$CPUParticles2D.texture = preload("res://Fireball/frost_thing_02.png")
		$FireSound.volume_db = -80
		$IceSound.volume_db = 0

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
func despawn():
	print('Destroyed Bullet')
	queue_free()
