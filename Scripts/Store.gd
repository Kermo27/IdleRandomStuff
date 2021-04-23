extends Panel

var gold = 0
var storeCount = 0.1

var multiplier = 1.15

var plusOnePrice = 15
var plusOneLevel = 1

var plusTwoPrice = 100
var plusTwoLevel = 1

var plusThreePrice = 500
var plusThreeLevel = 1

var plusFourPrice = 3000
var plusFourLevel = 1

var plusFivePrice = 10000
var plusFiveLevel = 1

var plusSixPrice = 40000
var plusSixLevel = 1

var plusSevenPrice = 200000
var plusSevenLevel = 1

var plusEightPrice = 1666666
var plusEightLevel = 1

var plusNinePrice = 123456789
var plusNineLevel = 1

var plusTenPrice = 3999999999
var plusTenLevel = 1

var plusElevenPrice = 75000000000
var plusElevenLevel = 1

var character = "test"

func _ready():
	LoadCharacter()
	LoadGame()
	UpdateUI()
	$"ClickButton".texture_normal = load("res://Pictures/"+character+".png")


func UpdateUI():
	$GoldLabel.text = str(round_to_dec(gold, 2)) + "g"
	$StoreCount.text = str(round_to_dec(storeCount, 2))


func _on_Button_pressed():
	gold = gold + storeCount
	UpdateUI()


func alert(text: String, title: String='Message') -> void:
	var dialog = AcceptDialog.new()
	dialog.dialog_text = text
	dialog.window_title = title
	dialog.connect('modal_closed', dialog, 'queue_free')
	add_child(dialog)
	dialog.popup_centered()


func SaveGame():
	var save_file = File.new()
	save_file.open("user://savefile.save", File.WRITE)
	save_file.store_line(str(gold))
	save_file.store_line(str(storeCount))
	save_file.store_line(str(plusOneLevel))
	save_file.store_line(str(plusOnePrice))
	save_file.store_line(str(plusTwoLevel))
	save_file.store_line(str(plusTwoPrice))
	save_file.store_line(str(plusThreeLevel))
	save_file.store_line(str(plusThreePrice))
	save_file.store_line(str(plusFourLevel))
	save_file.store_line(str(plusFourPrice))
	save_file.store_line(str(plusFiveLevel))
	save_file.store_line(str(plusFivePrice))
	save_file.store_line(str(plusSixLevel))
	save_file.store_line(str(plusSixPrice))
	save_file.store_line(str(plusSevenLevel))
	save_file.store_line(str(plusSevenPrice))
	save_file.store_line(str(plusEightLevel))
	save_file.store_line(str(plusEightPrice))
	save_file.store_line(str(plusNineLevel))
	save_file.store_line(str(plusNinePrice))
	save_file.store_line(str(plusTenLevel))
	save_file.store_line(str(plusTenPrice))
	save_file.store_line(str(plusElevenLevel))
	save_file.store_line(str(plusElevenPrice))
	print("Saved!")
	save_file.close()

func LoadGame():
	var save_file = File.new()
	if not save_file.file_exists("user://savefile.save"):
		return
	save_file.open("user://savefile.save", File.READ)
	gold = float(save_file.get_line())
	storeCount = float(save_file.get_line())
	plusOneLevel = int(save_file.get_line())
	plusOnePrice = float(save_file.get_line())
	plusTwoLevel = int(save_file.get_line())
	plusTwoPrice = float(save_file.get_line())
	plusThreeLevel = int(save_file.get_line())
	plusThreePrice = float(save_file.get_line())
	plusFourLevel = int(save_file.get_line())
	plusFourPrice = float(save_file.get_line())
	plusFiveLevel = int(save_file.get_line())
	plusFivePrice = float(save_file.get_line())
	plusSixLevel = int(save_file.get_line())
	plusSixPrice = float(save_file.get_line())
	plusSevenLevel = int(save_file.get_line())
	plusSevenPrice = float(save_file.get_line())
	plusEightLevel = int(save_file.get_line())
	plusEightPrice = float(save_file.get_line())
	plusNineLevel = int(save_file.get_line())
	plusNinePrice = float(save_file.get_line())
	plusTenLevel = int(save_file.get_line())
	plusTenPrice = float(save_file.get_line())
	plusElevenLevel = int(save_file.get_line())
	plusElevenPrice = float(save_file.get_line())
	print("Loaded")
	save_file.close()
	
func LoadCharacter():
	var save_file = File.new()
	if not save_file.file_exists("user://character.save"):
		return
	save_file.open("user://character.save", File.READ)
	character = save_file.get_line()
	print("Loaded")
	save_file.close()


func _on_SaveButton_pressed():
	SaveGame()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)


func _on_PlusOneButton_pressed():
	if gold < plusOnePrice-0.1:
		print(gold)
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 0.1
		gold -= plusOnePrice
		plusOnePrice *= pow(multiplier, plusOneLevel)
		plusOneLevel += 1
		UpdateUI()


func _on_PlusTwoButton_pressed():
	if gold < plusTwoPrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 0.5 
		gold -= plusTwoPrice
		plusTwoPrice *= pow(multiplier, plusTwoLevel)
		plusTwoLevel += 1
		UpdateUI()


func _on_PlusThreeButton_pressed():
	if gold < plusThreePrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 4 
		gold -= plusThreePrice
		plusThreePrice *= pow(multiplier, plusThreeLevel)
		plusThreeLevel += 1
		UpdateUI()


func _on_PlusFourButton_pressed():
	if gold < plusFourPrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 10
		gold -= plusFourPrice
		plusFourPrice *= pow(multiplier, plusFourLevel)
		plusFourLevel += 1
		UpdateUI()


func _on_PlusFiveButton_pressed():
	if gold < plusFivePrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 40 
		gold -= plusFivePrice
		plusFivePrice *= pow(multiplier, plusFiveLevel)
		plusFiveLevel += 1
		UpdateUI()


func _on_PlusSixButton_pressed():
	if gold < plusSixPrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 100 
		gold -= plusSixPrice
		plusSixPrice *= pow(multiplier, plusSixLevel)
		plusSixLevel += 1
		UpdateUI()


func _on_PlusSevenButton_pressed():
	if gold < plusSevenPrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 400 
		gold -= plusSevenPrice
		plusSevenPrice *= pow(multiplier, plusSevenLevel)
		plusSevenLevel += 1
		UpdateUI()


func _on_PlusEightButton_pressed():
	if gold < plusEightPrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 6666 
		gold -= plusEightPrice
		plusEightPrice *= pow(multiplier, plusEightLevel)
		plusEightLevel += 1
		UpdateUI()


func _on_PlusNineButton_pressed():
	if gold < plusNinePrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 98765 
		gold -= plusNinePrice
		plusNinePrice *= pow(multiplier, plusNineLevel)
		plusNineLevel += 1
		UpdateUI()


func _on_PlusTenButton_pressed():
	if gold < plusTenPrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 999999 
		gold -= plusTenPrice
		plusTenPrice *= pow(multiplier, plusTenLevel)
		plusTenLevel += 1
		UpdateUI()


func _on_PlusElevenButton_pressed():
	if gold < plusElevenPrice-0.1:
		alert("Nie mozesz kupic ulepszenia", "Blad")
	else:
		storeCount += 10000000 
		gold -= plusElevenPrice
		plusElevenPrice *= pow(multiplier, plusElevenLevel)
		plusElevenLevel += 1
		UpdateUI()



