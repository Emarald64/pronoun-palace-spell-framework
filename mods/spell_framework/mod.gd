class_name SpellFramework extends Mod

const pronoun_palace_version="1.0.21"

static var added_spells:Dictionary[String,float]={}
static var spell_catagories:Dictionary[String,Array]={
    Globals.SPELL_CATEGORY.DEFENSIVE:[],
    Globals.SPELL_CATEGORY.OFFENSIVE:[],
    Globals.SPELL_CATEGORY.SUPPORT:[],
    }

static func add_spell(id:String,weight:float=0.0,catagory:String=""):
    added_spells[id]=weight
    #Globals.SPELL_POOL[id]=weight
    if catagory!="":
        spell_catagories[catagory].append(id)

func _ready() -> void:
    if pronoun_palace_version!=ProjectSettings.get_setting("application/config/version"):
        print("incompatable version")
        var popup=load("res://mods/spell_framework/incompatible_version_popup.tscn").instantiate()
        popup.get_node("Label").text="The version of the game you are running ("+ProjectSettings.get_setting("application/config/version")+")\nmay be incompatible with this version of the framework for "+pronoun_palace_version+"\nproceed at you own risk"
        add_child(popup)
    
