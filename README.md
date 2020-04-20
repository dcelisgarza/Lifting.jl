# Do You Even Lift, Bro?

[![Build Status](https://travis-ci.com/dcelisgarza/Lifting.jl.svg?branch=master)](https://travis-ci.com/dcelisgarza/Lifting.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/dcelisgarza/Lifting.jl?svg=true)](https://ci.appveyor.com/project/dcelisgarza/Lifting-jl)
[![Codecov](https://codecov.io/gh/dcelisgarza/Lifting.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/dcelisgarza/Lifting.jl)
[![Coveralls](https://coveralls.io/repos/github/dcelisgarza/Lifting.jl/badge.svg?branch=master)](https://coveralls.io/github/dcelisgarza/Lifting.jl?branch=master)

## What is this?

> There is no reason to be alive if you can't do deadlifts!"  
    - Jon Pall Sigmarsson

It's a tool for creating and analysing lifting programmes.

To create a minimal programme you must first create an exercise, set scheme, progression and training days which will be pushed to the programme.

We start by creating an exercise. This is a bench press with chains, whose unrounded training max is 101.3 units, `trainingMax` will be rounded down to the nearest multiple of 2.5 that is less than 101.3.
```
Bench = Exercise(;
    name = "Bench Press",
    trainingMax = 101.3,
    equipment = "Barbell",  # Defaults to "Barbell", accepts Vectors.
    modality = "Chains",    # Exercise modifier, accepts vectors. Defaults to "NA".
    size = "NA",            # Indicates the size of modality (i.e. Box, Bands, etc), accepts vectors. Defaults to "NA".
    muscles = ["Chest", "Triceps", "Shoulders"], # Defaults to "NA".
    roundBase = 2.5,    # Round `trainingMax` to the nearest multiple of this number. Defaults to 2.5 (because kg >> lbs).
    roundMode = floor,  # Round `trainingMax` to the ceil or floor of the nearest multiple of `roundBase`. Defaults to `floor`.
)
```

We then create a set scheme. This is 5x5 @ 75% with +10 units of added weight, rounding down. All the values must have the same length. They can be scalars or vectors.
```
FiveByFive = SetScheme(
    type = "Default", # Set type. Defaults to "Default".
    sets = 5, # Number of sets. Defaults to 5.
    reps = 5, # Number of reps per set. Defaults to 5.
    intensity = 0.75, # Intensity for calculating weights in the set. Defaults to 0.75.
    addWeight = 10,   # Extra weight to add on top of the calculated weight. Can be used to accommodate chains or if your programme prescribes it.
    roundMode = floor,  # Rounding mode for the weight calculated for the set. Defaults to `floor`.
    rpeMode = false,    # If false, `intensity` is percentage based and the set weights will be calculated directly by multiplying the training max by this value. If true `intensity` will be taken as RPE and the weights will be calculated using RPE. Defaults to `false`.
)
```

We then create a progression scheme, using the vector or scalar of type `SetScheme` created by the user. In this case we have a simple 5x5 linear progression.
```
ProgBench = Progression(
    type = LinearProgression(), # There are different progression types.
    name = "Linear 5x5",        # Name of the progression.
    sessions = 1,               # Number of different sessions in this progression per week.
    period = 1,                 # Number of weeks before progression cycles again.
    setScheme = FiveByFive,     # Set scheme defined by the user. Its length must be equal to `sessions*period`.
)
```

The exercise and its progression are then pushed into an empty array representing a training day. Push other exercises or accessories you want to do this day the array. You can do this for multiple days or keep a single array and slice it appropriately later.
```
ChestDay = []
push!(ChestDay, Bench, ProgBench[, i = 1]) # Pushes the exercise and progression to ChestDay.
RestDay = []
push!(RestDay, "Rest")
```

Finally create your programme. This will calculate all the weights you need to use and contain all the days you've pushed. The second and third arguments must be the same length. The fourth argument contains the days in the programme, here we made two different days but slicing a single array and separating the slices by commas also works. `MyTraining.days` will contain all the days in the programme. Here we create a programme that prescribes alternate days of 5x5 @ 75% bench press as the first day and a rest day as the second.
```
MyTraining = Programme("Only Bench", Bench, ProgBench, [ChestDay, RestDay])
```

## Gotta lift them all!
I wanna be the most whammed,  
Like no one ever was.  
To lift heavy is my real test,  
To train well is my cause.  

I will travel to the gym,  
Lifting long and hard.  
Within each lift to understand,  
The power that's inside.  

(SBD! Gotta lift them all!)

It's you and me,  
I know it's my destiny.  

(SBD!)

Oh you're my best friend,  
In a world we must outlift.  

(SBD! Gotta lift them all!)

An RPE so true,  
Our mindset will pull us through.  
You lift me and I'll lift you,  
S B D!

(Gotta lift them all!)

Gotta lift them all!

Yeah!

Every session in my programme,  
With courage I will face.  
I will battle everyday,  
To keep the proper form.  

Lift with me the time is right,  
There's no better spotter.  
Arm in arm we'll get whammed,  
It's always been our dream.  

(Gotta lift them all!)

It's you and me,  
I know it's my destiny.  

(SBD!)

Oh you're my best friend,  
In a world we must outlift.  

(SBD! Gotta lift them all!)

A pump so huge,  
Our mindset will pull us through.  
You lift me and I'll lift you.  
S B D!

(Gotta lift them all!)

Gotta lift them all! (x4)  
Yeah!

(Gotta lift them all!)

It's you and me,  
I know it's my destiny.

(SBD!)

Oh you're my best friend,  
In a world we must outlift.

(SBD! Gotta lift them all!)

An RPE so true,  
Our mindset will pull us through.  
You lift me and I'll lift you,  
S B D!

(SBD! Gotta lift them all!)

Gotta lift them all!  
SBD!
