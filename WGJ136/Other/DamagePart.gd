extends CPUParticles2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("particleCreated")
	emitting = true
func _process(_delta):
	if not is_emitting():
		queue_free()
