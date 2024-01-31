extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.player_health_changed.connect(update_text)
	update_text(Game.player_hp)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_text(hp):
	text = "HP: " + str(hp)
