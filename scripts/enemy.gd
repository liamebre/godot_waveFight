extends RigidBody2D

func _ready() -> void:
	pass
	
func _on_visible_onscreen_notifier_2d_screen_exited():
	queue_free()
	
