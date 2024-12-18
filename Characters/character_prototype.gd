extends CharacterBody2D

# Velocidade de movimento do personagem
var MOVE_SPEED = 200

func _physics_process(delta):
	pass
	#var direction = Vector2.ZERO
#
	## Input de movimento
	#if Input.is_action_pressed("move_down"): # Direita
		#direction.x += 1
	#if Input.is_action_pressed("move_up"):  # Esquerda
		#direction.x -= 1
	#if Input.is_action_pressed("move_left"):  # Baixo
		#direction.y += 1
	#if Input.is_action_pressed("move_right"):    # Cima
		#direction.y -= 1
#
	## Ajustar a direção para se alinhar ao grid isométrico
	#var iso_direction = Vector2(
		#direction.x - direction.y,  # Mover em X isométrico
		#(direction.x + direction.y) / 2  # Mover em Y isométrico
	#)
#
	## Aplicar velocidade ao movimento
	#velocity = iso_direction.normalized() * MOVE_SPEED
#
	## Move o personagem
	#move_and_slide()
