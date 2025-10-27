extends Control
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:	
	position = player.position
	get_tree().paused = true
	
func _on_button_1_pressed() -> void:
	player.speed += 50
	print("1")

func _on_button_2_pressed() -> void:
	print("2")

func _on_button_3_pressed() -> void:
	player.health+= 30
	print("3")
	
func _on_button_pressed() -> void:
	print(player.health)
	print(player.speed)
	get_tree().paused = false
	queue_free()
	
