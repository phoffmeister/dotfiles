local function setup()
    P = function(thing)
        print(vim.inspect(thing))
        return thing
    end
end

return {
    setup = setup,
}
