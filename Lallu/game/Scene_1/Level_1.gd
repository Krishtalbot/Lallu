extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var pos = $Lallu.get_position_delta()
	$open_map.visible = false
	$close_map.visible = true
	$open_map/vortex/Vortex.visible = false
	print(pos)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_egg_body_entered(_body):
	$open_map.visible = true
	$close_map.visible = false
	$close_map.queue_free()
	
func _on_vortex_body_entered(_body):
	$open_map/vortex/Vortex.visible = true

func _on_vortex_body_exited(_body):
	$open_map/vortex/Vortex.visible = false
	
func _on_finish_body_entered(body):
	#get_tree().change_scene_to_file("res://Scene_2/Level_2.tscn")
	pass


