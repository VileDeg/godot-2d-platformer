extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

var alive = true

const SPEED = 150

const GOLD_PER_KILL = 5
const HEALTH_PER_HIT = 3

@onready var animated_sprite = get_node("AnimatedSprite2D")

func _ready():
	animated_sprite.play("Idle")

func _physics_process(delta):
	if !alive:
		return
		
	velocity.y += gravity * delta
	
	if chase:
		player = get_node("../../Players/Player")
		animated_sprite.play("Jump")
		
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * SPEED
		
		if direction.x > 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
	else:
		velocity.x = 0	
		animated_sprite.play("Idle")
		
	move_and_slide()
	
func _process(delta):
	pass	

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "Player":
		death()
	


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		Game.player_hp -= HEALTH_PER_HIT


func death():
	Game.player_gold += GOLD_PER_KILL
	alive = false
	animated_sprite.play("Death")
	await animated_sprite.animation_finished
	self.queue_free()
