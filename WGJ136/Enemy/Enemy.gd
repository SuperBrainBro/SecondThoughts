extends Area2D
class_name Enemy

onready var player1: Player = $"../../PlayerHolder/Player1"
onready var player2: Player = $"../../PlayerHolder/Player2"

export var follow_speed: float
export var damage: float
export var max_health: float
export var type: String

onready var health: float = max_health
