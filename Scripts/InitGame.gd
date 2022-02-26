extends Node

var fsm: StateMachine
var ball: RigidBody2D
var gameManager: Node

func enter():
	ball = get_node("../../Ball")
	gameManager = get_node("../..")
	
	gameManager.get_node("Player").position.y = 300
	gameManager.get_node("Computer").position.y = 300
	ball.velocity = Vector2.ZERO
	ball.reset = true
	
	var t = Timer.new()
	t.set_wait_time(2)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	if gameManager.playerScored:
		ball.velocity = Vector2.LEFT
	else:
		ball.velocity = Vector2.RIGHT
	
	exit("InGame")

func exit(next_state):
	fsm.change_to(next_state)

func process(delta):
	return delta

func physics_process(delta):
	return delta
