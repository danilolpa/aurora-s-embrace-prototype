extends Node

# Propriedades comuns
@export var character_name: String = "Unnamed"
@export var job: String = "None"
@export var level: int = 1
@export var experience: int = 0

# Stats básicos
var stats: Dictionary = {}
var resource: Dictionary = {}

func _ready():
	# Inicializa stats e recursos baseados no job
	initialize_stats(job)
	initialize_resource(job)

# Inicializa os stats baseados no job
func initialize_stats(job_name: String):
	var stats_by_job = {
		"Knight": {"hp": 100, "attack": 15, "defense": 10},
		"Druid": {"hp": 70, "attack": 10, "defense": 5, "mana": 50},
		"Paladin": {"hp": 120, "attack": 12, "defense": 12, "mana": 30}
	}
	stats = stats_by_job.get(job_name, {"hp": 50, "attack": 5, "defense": 5})

# Inicializa o recurso (Mana, Stamina, etc.)
func initialize_resource(job_name: String):
	var resource_by_job = {
		"Knight": {"type": "Stamina", "value": 100},
		"Druid": {"type": "Mana", "value": 50},
		"Paladin": {"type": "Mana", "value": 30}
	}
	resource = resource_by_job.get(job_name, {"type": "None", "value": 0})

# Ganha experiência e sobe de nível se necessário
func gain_experience(amount: int):
	experience += amount
	while experience >= get_experience_to_level_up():
		level_up()

# Experiência necessária para subir de nível
func get_experience_to_level_up() -> int:
	return level * 100 # Exemplo simples: 100 XP por nível

# Lógica para subir de nível
func level_up():
	level += 1
	experience -= get_experience_to_level_up()
	stats["hp"] += 10 # Exemplo de ganho de atributo
	print("%s subiu para o nível %d!" % [name, level])
