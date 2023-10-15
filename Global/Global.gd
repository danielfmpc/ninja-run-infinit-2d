extends Node


var score = 0
var gameover = false

var file_record = "user://recored.save"
var record

func _ready():
	load_record()

func load_record():
	if(FileAccess.file_exists(file_record)):
		var f = FileAccess.open(file_record,FileAccess.READ)
		record = f.get_var()
		f.close()
	else: 
		record = 0

func save_record():
	var f = FileAccess.open(file_record,FileAccess.WRITE)
	f.store_var(record)
	f.close()
