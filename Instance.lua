local Instance = Instance
local Instance_new = Instance.new

local instance = {}
instance.__index = instance

function instance.createInstance(self, instanceName) 
    local new = {}
    local inst = Instance_new(instanceName)
    new[1] = inst  
    return new
end

function instance.new() 
    return setmetatable({}, instance)
end

-- print(instance.new():createInstance("Part")[1]) -> Part

return instance
