extends Area2D

signal ballEntered

export var speed: float = 100.0

func _process(delta):
	var direction: Vector2 = Vector2.ZERO
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	position += direction * delta * speed

func _on_Player_body_entered(body):
	emit_signal("ballEntered")
