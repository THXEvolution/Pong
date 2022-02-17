extends Area2D

signal ballEntered

func _on_Computer_body_entered(body):
	emit_signal("ballEntered")
