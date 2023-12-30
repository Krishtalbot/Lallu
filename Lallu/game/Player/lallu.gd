extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var speed = 200
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

	velocity = input_dir.normalized() * speed
	
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
