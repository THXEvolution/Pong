extends Node

func _physics_process(delta):
	$Computer.ballPosition = $Ball.position

func _on_ballEntered():
	$Ball.methodToCall = "switchDirection" # Replace with function body.
