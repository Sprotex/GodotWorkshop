extends CharacterBody2D

@export var speed = 300.0
@onready var starting_x = global_position.x

func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, Input.get_axis("move_up", "move_down")) * speed
	move_and_slide()
	global_position.x = starting_x
