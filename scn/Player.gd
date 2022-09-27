extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpF : int = 500
var gravity : int = 800

var vel : Vector2 = Vector2()

#onready var sprite : Sprite = $PlatformCharIdle

func _physics_process(delta):
	vel.x = 0
	# Movement and Inputs
	if Input.is_action_pressed("Move_left"):
		vel.x -= speed
		$PlatformCharIdle.play("Walk")
		$PlatformCharIdle.flip_h = true
	elif Input.is_action_pressed("Move_right"):
		vel.x += speed
		$PlatformCharIdle.play("Walk")
		$PlatformCharIdle.flip_h = false
	else:
		$PlatformCharIdle.play("Idle")
		
	if not is_on_floor():
		$PlatformCharIdle.play("Air")
	
	# Applying the Velocity
	vel = move_and_slide(vel, Vector2.UP)	
	
	# Gravity
	vel.y += gravity * delta
	
	# Jump Inputs
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		vel.y -= jumpF
	
	

