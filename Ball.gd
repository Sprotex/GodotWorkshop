extends CharacterBody2D

const speed = 300.0

func _ready():
	velocity = Vector2.LEFT * speed

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
