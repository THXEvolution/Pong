extends Node

var fsm: StateMachine
var gameManager: Node

func enter():
	gameManager = get_node("../..")

func exit(next_state):
	fsm.change_to(next_state)

func process(delta):
	return delta

func physics_process(delta):
	return delta

func scored():
	if gameManager.playerScore == gameManager.maxScore or gameManager.computerScore == gameManager.maxScore:
		exit("EndState")
	else:
		exit("InitGame")
