extends Area2D

signal ballEntered

var moving: bool = true

func _on_Computer_body_entered(body):
	moving = false
	emit_signal("ballEntered")


func _on_Computer_body_exited(body):
	moving = true
