local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/TintifyCheatz/Tintify-Menus/main/Venyx-UI-Library-Custom.lua"))()

local Hub = library.new("T Hub")

local MainPage = Hub:addPage({
    title = "Main"
})

local MainStatsSection = MainPage:addSection({
    title = "Stats"
})

local AutoTrainDropdownContent = {"Strength", "Durability", "Chakra", "Sword"}
MainStatsSection:addDropdown({
    title = "Auto Train Stat",
    list = AutoTrainDropdownContent,
    callback = function(SelectedStat)
        if SelectedStat == "Strength" then
            getgenv().TrainStat = "Strength"
        elseif SelectedStat == "Durability" then
            getgenv().TrainStat = "Durability"
        elseif SelectedStat == "Chakra" then
            getgenv().TrainStat = "Chakra"
        elseif SelectedStat == "Sword" then
            getgenv().TrainStat = "Sword"
        end
    end
})

MainStatsSection:addSlider({
    title = "Auto Train Speed",
    default = 0.05,
    min = 0.05,
    max = 2,
    callback = function(AutoTrainSpeedValue)
        getgenv().AutoTrainSpeed = AutoTrainSpeedValue
    end
})

MainStatsSection:addToggle({
    title = "Toggle Auto Train",
    callback = function(AutoTrain)
        if AutoTrain then
            getgenv().AutoTrain = true
            while AutoTrain == true do
                wait(AutoTrainSpeed)
                local args = {
                    [1] = "Stat",
                    [2] = TrainStat
                }
            
                game:GetService("ReplicatedStorage").RSPackage.Events.StatFunction:InvokeServer(unpack(args))
            
            end
        else
            getgenv().AutoTrain = false
        end
    end
})

local SettingsPage = Hub:addPage({
    title = "Settings"
})

local SettingsKeybindsSection = SettingsPage:addSection({
    title = "Keybinds"
})

SettingsKeybindsSection:addKeybind({
    title = "Toggle Menu Key (Standard: Home)",
    key = Enum.KeyCode.Insert,
    callback = function()
        print("Activated Keybind!")
        Hub:toggle()
    end,
    changedCallback = function(key)
        print("Changed Keybind to", key)
    end
})

SettingsKeybindsSection:addKeybind({
    title = "Kill Menu Key (Standard: Delete)",
    key = Enum.KeyCode.Delete,
    callback = function()
        print("Activated Keybind!")
        Hub:Kill()
    end,
    changedCallback = function(key)
        print("Changed Keybind to", key)
    end
})