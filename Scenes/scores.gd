extends Control


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Labe_Score.text = "Scores: " + str(int(Global.score))
	
	if(Global.gameover):
		$GameoverContainer.visible = true


func _on_button_pressed():
	Global.gameover = false
	Global.score = 0
	get_tree().reload_current_scene()


func _on_main_inteface_pressed():
	Global.gameover = false
	Global.score = 0
	get_tree().change_scene_to_file("res://Scenes/main_interface.tscn")
