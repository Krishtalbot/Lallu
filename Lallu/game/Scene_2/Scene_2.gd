extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$openMap.visible = false
	$closeMap.visible = true
	$openMap/vortex/Vortex.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_egg_body_exited(body):
	$closeMap.clear()
	$openMap.visible = true
	$closeMap.visible = false
	$openMap/vortex/Vortex.visible = false
	
	
	print("Detected")


func _on_area_2d_body_entered(CharacterBody2D):
	$openMap/vortex/Vortex.visible = true


func _on_finish_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene_to_file("res://Scene_3/Level_3.tscn")


func _on_vortex_body_exited(body):
	$openMap/vortex/Vortex.visible = false
