--[[
-- Anguish Zone_Status
-- Control the Player Lockouts
--
-- Lockouts: 
-- Add - Bit - Mob/event
-- 1 -     1 - keldovan
-- 2 -     2 - jelvan
-- 3 -     4 - ture
-- 4 -     8 - hanvar
-- 5 -    16 - amv
-- 6 -    32 - omm
--
-- Mob IDs:
--
-- Zone Trash:
--
--]]
--
local lockout_bit;
local instance_id = 0;
local qglobals = {};
local charid_list;
local current_bit = 0;
local entity_list;
local instance_requests = require("instance_requests");
local Anguish_Lockouts = {}

function setup_lockouts()
  Anguish_Lockouts = {
    [317005] = {'Anguish_keldovan', 1,  Spawn_keldovan},
    [317004] = {'Anguish_jelvan',   2,  Spawn_jelvan},
    [317003] = {'Anguish_ture',     4,  Spawn_ture},
    [317002] = {'Anguish_hanvar',   8,  Spawn_hanvar},
    [317001] = {'Anguish_amv',      16, Spawn_amv},
    [317000] = {'Anguish_omm',      32, Spawn_omm}
  }
end

function event_spawn(e)
  qglobals = eq.get_qglobals();
  instance_id = eq.get_zone_instance_id();
  charid_list = eq.get_characters_in_instance(instance_id);
  entity_list = eq.get_entity_list();
  lockout_bit = tonumber(qglobals[instance_id .. "_anguish_bit"]);
  if (lockout_bit == nil) then lockout_bit = 0 end
  setup_lockouts();

  for k,v in pairs(Anguish_Lockouts) do
    if (bit.band(lockout_bit, v[2]) == 0 and v[3] ~= nil ) then
      v[3]();
    end
  end

end

function Spawn_keldovan()
end

function Spawn_jelvan()
end

function Spawn_ture()
end

function Spawn_hanvar()
end

function Spawn_amv()
end

function Spawn_omm()
end


function AddLockout(lockout)
  local lockout_name = lockout[1]; 
  local lockout_bit = lockout[2];

  current_bit = tonumber(qglobals[instance_id.."_anguish_bit"]); 
  eq.set_global(instance_id.."_anguish_bit",tostring(bit.bor(current_bit,lockout_bit)),7,"H6"); 

  for k,v in pairs(charid_list) do
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
  end                                                                                                           
end

function event_signal(e)
  if ( Anguish_Lockouts[e.signal] ~= nil ) then
    AddLockout( Anguish_Lockouts[e.signal] );
  end
end

