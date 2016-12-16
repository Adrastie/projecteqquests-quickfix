function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["monk_epic"] >= "7" and e.message:findi("hail")) then
		e.other:Message(6,"As you look at Windrush's face you can feel that you share a common bond with it. You can hear a faint voice in your mind that says, 'Speak the words of the Master. [" .. eq.say_link("I am of the body") .. "].");
		e.self:Say("Leave before I send you to your god.");
	elseif(qglobals["monk_epic"] >= "7" and e.message:findi("body")) then
		e.other:Message(6,"As you speak you can see that you have stirred something from within this creature");	
		e.self:Say("I will teach you to disturb what you cannot change!");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:AddToHateList(e.other,1);
	end		
end

function event_combat(e)
  if (e.joined == true) then
	eq.set_timer("depop", 1800 * 1000);
  end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop_with_timer();
	end
end