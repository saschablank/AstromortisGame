extends Object
class_name GameDefinitions


static var IS_NIGHTTIME = false
static var TIME_IN_DEGREE = 0
static var IS_LOADED = false
#static var RessourceDefinitions = preload("res://src/RessourceDefinitions.gd")
static var TILE_TYPE_SAND = "sand"
static var TILE_TYPE_WATER = "water"
static var TILE_TYPE_IRON = "iron_ore"
static var TILE_TYPE_COPPER = "copper_ore"
static var TILE_TYPE_GOLD = "gold_ore"
static var TILE_TYPE_TRITANIUM = "tritanium"

static var BUILDING_TYPE_HYDROGEN_FACTORY = "hydrogen_factory"
static var BUILDING_TYPE_CHEMICAL_PLANT = "chemical_plant"
static var BUILDING_TYPE_FACTORY = "factory"
static var BUILDING_TYPE_SOLAR_PANEL = "solarpanel"
static var BUILDING_TYPE_FARM = "farm"
static var BUILDING_TYPE_STORAGE = "storage"
static var BUILDING_TYPE_LIVING_QUARTERS = "living_quarters"
static var BUILDING_TYPE_ORE_MINE = "ore_mine"
static var BUILDING_TYPE_WIND_POWERPLANT = "windpowerplant"
static var BUILDING_TYPE_SAND_MINE = "sandmine"
static var BUILDING_TYPE_DRONE_HUB = "dronehub"
static var BUILDING_TYPE_FORGE = "forge"
static var BUILDING_TYPE_CINEMA = "cinema"
static var BUILDING_TYPE_PARK = "park"
static var BUILDING_TYPE_ENERGY_STORAGE = "energy_storage"
static var BUILDING_TYPE_OXYGEN_TANK = "oxygen_tank"
static var MAX_BUILDING_TICK = 4

#static var TILEMAP_ATLAS_TO_CORRIDOR = {
	#Vector2(0,0): BUILDING_TYPE_CORRIDOR_END,
	#Vector2(2,0): BUILDING_TYPE_CORRIDOR_CORNER_BL_TL,
	#Vector2(4,0): BUILDING_TYPE_CORRIDOR_CORNER_BR_TR,
	#Vector2(0,3): BUILDING_TYPE_CORRIDOR_CORNER_BR_BL,
	#Vector2(2,3): BUILDING_TYPE_CORRIDOR_CORNER_TL_TR,
	#Vector2(4,2): BUILDING_TYPE_CORRIDOR_LEFT,
	#Vector2(2,2): BUILDING_TYPE_CORRIDOR_RIGHT
#}


static var BUILDINGS_WITHOUT_CONNECTIONS = [
	BUILDING_TYPE_SOLAR_PANEL,
	BUILDING_TYPE_WIND_POWERPLANT,
	BUILDING_TYPE_ENERGY_STORAGE,
]

static var FUN_BUILDINGS = [
	BUILDING_TYPE_CINEMA,
	BUILDING_TYPE_PARK
]

static var ENERGY_CONSUMPTION = {
	BUILDING_TYPE_FACTORY: 10,
	BUILDING_TYPE_SOLAR_PANEL: -45,
	BUILDING_TYPE_FARM: 15,
	BUILDING_TYPE_STORAGE: 1,
	BUILDING_TYPE_LIVING_QUARTERS: 15,
	BUILDING_TYPE_ORE_MINE: 20,
	BUILDING_TYPE_WIND_POWERPLANT: -100,
	BUILDING_TYPE_SAND_MINE: 20,
	BUILDING_TYPE_DRONE_HUB: 1,
	BUILDING_TYPE_FORGE: 20,
	BUILDING_TYPE_CINEMA: 50,
	BUILDING_TYPE_PARK: 5,
	BUILDING_TYPE_CHEMICAL_PLANT: 15,
	BUILDING_TYPE_HYDROGEN_FACTORY: 5,
	BUILDING_TYPE_ENERGY_STORAGE: 0,
	BUILDING_TYPE_OXYGEN_TANK: 0
	
}

static var BUILDINGS_BUILD_TIMES_TICK = {
	BUILDING_TYPE_HYDROGEN_FACTORY: 2,
	BUILDING_TYPE_FACTORY : 4,
	BUILDING_TYPE_SOLAR_PANEL: 2,
	BUILDING_TYPE_FARM: 2,
	BUILDING_TYPE_STORAGE : 2, 
	BUILDING_TYPE_LIVING_QUARTERS: 3,
	BUILDING_TYPE_ORE_MINE: 4,
	BUILDING_TYPE_WIND_POWERPLANT: 10,
	BUILDING_TYPE_SAND_MINE : 6,
	BUILDING_TYPE_DRONE_HUB: 1,
	BUILDING_TYPE_FORGE: 4,
	BUILDING_TYPE_CINEMA: 10,
	BUILDING_TYPE_PARK: 20,
	BUILDING_TYPE_CHEMICAL_PLANT: 6,
	BUILDING_TYPE_ENERGY_STORAGE: 4,
	BUILDING_TYPE_OXYGEN_TANK: 2
}
static var BUILDINGS_MATERIALS_NEEDED_PER_TICK = {
	BUILDING_TYPE_ORE_MINE: {
			RessourceDefinitions.IRON_PLATES: 5, 
			RessourceDefinitions.ELETRONIC_COMPONENTS: 0.25
		},
	BUILDING_TYPE_OXYGEN_TANK: {
			RessourceDefinitions.IRON_PLATES: 0.5, 
		},
	BUILDING_TYPE_ENERGY_STORAGE: {
		RessourceDefinitions.IRON_PLATES: 1.25, 
		RessourceDefinitions.COPPER_PLATES: 1,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 0.25
	},
	BUILDING_TYPE_DRONE_HUB: {
		RessourceDefinitions.IRON_PLATES: 7,
		RessourceDefinitions.COPPER_PLATES: 2,
		RessourceDefinitions.GLASS: 5,
		RessourceDefinitions.BUILDING_BLOCKS: 2.5,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 5
	},
	BUILDING_TYPE_FACTORY : {
		RessourceDefinitions.IRON_PLATES: 5,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 3,
	},
	BUILDING_TYPE_STORAGE : {
		RessourceDefinitions.IRON_PLATES: 3,
		RessourceDefinitions.BUILDING_BLOCKS: 1,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 1,
	},
	BUILDING_TYPE_WIND_POWERPLANT :  {
		RessourceDefinitions.IRON_PLATES: 8,
		RessourceDefinitions.BUILDING_BLOCKS: 10,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 20,
		RessourceDefinitions.COPPER_PLATES: 10
	},
	BUILDING_TYPE_FARM : {
		RessourceDefinitions.IRON_PLATES: 2,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 0.25,
		RessourceDefinitions.GLASS: 5
	},
	BUILDING_TYPE_LIVING_QUARTERS:{
		RessourceDefinitions.IRON_PLATES: 4,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 4,
		RessourceDefinitions.GLASS: 3
	},
	BUILDING_TYPE_SAND_MINE: {
		RessourceDefinitions.IRON_PLATES: 4,
		RessourceDefinitions.COPPER_PLATES: 2,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 1
	},
	BUILDING_TYPE_SOLAR_PANEL: {
		RessourceDefinitions.IRON_PLATES: 1,
		RessourceDefinitions.COPPER_PLATES: 2,
		RessourceDefinitions.GLASS: 2
	},
	BUILDING_TYPE_FORGE: {
		RessourceDefinitions.IRON_PLATES: 2.5,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 0.25
	},
	BUILDING_TYPE_CINEMA: {
		RessourceDefinitions.IRON_PLATES: 10,
		RessourceDefinitions.BUILDING_BLOCKS: 12,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 10,
		RessourceDefinitions.COPPER_PLATES: 5
	},
	BUILDING_TYPE_PARK: {
		RessourceDefinitions.IRON_PLATES: 10,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 2,
		RessourceDefinitions.COPPER_PLATES: 5,
		RessourceDefinitions.GLASS: 20,
		RessourceDefinitions.BIOMASS: 20
	},
	BUILDING_TYPE_CHEMICAL_PLANT: {
		RessourceDefinitions.IRON_PLATES: 4,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 5,
		RessourceDefinitions.COPPER_PLATES: 2,
	},
	BUILDING_TYPE_HYDROGEN_FACTORY: {
		RessourceDefinitions.IRON_PLATES: 2,
		RessourceDefinitions.ELETRONIC_COMPONENTS: 1,
	}
}

static var BUILDING_WOKRING_PLACES = {
	BUILDING_TYPE_FACTORY: 2,
	BUILDING_TYPE_SOLAR_PANEL: 0,
	BUILDING_TYPE_FARM: 3,
	BUILDING_TYPE_STORAGE: 1,
	BUILDING_TYPE_LIVING_QUARTERS: 0,
	BUILDING_TYPE_ORE_MINE: 3,
	BUILDING_TYPE_WIND_POWERPLANT: 0,
	BUILDING_TYPE_SAND_MINE: 2,
	BUILDING_TYPE_DRONE_HUB: 2,
	BUILDING_TYPE_FORGE: 2,
	BUILDING_TYPE_CINEMA: 1,
	BUILDING_TYPE_PARK: 2,
	BUILDING_TYPE_CHEMICAL_PLANT: 2,
	BUILDING_TYPE_HYDROGEN_FACTORY: 3,
	BUILDING_TYPE_ENERGY_STORAGE: 0,
	BUILDING_TYPE_OXYGEN_TANK: 0
	
}

static func is_energy_producing(building_type: String):
	return (
		building_type == BUILDING_TYPE_SOLAR_PANEL or
		building_type == BUILDING_TYPE_WIND_POWERPLANT
	)

static func is_ore_tile(tile_type: String):
	return (
		tile_type == TILE_TYPE_IRON or
		tile_type == TILE_TYPE_COPPER or 
		tile_type == TILE_TYPE_GOLD or
		tile_type == TILE_TYPE_TRITANIUM
	)
	
