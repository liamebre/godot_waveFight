extends weapons

var active = true: set = set_active

func set_active(value):
	active = value
	set_process(value)
	set_process_input(value)
	
func _ready():
	print("sword")
	damage = 5
	speed = 0.5
	maxAngle = 180
	$AttackTime.wait_time = speed
	$AttackTime.start()
	$AnimatedSprite2D.play()
	
func _process(_delta):
	pass
	
func _on_body_shape_entered(_body):
	_body.health -= damage
	
func _on_attack_time_timeout() -> void:
	queue_free()
