extends KinematicBody2D

export var speed = 200
export var player= "p1"

# Called when the node enters the scene tree for the first time.
func _ready():
	Serial.connect("sobe",self,"_on_sobe")
	Serial.connect("desce", self , "_on_desce")
	

func _physics_process(delta):
   if Input.is_action_pressed("move_up"): move_and_collide(Vector2(0.0, -speed) * delta) 
   elif  Input.is_action_pressed("move_down"): move_and_collide(Vector2(0.0,speed) * delta) 

func _on_sobe(player_index):
	if player_index == player:
		move_and_collide(Vector2(0,-10))
		print(player_index + " Sobe")
		
func _on_desce(player_index):
	if player_index == player:
		move_and_collide(Vector2(0, 10))
		print(player_index + " Desce")	
