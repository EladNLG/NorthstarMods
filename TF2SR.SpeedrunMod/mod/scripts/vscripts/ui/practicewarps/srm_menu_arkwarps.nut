global function SRM_InitArkWarpsMenu

array<string> startPointNames = [
	"Start",
	"Intro 1",
	"Intro 2",
	"Viper Intro",
	"Ship Explode",
	"Barker Landing",
	"Fastball",
	"6-4 Landing",
	"Post 6-4",
	"Elevator",
	"Post Gun Clear",
	"Room Clear",
	"Breach",
	"Clear",
	"Post Shipsteer",
	"Viper Fight",
	"Post Viper Fight",
	"[screams]",
	"Viper Death",
	"Shaft Landing",
	"BT Punch",
	"Ark theft",
	"Black Screen"
]

void function SRM_InitArkWarpsMenu() {
	SRM_InitWarpsMenu("SRM_ArkWarpsMenu", startPointNames, SRM_LoadArkWarp)
}