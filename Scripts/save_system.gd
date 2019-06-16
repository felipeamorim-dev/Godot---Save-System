extends Node

const SAVE_PATH = "user://save_system.data"
var contador = 0 setget set_contador

signal update_display_message

# Encapsulamento utilizanodo método setget
func set_contador(valor):
	contador = valor 
	emit_signal("update_display_message")

# Método de salvamento do contador 
func save():
	var arquivo = File.new() # Cria a instância do arquivo
	var erro = arquivo.open(SAVE_PATH, File.WRITE) # Abre o arquivo para escrita
	var dados = {"contador" : contador} # Dicionário para armazenar os dados a serem salvos
	if not erro:
		arquivo.store_var(dados) # Salva os dados no arquivo
	else:
		print("O contador não pode ser salvo.")
	arquivo.close() # Fecha o arquivo

# Método de carregamento do contador 
func _load():
	var arquivo = File.new() # Cria a instância do arquivo
	if arquivo.file_exists(SAVE_PATH): # Verifica se o arquivo existe
		arquivo.open(SAVE_PATH, File.READ) # Abre o arquivo para leitura
		var dados_salvos = arquivo.get_var() # recupera os dados do arquivo e seta esses dados para a variável dados_salvos
		contador = dados_salvos["contador"] # Atualiza com os dados recuperados o contador
	else:
		print("Erro ao carregar os dados do contador")
