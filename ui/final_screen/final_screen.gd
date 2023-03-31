extends Control
signal play_again
signal exit

func set_result_message(message: String) -> void:
	$VBoxContainer/ResultMessage.set_text(message)


func _on_new_round_button_pressed() -> void:
	emit_signal("play_again")


func _on_exit_button_pressed() -> void:
	emit_signal("exit")
