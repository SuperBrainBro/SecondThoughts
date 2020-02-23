extends Area2D
class_name ToadSpit

export var direction: Vector2
export var speed: float = 200
export var pos: Vector2
var kill_timer = Timer.new()

func _ready() -> void:
	position = pos
	print("Toad Spit")
	$Sprite.z_index = 5
	kill_timer.autostart = true
	kill_timer.wait_time = 1.5
	add_child(kill_timer)
	kill_timer.connect("timeout", self, "queue_free")
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_body_entered")

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: PhysicsBody2D):
	if body:
		if body.is_in_group("Players"):
			body.health -= 200
			queue_free()
