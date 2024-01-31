extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer")
@onready var sprite = get_node("AnimatedSprite2D")


func die():
	queue_free()
	get_tree().change_scene_to_file("res://main.tscn")

func _ready():
	Game.player_dead.connect(die)
	#health_changed.emit(health)
	#anim.play("Idle")
	pass
	
func _process(delta):
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 0:
			anim.play("Fall")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction < 0: # Left
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	if direction != 0: # Running left or right
		velocity.x = direction * SPEED
		if velocity.y == 0: # On floor
			anim.play("Run")
	else: # Idle
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0: # On floor
			anim.play("Idle")

	move_and_slide()
