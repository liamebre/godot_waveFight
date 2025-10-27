extends Control
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:	
	position = player.position
	get_tree().paused = true
	
func _on_button_pressed() -> void:
	get_tree().paused = false
	queue_free()
