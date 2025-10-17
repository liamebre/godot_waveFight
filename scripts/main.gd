extends Node2D
@export var mob_scene: PackedScene
var score
var level = 1

func _ready():
	new_game()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)

	$StartTimer.start()
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.global_position

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)

func _process(_delta):
	if score == level * 15:
		$MobTimer.stop()
		$ScoreTimer.stop()
	if $Player.score == level * 20 :
		$MobTimer.start()
		$ScoreTimer.start()
		level = level + 1
