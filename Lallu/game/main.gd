extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scene_1_pressed():
	get_tree().change_scene_to_file("res://Scene_1/Level_1.tscn")


func _on_scene_2_pressed():
	get_tree().change_scene_to_file("res://Scene_2/Scene_2.tscn")


func _on_scene_3_pressed():
	get_tree().change_scene_to_file("res://Scene_3/Level_3.tscn")
