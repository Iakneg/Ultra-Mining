extends Control

var pedras = 0
var vida_pedra = 15
var dano_picareta = 1
var gold = 0 
var valor_pedra = 2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if vida_pedra <= 0:
		return
		
	vida_pedra -= dano_picareta
	print("vida: ", vida_pedra)
	
	if vida_pedra <= 0:
		vida_pedra = 0
		print("pedra quebrou")
		
		pedras += 1
		$ContadorPedras.text = "Pedras: " + str(pedras)
		print("pedras coletadas: ", pedras)
		
		$Pedra.visible = false
		$Pedra2.visible = false
		$Pedra3.visible = false
		$Pedra4.visible = false
		
		await get_tree().create_timer(0.65).timeout
		
		vida_pedra = 15
		$Pedra.visible = true
		
	elif vida_pedra <= 3:
		$Pedra.visible = false
		$Pedra2.visible = false
		$Pedra3.visible = false
		$Pedra4.visible = true
		
	elif vida_pedra <= 7:
		$Pedra.visible = false
		$Pedra2.visible = false
		$Pedra3.visible = true
		$Pedra4.visible = false
		
	elif vida_pedra <= 11:
		$Pedra.visible = false
		$Pedra2.visible = true
		$Pedra3.visible = false
		$Pedra4.visible = false
		
	else:
		$Pedra.visible = true
		$Pedra2.visible = false
		$Pedra3.visible = false
		$Pedra4.visible = false


func _on_vender_pressed() -> void:
	$Menuvenda.visible = true

func _on_fechar_menu_pressed() -> void:
	$Menuvenda.visible = false
