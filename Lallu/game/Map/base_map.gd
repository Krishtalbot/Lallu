extends TileMap
var path = ["res://Scene_1/Level_1.tscn","res://Scene_2/Scene_2.tscn","res://Scene_3/Level_3.tscn"]
var path_index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finish_body_entered(body):
	path_index += 1
	get_tree().change_scene_to_file(path_index)


func _on_vortex_body_entered(body):
	$vortex/Vortex.visible = true


func _on_vortex_body_exited(body):
	$vortex/Vortex.visible = false
