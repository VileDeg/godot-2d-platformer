extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#Utils.save_game()
	#tils.load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()
	
func _on_play_pressed():
	Game.init_data()
	get_tree().change_scene_to_file("res://world.tscn")
