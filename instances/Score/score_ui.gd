extends Control

var PlayerScore1 = 0
var PlayerScore2 = 0

var count = 0


func _ready():
	$CountDownLabel.visible = false
		

func _on_ball_player_score(index):
	if index == 1:
		PlayerScore1 +=1
		get_node("Player 1").text = str(PlayerScore1)
		get_tree().call_group('BallGroup', 'stop')
		$CountDownLabel.text = str("G0!")
		$Timer.start()
		$CountDownLabel.visible = true
		$ScroreSound.play()
		
		
	elif index == 2:
		 PlayerScore2 +=1
		 get_node("Player 2").text = str(PlayerScore2)
		 get_tree().call_group('BallGroup', 'stop')
		 $CountDownLabel.text = str("G0!")
		 $Timer.start()
		 $CountDownLabel.visible = true
		 $ScroreSound.play()
	

func _on_Timer_timeout():
	get_tree().call_group('BallGroup', 'resertBall')
	$CountDownLabel.visible = false
