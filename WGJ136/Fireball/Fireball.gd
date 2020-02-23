extends Area2D
class_name Fireball

export var direction: Vector2
export var speed: float = 250
export var damage: float
export var fireMode: bool = true
export var can_penetrate: bool

onready var audioFX: soundFX = $"/root/Main/soundFX"

func _ready():
	print(damage)
# warning-ignore:return_value_discarded
	$DespawnTimer.connect("timeout", self, "despawn")
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_Fireball_body_entered")
	if fireMode == true:
		print('fireMode is 1')
		$Sprite.texture = preload("res://Fireball/fireball.png")
		$CPUParticles2D.texture = preload("res://Fireball/fireball.png")
		$FireSound.volume_db = -1
		$IceSound.volume_db = -80
	elif fireMode == false:
		print('fireMode is 0')
		$Sprite.texture = preload("res://Fireball/frost_thing_02.png")
		$CPUParticles2D.texture = preload("res://Fireball/frost_thing_02.png")
		$FireSound.volume_db = -80
		$IceSound.volume_db = -3.5

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	speed += .045 * (speed/2.1) + (speed/125)

func _on_Fireball_body_entered(body: PhysicsBody2D) -> void:
	if body is Enemy:
		if fireMode == true:
			print("fireMode was fire, so enemy was killed")			
			print(body.health)
			if not body.is_fire_archer:
				body.health -= damage
				audioFX.playEnemyHit()
				body.anim.play("damageEffect")
				var blood = body.particle.instance()
				blood.position = body.position
				$"/root/Main/World/FireballHolder".add_child(blood)
				print(body.health)
			if not can_penetrate:				
				queue_free()
		if fireMode == false:
			print("fireMode was ice, so enemy was frozen")
			print(body.health)
			body.health -= damage
			body.anim.play("damageEffect")
			var blood = body.particle.instance()
			blood.position = body.position
			$"/root/Main/World/FireballHolder".add_child(blood)
			print(body.health)
			body.frozen = true
			body.get_node("FreezeTimer").start(3)
			if body.is_fire_archer:
				$"/root/Main".score += 1
				audioFX.playEnemyKill()
				body.queue_free()
			else:
				audioFX.playEnemyHit()
			if not can_penetrate:
				queue_free()

func despawn():
	print('Destroyed Bullet')
	queue_free()
