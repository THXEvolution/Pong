extends Node

var playerScore: int = 0 setget setPlayerScore
var computerScore: int = 0 setget setComputerScore
var _playerScore: int = 0
var _computerScore: int = 0

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


func _on_Goal_body_entered(body, which):
	if which == "Computer":
		self.playerScore += 1
	elif which == "Player":
		self.computerScore += 1
	
func setPlayerScore(score):
	playerScore = score
	$UI/PlayerScoreControl/PlayerScore.text = str(score)
	print("updating")
	
func setComputerScore(score):
	computerScore = score
	$UI/ComputerScoreControl/ComputerScore.text = str(score)
