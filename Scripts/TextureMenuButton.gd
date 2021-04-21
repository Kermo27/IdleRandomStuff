extends MenuButton

var popup

func _ready():
	popup = get_popup()
	popup.add_item("test")
	popup.add_item("test2")
	popup.add_item("test3")
	popup.connect("id_pressed", self, "_on_item_pressed")

func _on_item_pressed(ID):
	print(popup.get_item_text(ID), " pressed")
	$"../TextureLook".texture = load("res://Pictures/"+popup.get_item_text(ID)+".png")
	$"../../ClickButton".texture_normal = load("res://Pictures/"+popup.get_item_text(ID)+".png")
	$"../../ClickButton".stretch_mode = 5
