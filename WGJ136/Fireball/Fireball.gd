extends Area2D
class_name Fireball

export var direction: Vector2
export var speed: float = 600

func _ready():
	print('Bullet Created')
	$DespawnTimer.connect("timeout", self, "despawn")

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
func despawn():
	print('Destroyed Bullet')
	queue_free()
