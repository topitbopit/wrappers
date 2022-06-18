local fastInstance = {}
local __metatable_getmetatable = getmetatable -- two underscores for k00lness

function fastInstance.new()
	local UltraFastInstance = newproxy(true) -- new proxy for more OPness
	local Inst = nil
	__metatable_getmetatable(UltraFastInstance).__index = function(_, K) -- hack index metamethod for OP
		if Inst[K] then
			return Inst[K]
		else
			return fastInstance[K]
		end
	end
	__metatable_getmetatable(UltraFastInstance).__newindex = function(_, K, V) -- hack newindex metamethod for OP
		Inst[K] = V
	end
	__metatable_getmetatable(UltraFastInstance).__add = function(_, A, B) -- hack add metamethod for OP
		-- print(_, A, B)
		Inst = Instance.new(A)
		return UltraFastInstance
	end
	__metatable_getmetatable(UltraFastInstance).__tostring = function() -- hack tostring metamethod to hijack the entity frame provider
		return ("OPInstance -> %s"):format(tostring(Inst)) --__op format
	end
	return UltraFastInstance
end

--[[EX_AMPL__E 🔥🔥🔥:
local OPInstance = (fastInstance.new() + "Part") -- create part instance
OPInstance.Parent = workspace
OPInstance.Name = "fastInstance 🚗🔥"
print(OPInstance, OPInstance.Parent)
]]

return fastInstance
