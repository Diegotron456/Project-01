/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR time = -1 //  0 Morning, 1 Noon, 2 Night
VAR strength = 0
VAR total_fish = 0
VAR seashell = 0
VAR first_time = 0
VAR first_time2 = 0
-> seashore


== seashore ==

It is { advance_time() }, and the weather today is {random1()}
{first_time == 0: You ask yourself "Whre am I?" Searching your surroundings, you are on a deserted island with plentiful floura and diverse species of fish. There are rivers gleaming like sapphire, and an irridescent ocean surrounding your new loaction. Theres only one thing as of now, and its to get stronger and explore the fauna, starting with the fish.}
{time == 0: You stand upon the golden shimmers of sand, beamed down by a golden light in the sky.}
{time == 1: A cool breeze rushes through the sky, with the sun dazzling glittering light through the clouds.}
{time == 2: As the gold light sinks in the horizon, you can't do much other than rest for now.}

{strength == 15 and seashell == 3 and total_fish == 5:Upon further analyzation, these seashells would make a great lure for a huge fish... Come to think of it, there is a large cave over the side of the island, here's hoping somethin' shiny could lure the beast out... but it might be wise to bring some bait as well.}


~ first_time = first_time +1

+ {time <= 1} [Stroll down the beach] -> beach2
+ {time == 2 } [Rest] -> cottage
+ {time <= 1} [Go Fishing!] -> fishing1
+ {time <= 1} [Workout] -> workout1
+ [Check Stats] -> check_stats1

{strength == 15 and seashell == 3 and total_fish == 5} [Enter the Cave (ENDING)] -> kraken

== beach2 ==

It is {advance_time() }, and the weather is {random1()}

{first_time2 == 0:Upon further exploration, there is a deep blue ocean of water hiding behind a jungle of trees, with a seemingly abundant of species of fish you've never seen before! "This will require further exploration and fishing! However, I do not seem strong enough to fish these fellas up, gonna have to workout when I have some free time and get stronger to do so!" you say to yourself, excited for what the blue hole will reward you with.}

{time == 0: The coast glimmers with white light, a refreshing sight indeed.}
{time == 1: As the sparkles in the sand shimmer, you see some seashells lying around.}
{time == 2: With the light fading in the backround, the golden sands change into glistening silver, as you drift off to sleep.}

~ first_time2 = first_time2 +1

+ { time == 1 } [Pick up some seashells!] -> shells
+ {time <= 1} [Stroll back down the beach] -> seashore
+ {time == 2 } [Rest] -> cottage
+ {time <= 1} [Workout] -> workout2
+ {strength == 10} [Go Fishing Lvl. 2!] -> fishing2
+ [Check Stats] -> check_stats2

== shells ==
You pick up the shells! Very shiny...
~ seashell = seashell +1
-> beach2

== fishing1 ==
You caught {random2()}
~ total_fish = random2 + random3
{time == 2: After some fighting against the fish, you decide its time to hit the hay and continue your journey tomorrow.}

+ {time == 2} [Rest] -> cottage
+ {time <= 1} [Go Back] -> seashore

== fishing2 ==
You caught {random3()}
~ total_fish = random2 + random3
{time == 2: After some fighting against the more fierce fish, you decide its time to hit the hay and continue your journey tomorrow, wondering what big fish you'll end up catching...}

+ {time == 2} [Rest] -> cottage
+ {time <= 1} [Go Back] -> seashore


== workout1 ==

{~You decide to do some pushups.|You do some situps.|You do some burpees.}
~ strength = strength + 1
/* I want to be able to make strength a tool to be able to fish up larger fish/more difficult fish in the game.*/
 [+1 Strength]
+ [Back To Seashore] ->seashore

== workout2 ==

{~You decide to do some pushups.|You do some situps.|You do some burpees.}
~ strength = strength + 1
 [+1 Strength]
+ [Back To Beach] ->beach2


== check_stats1 ==
You have {strength} strength.{strength <= 9: Reach Level 10 strength to catch more fish!}
You have {total_fish} fish. 
You have {seashell} {seashell != 1: seashells.}{seashell == 1: seashell.}

~ time = time -1

-> seashore
== check_stats2 ==
You have {strength} strength.{strength <= 9: Reach Level 10 strength to catch more fish!}{strength >= 10: You can now catch bigger fish on the upperside of the beach!}
You have {total_fish} fish. 
You have {seashell} {seashell != 1: seashells.}{seashell == 1: seashell.}

~ time = time -1
-> beach2


== cottage ==
{&You nod off peacefully in your tiny cottage, hoping to start another journey tomorrow!|After a long day, you decide right now is the best time for some good rest.|Finally! Some rest! Now is the best time to get rest for a big day tomorrow!}
->dream

== dream ==

{~As you drift off, you feel a weird presence, like a figure trying to pry your eyes open, but in a totally not so killing way, but rather much of a caring way. "Wake up..."|Fish, fish, and more fish... I wonder what types I will catch tomorrow...|Man, those Blood Moons sure do have some unique effect on the fish, too bad that I cannot code that yet at my level.}
+ [Wake up...] -> seashore

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    
    {    
        - time == 0:
            ~ return "morning"
        
        - time == 1:
            ~ return "noon"
        
        - time == 2:
            ~ return "night"
    
    }
    
    
        
    ~ return time
    

== function random1 ==
{shuffle:
- ~ return "cloudy."
- ~ return "rainy."
- ~ return "clear."
- ~ return "BLOOD MOON!"
- ~ return "sunny."
}

~ return random1

== function random2 ==
/*More fish to come in the future, im gonna make this the game for my first and my final project!!!*/
{shuffle:
- ~ return "nothing... better luck next time!"
- ~ return "a bass!"
- ~ return "a Johnathan Carpicuss!"
- ~ return "a carp!"
- ~ return "a salmon!"
- ~ return "a puffer fish!"
- ~ return "a eel!"
- ~ return "starfish."
- ~ return "a bluegill!"
- ~ return "a parrotfish!"
- ~ return "a Red Lobster! (YUM)"
- ~ return "a red herring!"
- ~ return "a treasure chest!.. fish?"
- ~ return "a... fishing rod fish...?"
    }
    ~ return random2
    
== function random3 ==

{shuffle:
- ~ return "a whale shark!"
- ~ return "a tuna!"
- ~ return "nothing... better luck next time!"
- ~ return "a kraken!"
- ~ return "a Dreadnautilus!"
- ~ return "a spider crab!"
- ~ return "a mahi-mahi!"
- ~ return "a dunkleosteus!"
- ~ return "a arapaima!"
- ~ return "a sunfish!"

}
~ return random3


== kraken ==
As you enter the cave, you feel a formidable aura luminating your mind, it gets number the further you dive into this cave. the cave is incredibly large, with a giant pond of blackness, unable to see the bottom. Then suddenly, a large thrash could be heard. You quickly snap to your senses, and proceed to witness the creature of creatures: the KRAKEN!

You've gotta combine all the experiences on this island to conquer it, and all you can do is FISH, FISH, AND FISH!!!
{strength == 15 and seashell == 3 and total_fish >= 5}[Fish THAT MONSTER!!!] -> ending1
{strength == 15 and seashell == 3 and total_fish <= 5}[Fish THAT FISH!!!] -> ending2

== ending1 ==
You combine all your strength, your seashells, and the fish you've caught, and decide to tackle this abomination. You spread the fish you've caught everywhere around the Kraken, and distract it's tentacles. You use your strength to hook onto the beasts eye, and pull with all your might! With the kraken honing in on you, you take out your seashells and throw them high in the air, the shine temporarily blinding the kraken! NOWS YOUR CHANCE! 

You reel the beast and smash its big eye onto a sharp stalagmite, ending the beast instantly. As you were preparing to celebrate, the black water and kraken shine bright right before vanishing into a flashing ball of light. The hole where the kraken was in  dried out, and you discovered a secret treasure hoard! You decide to live your life on this island, realizing that this was the best life you could have asked for...

A beautiful ending wouldn't you say?
->END
== ending2 ==
Although you reel the krakens eyeball, you didnt have enough bait to distract the tentacles for a surprise opporunity. Sure you distracted the kraken with your shells, but you didn't have enough fish to distract it, so the kraken took it upon itslef to turn you into fish food. With one swipe, it smashes your head into the rocky ceiling, destroying your sense of anything. The last thing you remember before going unconscious is sinking deep into the black abyssal water... with no hope of anyone rescuing you...


You sleep with the fishes...
->END






