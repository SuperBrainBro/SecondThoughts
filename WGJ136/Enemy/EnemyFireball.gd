extends Area2D
class_name EnemyFireball

export var direction: Vector2
export var speed: float = 200

var despawn_timer = Timer.new()

func _ready() -> void:
	connect("body_entered", self, "on_EnemyFireball_body_entered")
	add_child(despawn_timer)
	despawn_timer.connect("timeout", self, "queue_free")
	despawn_timer.start(5)

func _physics_process(delta: float) -> void:
	position += direction * delta * speed

func on_EnemyFireball_body_entered(body: PhysicsBody2D):
	if body:
		if body.is_in_group("Players"):
			body.health -= 20;
			queue_free()
