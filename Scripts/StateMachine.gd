extends Node

class_name StateMachine

var state: Object

func _ready():
	state = get_child(0)
	_enter_state()
	
func change_to(new_state):
	state = get_node(new_state)
	_enter_state()

func _enter_state():
	state.fsm = self
	state.enter()

func _process(delta):
	if state.has_method("process"):
		state.process(delta)

func _physics_process(delta):
	if state.has_method("physics_process"):
		state.physics_process(delta)
