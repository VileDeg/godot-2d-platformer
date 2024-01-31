extends Area2D


const GOLD_PER_PICK: int = 2
const FLY_UP_DISTANCE: int = 50
const FLY_UP_TIME: float = 0.35

func _ready():
	#get_node("AnimatedSprite2D").play("Shine")
	pass

func _on_body_entered(body):
	if body.name == "Player":
		Game.player_gold += GOLD_PER_PICK
		var tween   = get_tree().create_tween().set_parallel(true)
		var delay = FLY_UP_TIME
		
		tween.tween_property(self, "position", position - Vector2(0, FLY_UP_DISTANCE), delay)
		tween.tween_property(self, "modulate:a", 0, delay)
		
		await tween.finished
		queue_free()
		
