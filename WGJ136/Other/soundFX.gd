extends Node
class_name soundFX

onready var chestFX: AudioStreamPlayer = $ChestSound
onready var enemyHitFX: AudioStreamPlayer = $EnemyHitSound
onready var enemyKillFX: AudioStreamPlayer = $EnemyKilledSound
onready var powerupFX: AudioStreamPlayer = $PowerUpSound
onready var switchFX: AudioStreamPlayer = $SwitchPlayers

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
