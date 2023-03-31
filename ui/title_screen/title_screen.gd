extends Control
signal start_1p_game
signal start_2p_game
signal exit_game

func _on_exit_pressed() -> void:
	emit_signal("exit_game")

func _on_1p_game_pressed() -> void:
	emit_signal("start_1p_game")


func _on_2p_game_pressed() -> void:
	emit_signal("start_2p_game")

