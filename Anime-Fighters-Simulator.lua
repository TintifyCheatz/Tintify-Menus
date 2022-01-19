local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

local Venyx = library.new("T Hub")

local MainPage = Venyx:addPage("Main")
local MainAutoSection MainPage:addSection("Auto")

MainAutoSection:addDropdown("Auto Train Stat", {"Strength", "Durability", "Chakra", "Sword"}, function(SelectedStat)
    if SelectedStat == "Strength" then
        getgenv().TrainStat = "Strength"
    elseif SelectedStat == "Durability" then
        getgenv().TrainStat = "Durability"
    elseif SelectedStat == "Chakra" then
        getgenv().TrainStat = "Chakra"
    elseif SelectedStat == "Sword" then
        getgenv().TrainStat = "Sword"
    end
end)

MainAutoSection:addToggle("Toggle Auto Train", nil, function(TrainToggled)
    if TrainToggled then
        getgenv().AutoTrain = true
        while AutoTrain == true do
            local args = {
                [1] = "Stat",
                [2] = TrainStat
            }
        
            game:GetService("ReplicatedStorage").RSPackage.Events.StatFunction:InvokeServer(unpack(args))
        
        end
    else
        getgenv().AutoTrain = false
    end
end)