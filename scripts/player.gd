extends Area2D
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var t = 0.0#total time past
var dash = false #if im dashing
var dashDist = 200#how far i dash
var lastDash = 0.0#the last time i dashed
var moveLeft = false#is playermoving left 
var moveRight = false#is player moving right
var moveUp = false#is player mpving up
var moveDown = false#is player moving down


func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	t += delta#updates the total time 
	var currDashDist = dashDist #makes a temp version of dashDist to modify
	var currSpeed = speed #makes a temp version of speed to modify
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		moveRight = true
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		moveLeft = true
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		moveDown = true
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		moveUp = true 

	var horizontal = moveRight || moveLeft
	var vertical = moveUp || moveDown
	
	if (horizontal && vertical):
		currSpeed /= 1.414
		currDashDist /= 1.414
		
	if Input.is_action_just_pressed("dash"):
		dashing(velocity,currDashDist)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * currSpeed
	position += velocity * delta

	
	moveLeft = false
	moveRight = false
	moveUp = false
	moveDown = false	
	
func dashing(velocity,currDashDist):
	if (t - lastDash > 0.50):
		var tween = get_tree().create_tween()
		tween.tween_property(self,"position",position + (velocity * currDashDist), 0.2)
		lastDash = t




func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
