extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$open_map.visible = false
	$close_map.visible = true
	$open_map/vortex/Vortex.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_egg_body_entered(body):
	$open_map.visible = true
	$close_map.visible = false
	$close_map.queue_free()

func _on_vortex_body_entered(body):
	$open_map/vortex/Vortex.visible = true

func _on_vortex_body_exited(body):
	$open_map/vortex/Vortex.visible = false
	
func _on_finish_body_entered(body):
	get_tree().change_scene_to_file("res://Scene_3/Level_3.tscn")



