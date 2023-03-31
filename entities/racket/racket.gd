extends CharacterBody2D

@export var move_speed := 10
var direction := Vector2()

func _physics_process(delta: float) -> void:
	if direction.length() > 0:
		direction = direction.normalized() * move_speed
		move_and_collide(direction)

