extends Area2D
class_name ToadSpit

export var direction: Vector2
export var speed: float = 200

var kill_timer = Timer.new()

func _ready() -> void:
	kill_timer.autostart = true
	kill_timer.wait_time = 5.0
	add_child(kill_timer)
	kill_timer.connect("timeout", self, "queue_free")
	connect("body_entered", self, "_on_body_entered")

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: PhysicsBody2D):
	if body:
		if body.is_in_group("Players"):
			body.health -= 200
			queue_free()
