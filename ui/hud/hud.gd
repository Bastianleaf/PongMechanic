extends Control


# Called when the node enters the scene tree for the first time.
func update_score_player_one(new_score: String) -> void:
	$HBoxContainer/ScorePlayerOne.set_text(new_score)

func update_score_player_two(new_score: String) -> void:
	$HBoxContainer/ScorePlayerTwo.set_text(new_score)

func update_action_text(new_text: String) -> void:
	$CountDownContainer/CenterContainer/ActionText.set_text(new_text)

func hide_countdown() -> void:
	if get_node("CountDownContainer"):
		$CountDownContainer.visible = false

func show_countdown() -> void:
	$CountDownContainer.visible = true
	
