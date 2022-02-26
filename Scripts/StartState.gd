extends Node

var fsm: StateMachine
var ball: RigidBody2D
var startScreen: Control
var gameManager: Node

func enter():
	ball = get_node("../../Ball")
	startScreen = get_node("../../StartCanvas/StartScreen")
	gameManager = get_node("../..")
	
	ball.velocity = Vector2.ZERO
	startScreen.visible = true

func exit(next_state):
	startScreen.visible = false
	gameManager.playerScore = 0
	gameManager.computerScore = 0
	fsm.change_to(next_state)

func process(delta):
	return delta

func physics_process(delta):
	return delta


func _on_button_up(which):
	if which == "Start":
		exit("InitGame")
	elif which == "Quit":
		get_tree().quit()
