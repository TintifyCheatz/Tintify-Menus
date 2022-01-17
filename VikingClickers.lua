local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Viking Clickers GUI", "Midnight")

local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Auto")
MainSection:NewSlider("Click Delay", "Changes the delay of the auto clicker (.1s-2s)", 2000, 100, function(v) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().ClickDelay = v/1000
end)


MainSection:NewToggle("Toggle Auto Clicker", "ToggleInfo", function(ToggleAutoClicking)

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

MainSection:NewSlider("Rebirth Delay", "Changes the delay of the auto clicker (.1s-2s)", 2000, 100, function(v) -- 500 (MaxValue) | 0 (MinValue)
    getgenv().RebirthDelay = v/1000
end)

MainSection:NewDropdown("Rebirth Amount", "Pick the amount to auto rebirth", {"1", "10", "100", "1k" , "10k" , "100k", "1m", "10m"}, function(currentOption)

    if currentOption == "1" then
        getgenv().SelectedRebirth = 1
    elseif currentOption == "10" then
        getgenv().SelectedRebirth = 10
                
    elseif currentOption == "100" then
        getgenv().SelectedRebirth = 100
    
    elseif currentOption == "1k" then
        getgenv().SelectedRebirth = 1000
    
    elseif currentOption == "10k" then
        getgenv().SelectedRebirth = 10000
    
    elseif currentOption == "100k" then
        getgenv().SelectedRebirth = 100000
    
    elseif currentOption == "1m" then
        getgenv().SelectedRebirth = 1000000
        
    elseif currentOption == "10m" then
        getgenv().SelectedRebirth = 10000000
    end

end)

MainSection:NewToggle("Toggle Auto Rebirth", "Toggles auto rebirth", function(ToggleAutoRebirth)

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
