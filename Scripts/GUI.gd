extends Control

var icons_butons = [
	"res://Sprites/plus_white.png", 
	"res://Sprites/plus_orange.png", 
	"res://Sprites/minus_white.png", 
	"res://Sprites/minus_orange.png"
]


func _ready():
	pass


func _on_btn_plus_pressed():
	save_system.contador += 1
	$menu/central_button/btn_plus.icon = load(icons_butons[1])
	$menu/central_button/btn_plus/time_recovery_icon.start()


func _on_btn_menos_pressed():
	save_system.contador -= 1
	$menu/central_button/btn_menos.icon = load(icons_butons[3])
	$menu/central_button/btn_menos/timer_recovery_icon.start()





func _on_time_recovery_icon_timeout():
	$menu/central_button/btn_plus.icon = load(icons_butons[0])


func _on_timer_recovery_icon_menos_timeout():
	$menu/central_button/btn_menos.icon = load(icons_butons[2])


func _on_btn_save_pressed():
	save_system.save()


func _on_btn_load_pressed():
	save_system._load()
	$menu/display_message.text = str(save_system.contador)
