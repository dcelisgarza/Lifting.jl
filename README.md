# Do You Even Lift, Bro?

[![Build Status](https://travis-ci.com/dcelisgarza/Lifting.jl.svg?branch=master)](https://travis-ci.com/dcelisgarza/Lifting.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/dcelisgarza/Lifting.jl?svg=true)](https://ci.appveyor.com/project/dcelisgarza/Lifting-jl)
[![Codecov](https://codecov.io/gh/dcelisgarza/Lifting.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/dcelisgarza/Lifting.jl)
[![Coveralls](https://coveralls.io/repos/github/dcelisgarza/Lifting.jl/badge.svg?branch=master)](https://coveralls.io/github/dcelisgarza/Lifting.jl?branch=master)

```julia
if lift == true
    println("Yeaah buddy! Lightweight baby! Oooooooooooh")
else
    println("Weak!")
    return
end
```

## Ain't nuthin' but a peanut!

> There is no reason to be alive if you can't do deadlifts!"  
> - Jon Pall Sigmarsson

This is a tool for creating and analysing lifting programmes. It comes with a few premade dictionaries that users can import and modify to make things easier on them. These defaults as well as the programme I'm currently following are found in `/src/assets`. More details in [Defaults](#Defaults-1).

## Lightweight, Baby!

> Just remember, somewhere, a little Chinese girl is warming up with your max.     
> - Jim Conroy

In order to make a programme you need 3 things:
1. an exercise,
2. a progression,
3. a schedule.

We shall pretend to be Brosef, that annoying guy at the gym whose 'programme' consists of bench pressing every day, staring at girls all sesh---incidentally, said girls definitely squat more than him---and is a neverending font of unsolicited life, lifting, relationship and medical advice that is verifiably false.

We must first create the b e n c h p r e s s, emissary of the bro'onites.

```julia
BenchPress = Exercise(;
    name = "Bench Press",
    modality = "Half Rep"   # Also accepts vectors. Defaults to "Default".
    equipment = "Barbell",  # Also accepts vectors. Defaults to "NA".
    size = "YUGE", # Also accepts vectors. Defaults to "NA".
    muscles = [
                muscles["triceps"],
                muscles["front delts"]
              ],        # Also accepts scalars. Defaults to "NA".
    trainingMax = 100,  # Defaults to 0.
    roundBase = 2.5,    # Round to nearest multiple. Defaults to 2.5.
    roundMode = floor,  # Rounding function. Defaults to floor.
)
```

Of course, Brosef is a 'bodybuilder' and is all *about dat TUT 'bout dat TUT* (time under tension), so he exclusively works at high reps and low intensities despite completing maybe 25% of the rep on a good day. He also takes at least 5 minutes between sets because he needs to replenish his "ATT".
```julia
# The arrays must all be of equal length. Entry indices correspond to each other.
TUT = SetScheme(
    type = ["Long Rest", "Longer Rest", "Longest Rest", "Optional Forced Reps"]],
    sets = [1, 2, 1, 1],
    reps = [12, 14, 10, 5],
    intensity = [
                  9.5, # Intensity, can be percentage based (decimal form) or RPE
                  10,  # based. Percentages are capped at 1, RPE at 10.
                  10,
                  10
                ],  
    roundMode = [
                  floor,  # Rounding mode. Defaults to an array of floors of the
                  floor,  # same length as the others (or a scalar if so are the
                  ceil,   # others).
                  ceil
                ],  
    rpeMode = true, # If true the progression is RPE based, else it is
                    # percentage based. Defaults to false.
)
```
However his work ethic is without equal so he will always go to failure and sometimes past it and of course his warmup is like 5 kgs below his top sets. Since Brosef only has passing knowledge of percentages, he follows his gut. Interestingly, this means he uses RPE, who'd have thought?

Brosef is a straight shooter, so he only uses one set scheme, but there is flexibility to create more complex set schemes and arrays of set schemes (see `/assets/LiftingProgressions.jl`) do create more complex progressions. However, our boi "be grindin'"---evidenced by that one time he tried to sell you questionably-sourced protein powder---he therefore has a straight forward progression that is still giving him linear gains in the same manner Jeffrey Epstein didn't kill himself. Of course, you've slowly been creeping up on him while being half his size but what do you know, you're reading the documentation for a super niche product instead of benching your ass off.

```julia
TheGrind = Progression(
    type = LinearProgression(),
    name = "We Be Grindin'",
    sessions = 1,     # Number of different sessions in a week.
    period = 1,       # Number of weeks in the period.
    setScheme = TUT,  # Set scheme. The number of items here
                      # must be equal to sessions * period.
)
```

Brosef now has everything he needs to create his dream programme... aside from half repping bicep curls, quarter repping the leg press and training calves once a month after which he will be missing for a few days because "he went too hard and crushed legs four days ago", but this is enough for our purpose. He trains three days a week because he takes his recovery seriously and likes to party, so he can't no-life it like that jacked dude Brosef can totally out-bench.

```julia
# Define the programme's concrete type. Can be used to extend `makeDays`.
struct BrosefDreamProgramme <: AbstractProgramme end

# Define a dictionary that will contain an Exercise and its corresponding
# progression as a tuple or vector.
exerProg = Dict()

# Push to the dictionary. Using named tuples is recommended and making the
# key a string of the variable name makes things easier to follow.
push!(
    exerProg,
    "BenchPress" => (exercise = BenchPress, progression = TheGrind),
)

# Define the training week. Extending this to multiple weeks and different days
# can be done with arrays of arrays.
week = []
# Push the days to the week.
push!(week, BenchPress, TheGrind)
push!(week, "Rest")
push!(week, BenchPress, TheGrind)
push!(week, "Rest")
push!(week, BenchPress, TheGrind)

Programme(BrosefDreamProgramme(), "BrosefDreamProgramme", exerProg, week)
```
We need to create some dictionaries and arrays to hold the data as well as the type of the programme. This lets Julia work its multiple dispatch magic. There is also a function `makeDays` that can be extended to work with concrete subtypes of `AbstractProgramme`, allowing it to specialise for user defined programmes.

To see a more advanced example that showcases the functionality of the package see function `/assets/nSunsCAP3_OHP_6Day_LP.jl`, in particular function `makeDays` in line 386.

## Aditional Features

These sections haven't been written yet but can be explored by playing around with `/examples/LiftingProgrammes.jl`, they include:

- Updating rep maxes
- Various calculations
- IO
- Plotting

## FAQ

> What makes a weightlifting program successful? Your hard work and dedication.     
> - Greg Everett

- Is it overkill? Most definitely.
- What does it do? Lets you create and analyse lifting programmes.
- Why not use a spreadsheet? This is more general and powerful than a spreadsheet but admittedly less approachable for less techy people.
- Why not use an app instead? I use an app, [Zero to Hero](https://play.google.com/store/apps/details?id=com.mappz.zerotohero&hl=en_GB) highly recommended. The premium version is cheap and lets you create and modify progressions, it is very, very good. I've also used [TM Training](https://download.cnet.com/TM-Training/3000-2129_4-78297497.html) in the past and it is also very good but can be annoyingly buggy. I can recommend them both. This serves a different purpose, it serves a more analytic and design-oriented purpose. The apps are great for logging.


## Defaults

These are the default dictionaries defined in the programme. They are not explicitly exported so must be explicitly imported or accessed with the dot syntax:

```julia
import Lifting: Lifting_Aux

Lifting.Lifting_Exercise_Names
```

They dictionaries define the following keys. Explore them to see what they contain, add what you need... or not use them at all!

```julia
julia> keys(Lifting_Aux)
Base.KeySet for a Dict{String,Dict{String,String}} with 5 entries. Keys:
  "modality"
  "setType"
  "muscles"
  "equipmentSize"
  "equipment"

julia> keys(Lifting_Exercise_Names)
Base.KeySet for a Dict{String,Dict{String,String}} with 10 entries. Keys:
  "grip"
  "bench"
  "squat"
  "press"
  "isometric"
  "core"
  "pull"
  "row"
  "deadlift"
  "lowBack"

julia> keys(Lifting_Progressions)
Base.KeySet for a Dict{String,Progression} with 14 entries. Keys:
  "AMRAP_Cali"
  "nSuns_6Day_OHP"
  "AMRAP_Grip"
  "l23_lmh"
  "m23_lmh"
  "h23_lmh"
  "CAP3_Bench_T1"
  "CAP3_Row_T1"
  "CAP3_Squat_T2"
  "CAP3_Deadlift_T1"
  "CAP3_Squat_T1"
  "CAP3_Bench_T2"
  "CAP3_Deadlift_T2"
  "CAP3_Row_T2"

julia> keys(Lifting_Programmes)
Base.KeySet for a Dict{String,Programme} with 1 entry. Keys:
  "nSunsCAP3_OHP_6Day_LP"
```

### Adding to the Package

The recommended way for users to add their own creations to the package is to do so in the relevant `/src/assets` files and push them to their corresponding dictionaries. These can then be imported as normal. Users may also define their own modules that expand `Lifting.jl`'s functionality. These user-made modules can then be imported instead. Alternatively, additions may be made in their local environments, it will simply crowd your workspace.

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
