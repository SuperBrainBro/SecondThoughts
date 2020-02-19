extends Node2D

onready var region1: Area2D = $SpawnRegion
onready var region2: Area2D = $SpawnRegion2
onready var region3: Area2D = $SpawnRegion3
onready var region4: Area2D = $SpawnRegion4
onready var region5: Area2D = $SpawnRegion5
onready var region6: Area2D = $SpawnRegion6
onready var region7: Area2D = $SpawnRegion7
onready var region8: Area2D = $SpawnRegion8
onready var region9: Area2D = $SpawnRegion9
onready var region10: Area2D = $SpawnRegion10
onready var region11: Area2D = $SpawnRegion11

onready var timer: Timer = $"/root/Main/SpawnTimer"
onready var main: Main = $"/root/Main"

func _on_SpawnRegion_body_entered(body):
	playerEnterRegion(body, 1)


func _on_SpawnRegion2_body_entered(body):
	playerEnterRegion(body, 2)


func _on_SpawnRegion3_body_entered(body):
	playerEnterRegion(body, 3)


func _on_SpawnRegion4_body_entered(body):
	playerEnterRegion(body, 4)


func _on_SpawnRegion5_body_entered(body):
	playerEnterRegion(body, 5)


func _on_SpawnRegion6_body_entered(body):
	playerEnterRegion(body, 6)


func _on_SpawnRegion7_body_entered(body):
	playerEnterRegion(body, 7)


func _on_SpawnRegion8_body_entered(body):
	playerEnterRegion(body, 8)


func _on_SpawnRegion9_body_entered(body):
	playerEnterRegion(body, 9)

func _on_SpawnRegion10_body_entered(body):
	playerEnterRegion(body, 10)

func _on_SpawnRegion11_body_entered(body):
	playerEnterRegion(body, 11)

func _on_SpawnRegion_body_exited(body):
	playerExitRegion(body, 1)

func _on_SpawnRegion2_body_exited(body):
	playerExitRegion(body, 2)

func _on_SpawnRegion3_body_exited(body):
	playerExitRegion(body, 3)

func _on_SpawnRegion4_body_exited(body):
	playerExitRegion(body, 4)

func _on_SpawnRegion5_body_exited(body):
	playerExitRegion(body, 5)

func _on_SpawnRegion6_body_exited(body):
	playerExitRegion(body, 6)

func _on_SpawnRegion7_body_exited(body):
	playerExitRegion(body,67)

func _on_SpawnRegion8_body_exited(body):
	playerExitRegion(body, 8)

func _on_SpawnRegion9_body_exited(body):
	playerExitRegion(body, 9)

func _on_SpawnRegion10_body_exited(body):
	playerExitRegion(body, 10)
	
func _on_SpawnRegion11_body_exited(body):
	playerExitRegion(body, 11)

func playerEnterRegion(body, num):
	var typeNode = body.get_class()
	if not typeNode == "KinematicBody2D":
		return
		
		
	if num == 1:
		if timer.time_left == 0:
			spawn(num)
	if num == 2:
		if timer.time_left == 0:
			spawn(num)
	if num == 3:
		if timer.time_left == 0:
			spawn(num)
	if num == 4:
		if timer.time_left == 0:
			spawn(num)
	if num == 5:
		if timer.time_left == 0:
			spawn(num)
	if num == 6:
		if timer.time_left == 0:
			spawn(num)
	if num == 7:
		if timer.time_left == 0:
			spawn(num)
	if num == 8:
		if timer.time_left == 0:
			spawn(num)
	if num == 9:
		if timer.time_left == 0:
			spawn(num)
	if num == 10:
		if timer.time_left == 0:
			spawn(num)
	if num == 11:
		if timer.time_left == 0:
			spawn(num)
	
	print("Player Entered")
	
func playerExitRegion(body, num):
	var typeNode = body.get_class()
	if not typeNode == "KinematicBody2D":
		return
	print("Player Exited")


func _on_SpawnTimer_timeout():
	return
#	for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion".get_children():
#			if(spawn_location is Position2D): 
#				var enemy: Enemy
#				var rand_num = round(rand_range(0, 4))
#				if rand_num == 0:
#					enemy = main.FIRE_ARCHER_SCENE.instance()
#				elif rand_num == 1 or rand_num == 2:
#					enemy = main.SKELETON_SCENE.instance()
#				else:
#					enemy = main.OGRE_SCENE.instance()
#				enemy.position = spawn_location.position
#				$"/root/Main/World/EnemyHolder".add_child(enemy)
#				timer.start(3)
#			else:
#				return

func spawn(numb):
		match(numb):
			1: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			2: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion2".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			3: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion3".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			4: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion4".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			5: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion5".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			6: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion6".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			7: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion7".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			8: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion8".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			9: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion9".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			10: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion10".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
			11: for spawn_location in $"/root/Main/World/SpawnLocations/SpawnRegionContainer/SpawnRegion11".get_children():
				if(spawn_location is Position2D): 
					var enemy: Enemy
					var rand_num = round(rand_range(0, 4))
					if rand_num == 0:
						enemy = main.FIRE_ARCHER_SCENE.instance()
					elif rand_num == 1 or rand_num == 2:
						enemy = main.SKELETON_SCENE.instance()
					else:
						enemy = main.OGRE_SCENE.instance()
					enemy.position = spawn_location.global_position
					$"/root/Main/World/EnemyHolder".add_child(enemy)
					timer.start(2)
				else:
					return
