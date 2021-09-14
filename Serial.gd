extends Node

const serial_res = preload("res://bin/gdserial.gdns")
onready var serial_port = serial_res.new()

var is_port_open = false
var text = ""

signal sobe(player)
signal desce(player)
signal potenciometro(player, value)


func _ready():
	open("COM3",9600)
	
func _exit_tree():
	close()

func open(port, boundrate):
	is_port_open = serial_port.open_port(port, boundrate)
	print(is_port_open)
	
func write(text):
	serial_port.write_text(text)
	
func close():
	is_port_open = false
	serial_port.close_port()

func _process(delta):
	if is_port_open:
		var t = serial_port.read_text()
		
		if t.length() > 0:
			for c in t:
				if c == "\n":
					on_text_received(text)
					text = ""
				else:
					text+=c
			#print(t)
		

func on_text_received(text): #"1 Sobe"
	var command_array = text.split(" ")
	#print(command_array)
	if command_array.size() < 2:
		return
		
	if str(command_array[1]) == "Sobe":
		emit_signal("sobe", command_array[0])
	elif command_array[1] == "Desce":
		emit_signal("desce", command_array[0])
	else:
		emit_signal("potenciometro", command_array[0], command_array[1])
