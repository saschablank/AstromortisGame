extends Object

class_name RessourceDefinitions

static var IRON_PLATES = "iron_plates"
static var COPPER_PLATES = "copper_plates"
static var BUILDING_BLOCKS = "building_blocks"
static var ELETRONIC_COMPONENTS = "electronic_components"
static var GLASS = "glass"
static var TRITANIUM = "tritanium"
static var MEALS = "meals"
static var IRON = "iron"
static var COPPER = "copper"
static var SILICIUM = "silicium"
static var BIOMASS = "biomass"
static var GOLD = "gold"
static var IRON_ORE = "iron_ore"
static var COPPER_ORE = "copper_ore"
static var GOLD_ORE = "raw_gold"
static var TRITANIUM_ORE = "tritanium_ore"
static var SILICIUMCARBID = "siliciumcarbid"
static var CARBON = "carbon"
static var STEEL = "steel"
static var DRONE_FRAME = "drone_frame"
static var DRONE = "drone"
static var HYDROGEN = "hydrogen"
static var OXYGEN = "oxygen"
static var DRINKING_WATER = "drinking_water"

static var ALL_RESSOURCES = [ # THIS LIST ALSO DEFINES THE ORDER IN THE STORAGE UI
	BIOMASS,
	MEALS,
	SILICIUM,
	SILICIUMCARBID,
	GLASS,
	CARBON,
	IRON_ORE,
	IRON,
	IRON_PLATES,
	STEEL,
	COPPER_ORE,
	COPPER,
	COPPER_PLATES,
	ELETRONIC_COMPONENTS,
	DRONE_FRAME,
	HYDROGEN,
	OXYGEN,
	BUILDING_BLOCKS,
	DRINKING_WATER
]

static var DRONE_TRANSPORT_AMOUNT = {
	OXYGEN : 20,
	DRINKING_WATER: 10
}

static var ENVIRONMENT_RESSOURCES: = [
	IRON_ORE,
	COPPER_ORE,
	GOLD_ORE,
	TRITANIUM_ORE,
	SILICIUM,
	DRINKING_WATER,
]

static var PRODUCTS_IN_HYDROGEN_FARM = [
	DRINKING_WATER,
	OXYGEN
]

static var PRODUCTS_IN_FARM = [
	BIOMASS
]

static var PRODUCTS_IN_MINE = [
	IRON_ORE,
	COPPER_ORE,
	GOLD_ORE,
	TRITANIUM_ORE
]

static var PRODUCTS_IN_FORGE: = [
	IRON,
	COPPER,
	GLASS,
	STEEL,
	GOLD,
	TRITANIUM
]

static var PRODUCTS_IN_CHEMICAL_PLANT = [
	SILICIUMCARBID,
	CARBON,
	HYDROGEN
]

static var PRODUCTS_IN_FACTORY = [
	MEALS,
	IRON_PLATES,
	COPPER_PLATES,
	ELETRONIC_COMPONENTS,
	DRONE_FRAME,
	BUILDING_BLOCKS
]


enum OreTypes {
	E_IRON,
	E_COPPER,
	E_GOLD,
	E_TRITANIUM
}

static var ORE_TO_TYPE_MAP = {
	OreTypes.E_IRON: IRON,
	OreTypes.E_COPPER: COPPER,
	OreTypes.E_GOLD: GOLD,
	OreTypes.E_TRITANIUM: TRITANIUM
}

static var ICON_MAP: Dictionary = {
	HYDROGEN: Rect2(64,32,32,32),
	OXYGEN: Rect2(96,32,32,32),
	IRON_PLATES: Rect2(224, 0, 32, 32),
	COPPER_PLATES: Rect2(256, 0, 32, 32),
	BUILDING_BLOCKS: Rect2(192, 0, 32, 32),
	ELETRONIC_COMPONENTS: Rect2(128, 0, 32, 32),
	GLASS: Rect2(96, 0, 32, 32),
	TRITANIUM : Rect2(0, 32, 32, 32),
	MEALS: Rect2(160, 0, 32, 32),
	IRON: Rect2(32,0, 32, 32),
	COPPER: Rect2(32, 32, 32, 32),
	SILICIUM: Rect2(288, 0, 32, 32),
	BIOMASS: Rect2(320, 0, 32, 32),
	IRON_ORE: Rect2(0, 96, 32, 32),
	COPPER_ORE: Rect2(32, 96, 32, 32),
	GOLD_ORE: Rect2(64, 96, 32, 32),
	TRITANIUM_ORE: Rect2(96, 96, 32, 32),
	GOLD: Rect2(64, 0, 32, 32),
	SILICIUMCARBID: Rect2(256,32, 32, 32),
	CARBON: Rect2(160, 32, 32 ,32),
	STEEL: Rect2(128,32,32,32),
	DRONE_FRAME: Rect2(128,64,32,32),
	DRONE: Rect2(160,64,32,32),
	DRINKING_WATER: Rect2(288,32,32,32),
	"build": Rect2(416,0, 32, 32),
	"deny": Rect2(96,64,32,32),
	"colonist": Rect2(480,0,32,32),
	"energy_storage_drain": Rect2(0,128,32,32),
	"energy_storage_reload": Rect2(32,128,32,32),
	"oxygen_tank": Rect2(96,32,32,32)
	}

static var RECIPIES_MAP: Dictionary = {
	IRON_PLATES: { IRON: 1 },
	COPPER_PLATES: { COPPER: 1 },
	STEEL: { IRON: 2, CARBON:1},
	GLASS: { SILICIUM: 4 },
	IRON: { IRON_ORE: 2 },
	COPPER: {COPPER_ORE: 2 },
	ELETRONIC_COMPONENTS: { IRON_PLATES: 5, COPPER_PLATES: 3 },
	BUILDING_BLOCKS: { STEEL: 4, SILICIUMCARBID: 3, GLASS: 4},
	GOLD: { GOLD_ORE: 2 },
	CARBON: { BIOMASS: 10},
	TRITANIUM: { TRITANIUM_ORE: 5},
	SILICIUMCARBID: { SILICIUM: 4, CARBON: 4 },
	MEALS: { BIOMASS: 1 },
	DRONE_FRAME: { IRON_PLATES: 3, GLASS: 2},
	DRONE: { DRONE_FRAME: 1, ELETRONIC_COMPONENTS: 5 },
	BIOMASS: { DRINKING_WATER: 10 }
}

static var RECIPIE_OUTPUT_AMOUNT = {
	MEALS: 2,
	BIOMASS: 10,
	IRON: 4,
	IRON_PLATES: 2,
	COPPER_PLATES: 2,
	COPPER: 4,
	GLASS: 2,
	ELETRONIC_COMPONENTS: 3,
	CARBON: 5,
	SILICIUM: 4,
	DRINKING_WATER: 20,
	OXYGEN: 80
}

static var MANUFACTORING_TIME_MAP: Dictionary = {
	IRON_PLATES: 5,
	COPPER_PLATES: 5,
	ELETRONIC_COMPONENTS: 7,
	BUILDING_BLOCKS: 15,
	GLASS: 5,
	MEALS: 15,
	IRON: 5,
	COPPER: 5,
	TRITANIUM: 10,
	SILICIUM: 3,
	IRON_ORE: 3,
	COPPER_ORE: 3,
	GOLD_ORE: 5,
	TRITANIUM_ORE: 5,
	BIOMASS: 30,
	CARBON: 5,
	STEEL: 10,
	SILICIUMCARBID: 15,
	DRONE_FRAME: 20,
	DRONE: 10,
	#GameDefinitions.BUILDING_TYPE_HYDROGEN_FACTORY:10, # HYDROGEN AND THIS LINE BELONGS TOGETHER
	DRINKING_WATER: 10,
}


static var icon_images: Dictionary = {}
static var icon_slot_images: Dictionary = {}


static func blit_icon_texture(rect: Rect2, resize_size: Vector2i = Vector2(-1,-1)):
	var icon_to_return: Image = null
	icon_to_return = Image.create_empty(32, 32, false, Image.FORMAT_RGBA8)
	icon_to_return.blit_rect(preload("res://assets/Ui/icons/icons.png").get_image(), rect, Vector2(0, 0))
	if resize_size.x > -1 and resize_size.y > -1:
		icon_to_return.resize(resize_size.x, resize_size.y)
	return ImageTexture.create_from_image(icon_to_return)
	
static func blit_slot_icon(rect: Rect2, resize_size: Vector2i = Vector2(-1,-1)):
	var slot_to_return: Image = null
	const SLOT_SPACE: Vector2 = Vector2(38,38)
	const SLOT_OFFSET: Vector2 = Vector2(13,13)
	var ressource_icon:Image = RessourceDefinitions.blit_icon_texture(rect, SLOT_SPACE).get_image()
	slot_to_return = preload("res://assets/Ui/icons/icons.png").get_image()
	slot_to_return.convert(Image.FORMAT_RGBA8)
	slot_to_return.blend_rect(ressource_icon, Rect2(0, 0, SLOT_SPACE.x, SLOT_SPACE.y),SLOT_OFFSET)
	if resize_size.x > 0 and resize_size.y > 0:
		slot_to_return.resize(resize_size.x, resize_size.y)
	return ImageTexture.create_from_image(slot_to_return)
	
static func blit_slot_deny_icon(rect: Rect2, resize_size: Vector2 = Vector2(-1,-1)):
	const SLOT_SPACE: Vector2 = Vector2(24,24)
	const SLOT_OFFSET: Vector2 = Vector2(4,4)
	var slot_image: Image = blit_slot_icon(rect,resize_size).get_image()
	var deny_texture: Image = blit_icon_texture(ICON_MAP["deny"], SLOT_SPACE).get_image()

	slot_image.blend_rect(deny_texture, Rect2(0, 0, SLOT_SPACE.x, SLOT_SPACE.y),SLOT_OFFSET )
	if resize_size.x > 0 and resize_size.y > 0:
		slot_image.resize(resize_size.x, resize_size.y)
	return ImageTexture.create_from_image(slot_image)
	
