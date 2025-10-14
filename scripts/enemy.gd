extends RigidBody2D
@onready var player: CharacterBody2D = $"../Player"

var health = 20
var active = true: set = set_active

func set_active(value):
	active = value
	set_process(value)
	set_process_input(value)
	
func _ready() -> void:
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	
func _on_visible_onscreen_notifier_2d_screen_exited():
	queue_free()
	
func _physics_process(_delta):
	var motion = Vector2()
	position += (player.position - position)/50
	motion += position.direction_to(player.position)
	move_and_collide(motion)
	
