local function set(t, k, v) 
    t[k] = v 
end

local function get(t, k) 
    return t[k]
end

local IndexService = {}
set(IndexService, '__index', IndexService)
set(IndexService, 'type', 'IndexService')


set(IndexService, 'new', function()
    return setmetatable({}, IndexService)
end)


set(IndexService, 'index', function(self, t, k)
    if (self and self.type == 'IndexService') then 
        return get(t, k)
    else
        return error('not an index class',2) 
    end
end)

set(IndexService, 'newindex', function(self, t, k, v)
    if (self and self.type == 'IndexService') then 
        if t and k and v then
            return set(t, k, v)
        elseif not t and not k and not v then 
            return error('missing args',2) 
        elseif not t and k and not v then 
            return error('missing args',2) 
        elseif not t and not k and v then 
            return error('missing args',2) 
        elseif not t and k and v then 
            return error('missing args',2) 
        elseif not k and not t and not v then 
            return error('missing args',2) 
        elseif not k and t and not v then 
            return error('missing args',2) 
        elseif not k and not t and v then 
            return error('missing args',2) 
        elseif not k and t and v then 
            return error('missing args',2) 
        elseif not v and not t and not v then 
            return error('missing args',2) 
        elseif not v and t and not v then 
            return error('missing args',2) 
        elseif not v and not t and v then 
            return error('missing args',2) 
        elseif not v and t and v then 
            return error('missing args',2) 
        else 
            return error('missing args',2) 
        end
    else
        return error('not an index class',2) 
    end
end)

return IndexService
