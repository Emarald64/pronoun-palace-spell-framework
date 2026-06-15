class_name SpellFramework extends Mod

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
    add_spell("foggy_glasses",1000.0,Globals.SPELL_CATEGORY.SUPPORT)
