extends Panel

var character = "test"

func _ready():
	pass 


func SaveGame():
	var save_file = File.new()
	save_file.open("user://character.save", File.WRITE)
	save_file.store_line(character)
	print("Saved!")
	save_file.close()


func LoadGame():
	var save_file = File.new()
	if not save_file.file_exists("user://character.save"):
		return
	save_file.open("user://savefile.save", File.READ)
	character = save_file.get_line()
	print("Loaded")
	save_file.close()


func _on_SinonButton_pressed():
	character = "Sinon"
	SaveGame()


func _on_LeafaButton_pressed():
	character = "Leafa"
	SaveGame()


func _on_AliceButton_pressed():
	character = "Alice"
	SaveGame()


func _on_AsunaButton_pressed():
	character = "Asuna"
	SaveGame()


func _on_SayakaButton_pressed():
	character = "Sayaka"
	SaveGame()


func _on_SoniaButton_pressed():
	character = "Sonia"
	SaveGame()


func _on_KyokoButton_pressed():
	character = "Kyoko"
	SaveGame()


func _on_ChiakiButton_pressed():
	character = "Chiaki"
	SaveGame()


func _on_ChikaButton_pressed():
	character = "Chika"
	SaveGame()


func _on_ZeroTwoButton_pressed():
	character = "ZeroTwo"
	SaveGame()


func _on_CCButton_pressed():
	character = "CC"
	SaveGame()


func _on_VioletButton_pressed():
	character = "Violet"
	SaveGame()
