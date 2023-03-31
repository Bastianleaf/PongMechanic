extends Node
var player: CharacterBody2D

func _ready() -> void:
	player = get_parent()

func _physics_process(delta: float) -> void:
	player.direction = Vector2()
	if Input.is_action_pressed("1p_up"):
		player.direction.y -= 1
	if Input.is_action_pressed("1p_down"):
		player.direction.y += 1

