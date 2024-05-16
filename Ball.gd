extends CharacterBody2D

@export var speed = 300.0
@export var bounce_speed_multiplier = 1.1
@export var bounce_audio: AudioStreamPlayer2D
@onready var start_position = global_position

func _ready():
	reset()

func reset():
	if randf() > 0.5:
		velocity = Vector2.LEFT
	else:
		velocity = Vector2.RIGHT
	if randf() > 0.5:
		velocity += Vector2.UP
	else:
		velocity += Vector2.DOWN
	velocity *= speed
	velocity = velocity.limit_length(speed)
	global_position = start_position

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal()) * bounce_speed_multiplier
		bounce_audio.play()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self:
		reset()
