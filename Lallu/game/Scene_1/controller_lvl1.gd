extends AIController2D

var move = Vector2.ZERO

@onready var lallu = $".."
@onready var finish = $"../../open_map/finish"
@onready var vortex = $"../../open_map/vortex"

func get_obs() -> Dictionary:
	var obs := [
		lallu.position.x,
		lallu.position.y,
		finish.position.x,
		finish.position.y,
		vortex.position.x,
		vortex.position.y,
	] 
	return {"obs":obs}

func get_reward() -> float:	 
		return reward
	
func get_action_space() -> Dictionary: 
	return {
		"move" : {
			"size": 2,
			"action_type": "continuous"
		},
		}
	
func set_action(action) -> void:	
	move.x = action["move"][0]
	move.y = action["move"][1]
