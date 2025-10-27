extends Control
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:	
	position = player.position
	get_tree().paused = true
	
func _on_button_pressed() -> void:
	if is_in_group("1"):
		player.health += 10
		print(player.health)
	if is_in_group("2"):
		player.speed+=100
	if is_in_group("3"):
		player.sword.damage += 5
	get_tree().paused = false
	queue_free()
