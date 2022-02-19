extends Area2D

signal ballEntered

export var speed: float = 100.0
var ballPosition: Vector2 = Vector2.ZERO
var moving: bool = true

func _process(delta):
	var direction: Vector2 = Vector2.ZERO
	
	if moving:
		direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	position += direction * delta * speed

func _on_Player_body_entered(body):
	moving = false
	emit_signal("ballEntered")


func _on_Player_body_exited(body):
	moving = true
