extends CharacterBody2D

@onready var ai_controller_1 = $AIController2D2
@onready var anim = $AnimatedSprite2D
@onready var lallu = $"."

var speed = 40
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	position += velocity * delta
	position.x = clamp(position.x, 26, screen_size.x - 26)
	position.y = clamp(position.y, 30, screen_size.y - 30)

func _physics_process(delta):
	var input_dir = Vector2.ZERO
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	if Input.is_action_pressed("up"):
		input_dir.y -= 1
	if Input.is_action_pressed("down"):
		input_dir.y += 1

	velocity.x = ai_controller_1.move.x * speed
	velocity.y = ai_controller_1.move.y * speed
	
	if velocity.x == 0 && velocity.y == 0:
		anim.stop()
	if velocity.x != 0 && velocity.x > 0:
		anim.play("right")
		# See the note below about boolean assignment.
	elif velocity.x != 0 && velocity.x < 0:
		anim.play("left")
	elif velocity.y != 0 && velocity.y > 0:
		anim.play("down")
	elif velocity.y != 0 && velocity.y < 0:
		anim.play("up")
		
	move_and_collide(velocity * delta)

func _on_collision_detector_area_entered(area):
	if area.is_in_group("egg"):
		print("egg")


func _on_egg_body_entered(_body: Node2D) -> void:
	ai_controller_1.reward += 0.5

func _on_area_2d_body_entered(_body: Node2D) -> void:
	position = Vector2(345,195)
	ai_controller_1.reward -= 0.5
	
func _on_area_2d_body_exited(_body: Node2D) -> void:
	ai_controller_1.reward += 0


func _on_finish_body_entered(_body: Node2D) -> void:
	position = Vector2(345,195)
	ai_controller_1.reward += 1.0


func _on_vortex_body_entered(_body):
	ai_controller_1.reward += 0.5
