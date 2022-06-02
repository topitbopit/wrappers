local ServiceClass = {}
ServiceClass.__index = ServiceClass
ServiceClass.type = 'ServiceClass'

function ServiceClass.new() 
    return setmetatable({}, ServiceClass)
end

function ServiceClass:getService(name)
    if (self and self.type == 'ServiceClass') then 
        return Game['GetService'](Game, name)
    else
        return error('not a service class',2) 
    end
end

function ServiceClass:findService(name)
    if (self and self.type == 'ServiceClass') then 
        return Game['FindService'](Game, name)
    else
        return error('not a service class',2) 
    end
end

ServiceClass.__call = function(self, func, name) 
    if (func == 'get') then
        return ServiceClass.new():getService(name)
    elseif (func == 'find') then
        return ServiceClass.new():findService(name)
    else
        return error('unknown service operation',2) 
    end
end

return ServiceClass
