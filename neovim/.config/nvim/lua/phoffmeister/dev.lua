local function setup()
    --- P prints `thing` pretty
    ---@param thing any
    ---@return nil
    P = function(thing)
        print(vim.inspect(thing))
        return thing
    end
end

return {
    setup = setup,
}
