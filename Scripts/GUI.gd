extends Control

# Lista dos endereços das texturas dos botões
var icons_butons = [
	"res://Sprites/plus_white.png", 
	"res://Sprites/plus_orange.png", 
	"res://Sprites/minus_white.png", 
	"res://Sprites/minus_orange.png"
]


func _ready():
	pass

# Método de ação do botão mais
func _on_btn_plus_pressed():
	save_system.contador += 1 # Incrementa o contador 
	$menu/central_button/btn_plus.icon = load(icons_butons[1]) # Carrega a textura do icone do botão
	$menu/central_button/btn_plus/time_recovery_icon.start() # inicia o contador para restaurar a textura do botão

# Método de ação do botão menos
func _on_btn_menos_pressed():
	save_system.contador -= 1 # Decrementa o contador 
	$menu/central_button/btn_menos.icon = load(icons_butons[3]) # Carrega a textura do icone do botão
	$menu/central_button/btn_menos/timer_recovery_icon.start() # inicia o contador para restaurar a textura do botão

# Recovery da textura do botão 
func _on_time_recovery_icon_timeout():
	$menu/central_button/btn_plus.icon = load(icons_butons[0])

# Recovery da textura do botão 
func _on_timer_recovery_icon_menos_timeout():
	$menu/central_button/btn_menos.icon = load(icons_butons[2])

# Ação de salvamento 
func _on_btn_save_pressed():
	save_system.save()

# Ação de carregamento e atualização do node display_message
func _on_btn_load_pressed():
	save_system._load()
	$menu/display_message.text = str(save_system.contador)
