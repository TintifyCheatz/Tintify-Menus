local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Viking Clickers GUI", "Midnight")
local Main = Window:NewTab("Main")
local Settings = Window:NewTab("Settings")

local ClickingSection = Main:NewSection("Clicking")

ClickingSection:NewSlider("Click Delay", "Changes the delay of the auto clicker (.1s-2s)", 2000, 100, function(v) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().ClickDelay = v/1000
end)


ClickingSection:NewToggle("Toggle Auto Clicker", "ToggleInfo", function(ToggleAutoClicking)

    if ToggleAutoClicking then
        getgenv().Clicking = true
        while Clicking == true do
            wait(ClickDelay)
            local args = {
                [1] = "ClickedButton"
            }
            game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
        end
    else
        getgenv().Clicking = false
    end

end)


local RebirthSection = Main:NewSection("Rebirth")

RebirthSection:NewSlider("Rebirth Delay", "Changes the delay of the auto clicker (.1s-2s)", 2000, 100, function(v) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().RebirthDelay = v/1000
end)

RebirthSection:NewDropdown("Rebirth Amount", "Pick the amount to auto rebirth", {"1", "10", "100", "1k" , "10k" , "100k", "1m", "10m"}, function(CurrentOption)

    if CurrentOption == "1" then
        getgenv().SelectedRebirth = 1
    elseif CurrentOption == "10" then
        getgenv().SelectedRebirth = 10
                
    elseif CurrentOption == "100" then
        getgenv().SelectedRebirth = 100
    
    elseif CurrentOption == "1k" then
        getgenv().SelectedRebirth = 1000
    
    elseif CurrentOption == "10k" then
        getgenv().SelectedRebirth = 10000
    
    elseif CurrentOption == "100k" then
        getgenv().SelectedRebirth = 100000
    
    elseif CurrentOption == "1m" then
        getgenv().SelectedRebirth = 1000000
        
    elseif CurrentOption == "10m" then
        getgenv().SelectedRebirth = 10000000
    end

end)

RebirthSection:NewToggle("Toggle Auto Rebirth", "Toggles auto rebirth", function(ToggleAutoRebirth)

    if ToggleAutoRebirth then
        getgenv().Rebirthing = true
        while Rebirthing == true do
            wait(RebirthDelay)
            local args = {
                [1] = SelectedRebirth
            }
            game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
        end
    else
        getgenv().Rebirthing = false
    end
    
end)

local EggsSection = Main:NewSection("Eggs")

EggsSection:NewSlider("Egg Open Amount", "Changes the amount of the auto egg opener (1-50)", 50, 1, function(v) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().RebirthDelay = v/1000
end)

EggsSection:NewDropdown("Egg Type", "Pick what egg to open", {"Basic Egg, 250"}, function(CurrentOption)

    if CurrentOption == "Basic Egg, 250" then
        getgenv().SelectedEgg = "Spoil"
    end

end)

EggsSection:NewButton("Buy Egg", "Buys the selected egg", function(v)
    
local args = {
    [1] = SelectedEgg
}

game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))

end)