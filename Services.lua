local Service = {}

local _____getService = game and game.GetService
local _____findService = game and game.FindService

function Service.new()
	local nService = {}
	nService.Services = {}
	return setmetatable(nService, {
		__index = function(_, K)
			if not nService.Services[K] then
				nService.Services[K] = _____getService(game, K)
				if nService.Services[K] then
					return nService.Service[K]
				end
			else
				if nService.Services[K] then
					return nService.Service[K]
				end
			end
			return Service[K]
		end,
		__call = function(_, FuncName, Name)
			if FuncName == "get" then
				return Service[FuncName](nService, Name)
			else
				if FuncName == "find" then
					return Service[FuncName](nService, Name)
				end
			end
		end
	})
end

function Service:get(name)
	return self.Services[name] or self[name]
end

function Service:find(name)
	return self.Services[name] or _____findService(game, name)
end

return Service
