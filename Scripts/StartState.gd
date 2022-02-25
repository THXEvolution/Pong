extends Node

var fsm: StateMachine

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)

func process(delta):
	return delta

func physics_process(delta):
	return delta
