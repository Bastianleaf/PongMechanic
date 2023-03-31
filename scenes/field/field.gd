extends Node2D

signal goal_left
signal goal_right

func _on_goal_left_body_entered(body: Node2D) -> void:
	emit_signal("goal_left")


func _on_goal_right_body_entered(body: Node2D) -> void:
	emit_signal("goal_right")
