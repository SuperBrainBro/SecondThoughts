extends Node
class_name soundFX

onready var chestFX: AudioStreamPlayer2D = $ChestSound
onready var enemyHitFX: AudioStreamPlayer2D = $EnemyHitSound
onready var enemyKillFX: AudioStreamPlayer2D = $EnemyKilledSound
onready var powerupFX: AudioStreamPlayer2D = $PowerUpSound
onready var switchFX: AudioStreamPlayer2D = $SwitchPlayers

func playChest():
	chestFX.play()

func playEnemyHit():
	enemyHitFX.play()

func playEnemyKill():
	enemyKillFX.play()

func playPower():
	powerupFX.play()

func playSwitch():
	switchFX.play()
