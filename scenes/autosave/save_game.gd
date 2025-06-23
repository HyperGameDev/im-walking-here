extends Node
# this can be created as a class_name (and I believe use static functions, don't quote me) or just include it in your autoload script

# the save game needs to be created before load will work
func _ready() -> void:
	
	#save_game()
	load_game()

var Highscore : int = 0
var Highscore_string: String = "HighScore_v2"

# I'm not sure why test3 is appended in the dict first, but it doesn't really matter if we access the information correctly
func saveData() -> Dictionary:
	var save_dict :Dictionary= {
		

		Highscore_string = Highscore
	}
	return save_dict


func save_game() -> void:
	# this saves to "C:\Users\XXX\AppData\Roaming", accessible by typing %appdata% in your run window, I'm not sure where for browser
	var save_data :FileAccess = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string : String= JSON.stringify(saveData())
	save_data.store_line(json_string)


func load_game() -> void:
	# if there isn't a save, end the function (I need to do this more)
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_data :FileAccess= FileAccess.open("user://savegame.save", FileAccess.READ)
	
	# while the length of the save data is longer than the length of the newly unpacked string, continue
	while save_data.get_position() < save_data.get_length():
		var json_string : String = save_data.get_line()
		var json : JSON= JSON.new()
		json.parse(json_string)
		var nodeData : Dictionary = json.get_data()
		
		if not nodeData.has(Highscore_string):
			return
			
		if Highscore <= nodeData.get(Highscore_string):
			Highscore = nodeData.get(Highscore_string)
