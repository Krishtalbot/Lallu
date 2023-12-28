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
