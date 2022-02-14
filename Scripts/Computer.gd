extends Area2D

signal ballEntered

var ballPosition: Vector2 = Vector2.ZERO

func _on_Computer_body_entered(body):
	emit_signal("ballEntered")
