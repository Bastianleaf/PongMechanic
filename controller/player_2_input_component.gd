extends Node
var player: CharacterBody2D
var ai: = true
@export  var ball_path: NodePath
@onready var ball = get_node(ball_path)
var racket: CharacterBody2D

func _ready() -> void:
	racket = get_parent()
	
func _physics_process(delta: float) -> void:
	if ai:
		_calculate_velocity()
	else:
		racket.direction = Vector2()
		if Input.is_action_pressed("2p_up"):
			racket.direction.y -= 1
		if Input.is_action_pressed("2p_down"):
			racket.direction.y += 1

func _calculate_velocity() -> void:
	racket.direction = Vector2(0, _get_ball_direction())

func _get_ball_direction() -> int:
	if abs(racket.position.y - ball.position.y) > 20:
		if racket.position.y < ball.position.y:
			return 1
		else:
			return -1
	else:
		return 0
