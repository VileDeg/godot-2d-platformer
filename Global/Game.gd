extends Node

const BASE_HEALTH = 10
const MIN_HEALTH = 0

var player_hp : int = BASE_HEALTH :
	set(value): 
		print("Health set to " + str(value))
		if value != player_hp:
			player_hp = value
			player_health_changed.emit(player_hp)
			if (player_hp < MIN_HEALTH):
				#die()
				player_dead.emit()
	get: return player_hp

var player_gold = 0

signal player_health_changed(value: int)

signal player_dead

func init_data():
	player_hp = BASE_HEALTH
	player_gold = 0


