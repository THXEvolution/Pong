extends Node

var fsm: StateMachine
var ball: RigidBody2D
var gameManager: Node
var startScreen: Node

func enter():
	ball = get_node("../../Ball")
	gameManager = get_node("../..")
	startScreen = get_node("../../StartCanvas/StartScreen")
	
	gameManager.get_node("Player").position.y = 300
	gameManager.get_node("Computer").position.y = 300
	ball.velocity = Vector2.ZERO
	ball.reset = true
	
	startScreen.get_node("Start").text = "Restart"
	if gameManager.playerScored:
		startScreen.get_node("Title").text = "Du hast gewonnen!"
	else:
		startScreen.get_node("Title").text = "Du hast leider verloren!"
	startScreen.visible = true
	
	exit("InGame")

func exit(next_state):
	fsm.change_to(next_state)

func process(delta):
	return delta

func physics_process(delta):
	return delta
