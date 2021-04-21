extends Panel

func _ready():
	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Store.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
