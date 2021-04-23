extends Panel

func _ready():
	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Store.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_StoreUpgradeButton_pressed():
		$Upgrades.visible = true


func _on_NewCharStoreButton_pressed():
	$Characters.visible = true


func _on_BackUpgradesButton_pressed():
	$Upgrades.visible = false


func _on_BackCharactersButton_pressed():
	$Characters.visible = false
