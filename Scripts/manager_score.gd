extends Node2D

var ja_tocou = false
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.gameover and !ja_tocou):
		$AudioBackground.stop()
		$AudioGameOver.play(0)
		ja_tocou = true
