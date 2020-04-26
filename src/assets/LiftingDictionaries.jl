"""
wakao
"""
Lifting_Aux = Dict{String, Dict{String, String}}()
Lifting_Exercise_Names = Dict{String, Dict{String, String}}()

modality = Dict(
    "default" => "Default",
    "belt" => "Belt",
    "tempo" => "Tempo",
    "paused" => "Paused",
    "speed" => "Speed",
    "deficit" => "Deficit",
    "chains" => "Chains",
    "bands" => "Bands",
    "reverse bands" => "Reverse Bands",
    "box" => "Box",
    "block" => "Block",
    "pin" => "Pin",
    "iso" => "Isometric",
    "standing" => "Standing",
    "seated" => "Seated",
    "unilateral" => "Unilateral",
    "reverse grip" => "Reverse Grip",
    "kneeling" => "Kneeling",
    "side" => "Side",
    "cheat" => "Cheat",
    "dragon" => "Dragon",
    "walking" => "Walking",
    "backstep" => "Backstep",
    "straddle" => "Straddle",
    "full" => "Full",
    "one leg out" => "One Leg Out",
    "tuck" => "Tuck",
    "adv tuck" => "Advanced Tuck",
)
setType = Dict(
    "default" => "Default",
    "amrap" => "AMRAP",
    "emom" => "EMOM",
    "amrap emom" => "AMRAP EMOM",
    "test" => "Test",
    "optional" => "Optional",
    "opt amrap emom" => "Opt AMRAP EMOM",
)
equipmentSize = Dict(
    "na" => "NA",
    "tiny" => "Tiny",
    "s" => "Small",
    "m" => "Medium",
    "m" => "Large",
    "xl" => "Extra Large",
)
equipment = Dict(
    "bb" => "Barbell",
    "db" => "Dumbell",
    "ssb" => "Safety Squat Bar",
    "trap bar" => "Trap Bar",
    "fat grips" => "Fat Grips",
    "axle" => "Axle",
    "dl bar" => "Deadlift Bar",
    "squat bar" => "Squat Bar",
    "stiff bar" => "Stiff Bar",
    "oly bar" => "Olympic Bar",
    "swiss bar" => "Swiss Bar",
    "duffalo bar" => "Duffalo Bar",
    "sling shot" => "SlingShot",
    "cable" => "Cable Machine",
    "other" => "Other Machine",
    "t bar" => "T-bar",
    "ez bar" => "EZ Bar",
    "none" => "None",
    "pullup bar" => "Pullup Bar",
    "chain belt" => "Chain Belt",
    "plate" => "Plate",
    "parallette" => "Parallette",
    "ab wheel" => "Ab Wheel",
)
muscles = Dict(
    "pecs" => "Pecs",
    "triceps" => "Triceps",
    "front delts" => "Front Delts",
    "side delts" => "Side Delts",
    "rear delts" => "Rear Delts",
    "rhomboids" => "Rhomboids",
    "traps" => "Traps",
    "lats" => "Lats",
    "biceps" => "Biceps",
    "wrist flexors" => "Wrist Flexors",
    "wrist extensors" => "Wrist Extensors",
    "finger flexors" => "Finger Flexors",
    "finger extensors" => "Finger Extensors",
    "hand" => "Hand Muscles",
    "core" => "Core",
    "rectus abdominis" => "Rectus Abdominis",
    "transverse abdominis" => "Transverse Abdominis",
    "obliques" => "Obliques",
    "quads" => "Quads",
    "glute major" => "Glute Major",
    "glute minor" => "Glute Minor",
    "glutes" => "Glutes",
    "hamstrings" => "Hamstrings",
    "calves" => "Calves",
    "spinal erectors" => "Spinal Erectors",
    "brachialis" => "Brachialis",
    "rot cuff" => "Rotator Cuff",
)
push!(Lifting_Aux, "modality"=>modality)
push!(Lifting_Aux, "setType"=>setType)
push!(Lifting_Aux, "equipmentSize"=>equipmentSize)
push!(Lifting_Aux, "equipment"=>equipment)
push!(Lifting_Aux, "muscles"=>muscles)

grip = Dict(
    # Wrist
    "wrist curl" => "Wrist Curl",
    "wrist extension" => "Wrist Extension",
    "ulnar dev" => "Resisted Ulnar Deviation",
    "radial dev" => "Resisted Radial Deviation",
    "supination" => "Resisted Supination",
    "pronation" => "Resisted Pronation",
    # Support hold
    "dead hang" => "Dead Hang",
    "active hang" => "Active Hang",
    # Pinch
    "plate pinch" => "Plate Pinch",
    "plate flip" => "Plate Flip",
    # Dynamic
    "finger curl" => "Finger Curl",
    "crusher" => "Crusher",
    # Open Hand
    "blob" => "Blob",
    "hub" => "Hub",
    # Rolling
    "rolling thunder" => "Rolling Thunder",
)
squat = Dict(
    # Main variations
    "high" => "High Bar Squat",
    "low" => "Low Bar Squat",
    "front" => "Front Squat",
    # Novelty variations
    "zercher" => "Zercher Squat",
    "hatfield" => "Hatfield Squat",
    "goblet" => "Goblet Squat",
    # Unilateral
    "bulgarian" => "Bulgarian Split Squat",
    "lunge" => "Lunge",
    "pistol" => "Pistol Squat",
    "shrimp" => "Shrimp Squat",
    # Enforced bodyweight.
    "sissy" => "Sissy Squat",
    # Calf raises.
    "calf raise" => "Calf Raise",
)
bench = Dict(
    # Main variations.
    "flat" => "Flat Bench",
    "decline" => "Decline Bench",
    "incline" => "Incline Bench",
    "db incline" => "DB Incline Bench",
    "cg" => "Close Grip Bench",
    "feet up" => "Feet Up Bench",
    "spotto" => "Spoto Bench",
    # Novelty variations.
    "jm" => "JM Press",
    # Bodyweight
    "dips" => "Dips",
    "pushup" => "Pushup",
    "diamond" => "Diamond Pushup",
    "archer" => "Archer Pushup",
)
deadlift = Dict(
    # Main variations.
    "dl" => "Deadlift",
    "sumo" => "Sumo Deadlift",
    "rdl" => "Romanian Deadlift",
    # Novelty.
    "rack pull" => "Rack Pull",
    "jefferson" => "Jefferson",
    "zercher" => "Zercher",
)
press = Dict(
    "ohp" => "Overhead Press",
    "push" => "Push Press",
    "z" => "Z Press",
    "hspu" => "Handstand Push Up",
    "side raise" => "Side Raise",
)
row = Dict(
    "strict" => "Strict Row",
    "pendlay" => "Pendlay Row",
    "kroc" => "Kroc Row",
    "other" => "Other Row",
)
pull = Dict(
    "face" => "Face Pull",
    "pullup" => "Pullup",
    "mu" => "Muscle Up",
    "chin up" => "Chin Up",
    "hammer" => "Hammer Curl",
    "curl" => "Curl",
    "zottman" => "Zottman Curl",
)
lowBack = Dict(
    "nordic" => "Nordic Curl",
    "ghr" => "Glute-Ham Raise",
    "hyper extension" => "Hyper Extension",
)
core = Dict(
    "dragon flag" => "Dragon Flag",
    "hanging leg raise" => "Hanging Leg Raise",
    "toes to bar" => "Toes to Bar",
    "windshield wipers" => "Windshield Wipers",
    "ab roll" => "Ab Rollout",
    "parallette crunch" => "Parallette Crunch",
    "l sit" => "L-Sit",
    "v sit" => "V-Sit",
    "landmine" => "Land Mine Anti-Rotation",
    "plank" => "Plank",
    "leg raise" => "Leg Raise",
    "other" => "Other",
)
isometric = Dict(
    "back" => "Back Lever",
    "front" => "Front Lever",
    "planche" => "Planche",
    "other" => "Other",
)
push!(Lifting_Exercise_Names, "grip"=>grip)
push!(Lifting_Exercise_Names, "squat"=>squat)
push!(Lifting_Exercise_Names, "bench"=>bench)
push!(Lifting_Exercise_Names, "deadlift"=>deadlift)
push!(Lifting_Exercise_Names, "press"=>press)
push!(Lifting_Exercise_Names, "row"=>row)
push!(Lifting_Exercise_Names, "pull"=>pull)
push!(Lifting_Exercise_Names, "lowBack"=>lowBack)
push!(Lifting_Exercise_Names, "core"=>core)
push!(Lifting_Exercise_Names, "isometric"=>isometric)
