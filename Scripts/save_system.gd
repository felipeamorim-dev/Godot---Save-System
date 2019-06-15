extends Node

const SAVE_PATH = "user://save_system.data"
var contador = 0 setget set_contador

signal update_display_message

func set_contador(valor):
	contador = valor 
	emit_signal("update_display_message")

func save():
	var arquivo = File.new()
	var erro = arquivo.open(SAVE_PATH, File.WRITE)
	var dados = {"contador" : contador}
	if not erro:
		arquivo.store_var(dados)
	else:
		print("O contador não pode ser salvo.")
	arquivo.close()

func _load():
	var arquivo = File.new()
	if arquivo.file_exists(SAVE_PATH):
		arquivo.open(SAVE_PATH, File.READ)
		var dados_salvos = arquivo.get_var()
		contador = dados_salvos["contador"]
	else:
		print("Erro ao carregar os dados do contador")
