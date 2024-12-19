extends Node

var save_path: String = "user://characters.save" # Caminho para o arquivo salvo

# Salva o personagem no arquivo
func save_character(character: Node):
	var file = FileAccess.open(save_path, FileAccess.WRITE) # Abrindo o arquivo para escrita
	if file:
		var data = {
			"name": character.name,
			"job": character.job,
			"level": character.level,
			"experience": character.experience,
			"stats": character.stats,
			"resource": character.resource
		}
		file.store_var(data) # Armazena os dados no arquivo
		file.close()
		print("Personagem salvo com sucesso!")
	else:
		print("Erro ao salvar o personagem.")

# Carrega o personagem do arquivo
func load_character() -> Dictionary:
	var file = FileAccess.open(save_path, FileAccess.READ) # Abrindo o arquivo para leitura
	if file:
		var data = file.get_var() # Lê os dados armazenados
		file.close()
		return data
	else:
		print("Arquivo não encontrado.")
		return {}
