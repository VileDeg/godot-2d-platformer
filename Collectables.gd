extends Node2D


var gem_scene = preload("res://Collectables/Gem.tscn")

@onready var gems_node = get_node("Gems")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var gem_instance = gem_scene.instantiate()
	var rng = RandomNumberGenerator.new()
	var x = rng.randi_range(10, 800)
	#print("Timeout")
	gem_instance.position = Vector2(x, 400)
	gems_node.add_child(gem_instance)
	
