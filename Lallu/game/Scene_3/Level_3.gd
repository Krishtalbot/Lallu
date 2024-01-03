extends Node2D
var status = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	var pos = $Lallu.get_position_delta()
	$open_map.visible = false
	$close_map.visible = true
	$open_map/vortex/vortex_sprite.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_egg_body_entered(body):
	$open_map.visible = true
	$close_map.visible = false
	$close_map.queue_free()
	

func _on_vortex_body_entered(body):
	$open_map/vortex/vortex_sprite.visible = true


func _on_vortex_body_exited(body):
	$open_map/vortex/vortex_sprite.visible = false


func _on_finish_body_entered(body):
	#get_tree().change_scene_to_file("res://Finish/finish.tscn")
	pass

func _on_bomb_body_entered(body):
	#get_tree().change_scene_to_file("res://Finish/over.tscn")
	pass


func _on_bomb_2_body_entered(body):
	#get_tree().change_scene_to_file("res://Finish/over.tscn")
	pass


func _on_bomb_3_body_entered(body):
	#get_tree().change_scene_to_file("res://Finish/over.tscn")
	pass


func _on_bomb_4_body_entered(body):
	#get_tree().change_scene_to_file("res://Finish/over.tscn")
	pass


func _on_bomb_5_body_entered(body):
	#get_tree().change_scene_to_file("res://Finish/over.tscn")
	pass


