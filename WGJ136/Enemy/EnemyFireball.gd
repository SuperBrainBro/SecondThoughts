extends Area2D
class_name EnemyFireball

export var direction: Vector2
export var speed: float = 300

func _ready() -> void:
	connect("body_entered", self, "on_EnemyFireball_body_entered")

func _physics_process(delta: float) -> void:
	position += direction * delta * speed

func on_EnemyFireball_body_entered(body: PhysicsBody2D):
	if body is Player:
		body.health -= 20
