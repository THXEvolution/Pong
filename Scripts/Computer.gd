extends KinematicBody2D

signal ballEntered

var moving: bool = true
var velocity: Vector2 = Vector2.ZERO setget setVelocity
export var maxSpeed: float = 150
var speed: float = 20 setget setSpeed

func _on_Computer_body_entered(body):
	moving = false
	emit_signal("ballEntered")


func _on_Computer_body_exited(body):
	moving = true

func setVelocity(value):
	velocity = value.normalized() * speed
	move_and_slide(velocity)

func setSpeed(value):
	speed = clamp(value, -maxSpeed, maxSpeed)
	self.velocity = velocity.normalized() * speed
