extends Node

func _physics_process(delta):
	if $Computer.moving:
		$Computer.position.y = $Ball.position.y

func _on_ballEntered(which):
	var delta: float = 0.0
	if which == "Player":
		delta = ($Ball.position.y - $Player.position.y) * $Ball.reflectFactor
	elif which == "Computer":
		delta = ($Ball.position.y - $Computer.position.y) * $Ball.reflectFactor
	$Ball.velocity.y = delta
	$Ball.methodToCall = "switchDirection"


func _on_Wall_body_entered(body):
	$Ball.methodToCall = "bounceOffWall"
