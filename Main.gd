extends Node3D

var jogador
var camera
var velocidade = 6.0
var vida = 100

func _ready():
    criar_mundo()
    criar_jogador()
    criar_inimigos()
    criar_hud()


func criar_mundo():

    var luz = DirectionalLight3D.new()
    luz.rotation_degrees = Vector3(-55, -25, 0)
    luz.shadow_enabled = true
    add_child(luz)

    var chao = CSGBox3D.new()
    chao.size = Vector3(40, 0.2, 40)
    chao.position.y = -0.1
    add_child(chao)

    var ambiente = WorldEnvironment.new()
    var ambiente3d = Environment.new()

    ambiente3d.background_mode = Environment.BG_COLOR
    ambiente3d.background_color = Color(0.08, 0.09, 0.12)

    ambiente.environment = ambiente3d
    add_child(ambiente)


func criar_jogador():

    jogador = CharacterBody3D.new()

    jogador.position = Vector3(0, 1, 6)

    add_child(jogador)

    var colisao = CollisionShape3D.new()

    var capsula = CapsuleShape3D.new()

    capsula.radius = 0.35
    capsula.height = 1.8

    colisao.shape = capsula

    jogador.add_child(colisao)

    camera = Camera3D.new()

    camera.position = Vector3(0, 0.65, 0)
    camera.current = true
    camera.fov = 75

    jogador.add_child(camera)


func criar_inimigos():

    criar_inimigo(Vector3(-4, 1, -5))
    criar_inimigo(Vector3(0, 1, -8))
    criar_inimigo(Vector3(4, 1, -5))


func criar_inimigo(posicao):

    var inimigo = StaticBody3D.new()

    inimigo.position = posicao

    add_child(inimigo)

    var corpo = CSGBox3D.new()

    corpo.size = Vector3(1, 2, 1)

    inimigo.add_child(corpo)

    var colisao = CollisionShape3D.new()

    var caixa = BoxShape3D.new()

    caixa.size = Vector3(1, 2, 1)

    colisao.shape = caixa

    inimigo.add_child(colisao)


func criar_hud():

    var hud = CanvasLayer.new()

    add_child(hud)

    var mira = Label.new()

    mira.text = "+"

    mira.position = Vector2(635, 340)

    mira.add_theme_font_size_override("font_size", 30)

    hud.add_child(mira)

    var texto = Label.new()

    texto.text = "SUDDEN MOBILE\nVIDA: 100"

    texto.position = Vector2(25, 25)

    texto.add_theme_font_size_override("font_size", 22)

    hud.add_child(texto)
