extends Area2D
class_name EnemyFireball

export var direction: Vector2
export var speed: float = 200

func _ready() -> void:
	connect("body_entered", self, "on_EnemyFireball_body_entered")

func _physics_process(delta: float) -> void:
	position += direction * delta * speed

func on_EnemyFireball_body_entered(body: KinematicBody2D):
	if body == Player:
		body.health -= 10;
