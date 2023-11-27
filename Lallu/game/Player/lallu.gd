extends Area2D

signal hit
@export var speed = 400
var screen_size
@onready var anim = $AnimatedSprite2D

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1


	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		anim.play()
	else:
		anim.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 26, screen_size.x - 26)
	position.y = clamp(position.y, 30, screen_size.y - 30)
	
	if velocity.x != 0 && velocity.x > 0:
		anim.animation = "right"
		# See the note below about boolean assignment.
	elif velocity.x != 0 && velocity.x < 0:
		anim.animation = "left"
	elif velocity.y != 0 && velocity.y > 0:
		anim.animation = "down"
	elif velocity.y != 0 && velocity.y < 0:
		anim.animation = "up"


func _on_body_entered(body):
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

#func start(pos):
#	position = pos
#	show()
#	$CollisionShape2D.disabled = false
