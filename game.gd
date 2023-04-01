extends Node

@onready var hud = get_node("Hud")
var score_player_one := 0
var score_player_two := 0
var max_score := 3
var game_on = false


func _process(delta: float) -> void:
	var time_left = $StartTimer.time_left
	if  time_left > 1:
		hud.update_action_text(str(round(time_left)))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().reload_current_scene()

func _on_field_goal_left() -> void:
	score_player_two += 1
	_update_score()
	if score_player_two < max_score:
		_start_new_round()
	else:
		_show_final_screen()


func _on_field_goal_right() -> void:
	score_player_one += 1
	_update_score()
	if score_player_one < max_score:
		_start_new_round()
	else:
		_show_final_screen()

func _start_new_round() -> void:
	hud.show_countdown()
	$Ball.reset()
	$Racket.set_position(Vector2(100, 540))
	$Racket2.set_position(Vector2(1821, 540))
	$StartTimer.start()

func _update_score() -> void:
	hud.update_score_player_one(str(score_player_one))
	hud.update_score_player_two(str(score_player_two))
	
func _reset_game() -> void:
	score_player_one = 0
	score_player_two = 0
	_update_score()
	_start_new_round()

func _on_start_timer_timeout() -> void:
	hud.hide_countdown()
	$Ball.set_start_direction()


func _show_final_screen() -> void:
	if score_player_one > score_player_two:
		$FinalScreen.set_result_message("1P WIN")
	else:
		$FinalScreen.set_result_message("2P WIN")
	$FinalScreen.visible = true

func _on_final_screen_play_again() -> void:
	$FinalScreen.visible = false
	_reset_game()

func _on_final_screen_exit() -> void:
	$FinalScreen.visible = false
	$TitleCanvas.show()


func _on_title_screen_start_game() -> void:
	$TitleCanvas.hide()
	


func _on_title_screen_exit_game() -> void:
	get_tree().quit()


func _on_title_screen_start_1p_game() -> void:
	$TitleCanvas.hide()
	$Racket2/Player2InputComponent.ai = true
	_reset_game()


func _on_title_screen_start_2p_game() -> void:
	$TitleCanvas.hide()
	$Racket2/Player2InputComponent.ai = false
	_reset_game()
