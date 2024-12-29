local repositoryURL = "https://raw.githubusercontent.com/bbop537/cc-stocks/refs/heads/main/"

term.clear()
term.setCursorPos(1,1)

print("CC-Stocks installer prompt:")
print("Terminal is "..(term.isColor() and "color" or "not color"))

print("Choose the type of install:")
print("1 - Stock customer")
print("2 - Stock broker")
print("3 - Stock host")

local choice = read()

if tonumber(choice) and math.floor(tonumber(choice)) == tonumber(choice) and tonumber(choice)>=1 and tonumber(choice) <= 3 then
    local types = {"customer", "broker", "host"}
    local chosen = types[tonumber(choice)]

    print("You have chosen: "..chosen)
    print("Strike Y or N to begin install.")

    local proceed = false
    while true do
        local event, char = os.pullEvent("char")
        if char=="y" or char=="n" then
            proceed = char=="y"
            break
        end
    end
    if not proceed then return end

    local response = http.get(repositoryURL.."types/"..chosen)
    print(response)
end

