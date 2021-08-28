extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 300
var ball


# Called when the node enters the scene tree for the first time.
func _ready():
	ball = get_parent().find_node("ball")
	
func _physics_process(delta):
	move_and_slide(Vector2(0,get_opponent_directiong()) * speed)
	
func get_opponent_directiong():
	if abs (ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1	
	else: return 0
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
