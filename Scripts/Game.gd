extends Node

var playerScore: int = 0 setget setPlayerScore
var computerScore: int = 0 setget setComputerScore
var playerScored: bool = true
var maxScore: int = 1
var ball = load("res://Scenes/Ball.tscn").instance()
var _playerScore: int = 0
var _computerScore: int = 0

func _ready():
	randomize()
	if randi() % 2:
		playerScored = false

func _physics_process(delta):
	#if $Computer.moving and $Ball != null:
		#$Computer.position.y = $Ball.position.y
	pass

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
		playerScored = true
		self.playerScore += 1
	elif which == "Player":
		playerScored = false
		self.computerScore += 1
	$StateMachine/InGame.scored()
	
func setPlayerScore(score):
	playerScore = score
	$UI/PlayerScoreControl/PlayerScore.text = str(score)
	
func setComputerScore(score):
	computerScore = score
	$UI/ComputerScoreControl/ComputerScore.text = str(score)
