extends CharacterBody2D

@export var speed = 300.0
@export var ball: Node2D
@onready var starting_x = global_position.x

func _physics_process(_delta):
	velocity = (ball.global_position - global_position) * 10
	velocity.x = 0
	velocity = velocity.limit_length(speed)
	move_and_slide()
	global_position.x = starting_x
