extends Control

var PlayerScore1 = 0
var PlayerScore2 = 0


func _ready():
	 pass	
		

func _on_ball_player_score(index):
	if index == 1:
		PlayerScore1 +=1
		get_node("Player 1").text = str(PlayerScore1)
		$ScroreSound.play()
		
		
	elif index == 2:
		 PlayerScore2 +=1
		 get_node("Player 2").text = str(PlayerScore2)
		 $ScroreSound.play()
	

	
	

