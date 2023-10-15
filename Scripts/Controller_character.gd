extends CharacterBody2D


#var speed : Vector2
#var gravity = Vector2(0, 10)
#
#func _ready():
#	pass
#
#func _process(delta):
#	speed += gravity
#	move_and_slide()


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var exect_anim = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if(!Global.gameover):
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
		else:
			$AnimationPlayer.play("runner")
		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			$AnimationPlayer.play("jumping")
			$"../AudioJump".play(0)
			velocity.y = JUMP_VELOCITY
		

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
	#	var direction = Input.get_axis("ui_left", "ui_right")
	#	if direction:
	#		velocity.x = direction * SPEED
	#	else:
	#		velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
	else:
		if(!exect_anim):
			$AnimationPlayer.play("dying")
			exect_anim = true

