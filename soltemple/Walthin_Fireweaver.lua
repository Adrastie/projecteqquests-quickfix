-- Quests for Bard Lambent Armor

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Good day to you!  I am Walthin Fireweaver of the League of Antonican Bards.  My friend Cryssia and I are here while we deal in [" .. eq.say_link("lambent stones") .. "] with the followers of Solusek Ro.  If you are interested, Cryssia and I also deal in [" .. eq.say_link("lambent armor") .. "], the perfect armor for a bard of standing.  I also dabble in some research from time to time.  I'm a bit of a historian.  I study the history of [" .. eq.say_link("dragons") .. "].")
    elseif e.message:findi("dragons") then
        e.self:Say("I'm utterly fascinated by all things draconic.  There are many tomes in the temple's libraries that catalog much of their species' history.  Some day I'll have to travel to the frozen land of Velious and see what other secrets I can learn there.")
    elseif e.message:findi("lambent stones") then
        e.self:Say("Lambent stones are gemstones of great power.  They are midnight blue in color - if you want more information on them you should ask Genni.")
    elseif e.message:findi("lambent armor") then
        e.self:Say("Lambent armor is custom-crafted armor, made especially for bards. It is forged by the MeadowGreen brothers and then enchanted by the followers of Solusek Ro. If you are interested, I can tell you about [" .. eq.say_link("lambent gauntlets") .. "], [" .. eq.say_link("lambent greaves") .. "] and [" .. eq.say_link("lambent boots") .. "]. Cryssia can tell you about other lambent armor.")
    elseif e.message:findi("lambent gauntlets") then
        e.self:Say("Lambent gauntlets are exceptionally well made gauntlets.  If you are interested, I will give you a pair, but you will have to bring me the following items that I need for a trade with the followers of Solusek Ro.  I need shin gauntlets from a froglok knight and black silk gloves from Castle Mistmoore.  You will also need to talk to Genni about getting me a lambent star ruby.  Bring me these items and you will earn lambent gauntlets.")
    elseif e.message:findi("lambent greaves") then
        e.self:Say("There are no finer leggings for a bard than lambent greaves.  Collect for me two pairs of lesser greaves and I will give you some.  Bring me icy greaves from the caverns of Permafrost and shin greaves from a ghoul knight, as well as a lambent fire opal and I will bestow a pair of lambent greaves upon you .")
    elseif e.message:findi("lambent boots") then
        e.self:Say("Lambent boots are the boots of choice for most bards.  If you can bring me firewalker boots from a Solusek Mage and the middle portion of the rune of the One Eye from Froon then I ill give you a pair of lambent boots.  Oh, I almost forgot! I will need a lambent sapphire as well.")
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2318, item2 = 10119, item3 = 10561})) then
        e.self:Say("Excellent. Here are your Lambent Boots.");
        e.other:Faction(320,5);        -- Temple of Solusek Ro better
        e.other:Faction(291,-5);       -- Shadow Men worse
        e.other:QuestReward(e.self,0,0,0,0,4159,1000); --boots
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2319, item2 = 10117, item3 = 4114})) then
        e.self:Say("Excellent. Here are your Lambent Gauntlets.");
        e.other:Faction(320,5);        -- Temple of Solusek Ro better
        e.other:Faction(291,-5);       -- Shadow Men worse
        e.other:QuestReward(e.self,0,0,0,0,4157,1000); --gauntlets
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4115, item2 = 10128, item3 = 4116})) then
        e.self:Say("Excellent. Here are your Lambent Greaves.");
        e.other:Faction(320,5);        -- Temple of Solusek Ro better
        e.other:Faction(291,-5);       -- Shadow Men worse
        e.other:QuestReward(e.self,0,0,0,0,4158,1000); --greaves
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

