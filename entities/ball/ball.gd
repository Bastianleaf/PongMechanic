extends CharacterBody2D


const MAX_HIT_COUNTER := 12


@export var initial_ball_speed := 700
@export var speed_commulator := 150
var ball_speed := initial_ball_speed
var direction := Vector2()
var hit_counter := 0
var rng = RandomNumberGenerator.new()

	
func set_start_direction() -> void:
	var random_x := 0
	
	if rng.randi() % 10 < 5:
		random_x = 1
	else:
		random_x = -1
	direction = Vector2(random_x, rng.randi_range(-1, 1))
	direction = direction.normalized() * ball_speed
	
func _physics_process(delta: float) -> void:
	var collision := move_and_collide(direction * delta)
	if collision:
		direction = direction.bounce(collision.get_normal())
		if collision.get_collider().is_in_group("rackets"):
			var y = direction.y / 2 + collision.get_collider_velocity().y
			direction = Vector2(direction.x, y).normalized() * (ball_speed + hit_counter * speed_commulator)
			
			if hit_counter < MAX_HIT_COUNTER:
				hit_counter += 1
			$RacketSound.play()
		else:
			$WallSound.play()
	
	
func reset() -> void:
	position = Vector2(1920 / 2, 1080 / 2)
	direction = Vector2()
	hit_counter = 0
