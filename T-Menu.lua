local TMenu = {}

function TMenu:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local MainHeader = Instance.new("Frame")
    local HeaderCorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Close = Instance.new("ImageButton")
    local MainSide = Instance.new("Frame")
    local MainSideCorner = Instance.new("UICorner")
    local TabFrames = Instance.new("Frame")
    local TabListing = Instance.new("UIListLayout")
    local Pages = Instance.new("Frame")
    local PageFolder = Instance.new("Folder")
    local page = Instance.new("ScrollingFrame")
    local pageListing = Instance.new("UIListLayout")
    
    local LibName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = LibName
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    Main.Position = UDim2.new(0.378151238, 0, 0.3254565, 0)
    Main.Size = UDim2.new(0, 550, 0, 325)

    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    MainHeader.Name = "MainHeader"
    MainHeader.Parent = Main
    MainHeader.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    MainHeader.Size = UDim2.new(0, 550, 0, 30)
    MainHeader.ZIndex = 2

    HeaderCorner.Name = "HeaderCorner"
    HeaderCorner.Parent = MainHeader

    Title.Name = "Title"
    Title.Parent = MainHeader
    Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0.0163636357, 0, 0, 0)
    Title.Size = UDim2.new(0, 475, 0, 30)
    Title.Font = Enum.Font.SourceSans
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Close.Name = "Close"
    Close.Parent = MainHeader
    Close.BackgroundTransparency = 1.000
    Close.LayoutOrder = 3
    Close.Position = UDim2.new(0.944999993, 0, 0.0666666627, 0)
    Close.Size = UDim2.new(0, 25, 0, 25)
    Close.ZIndex = 2
    Close.Image = "rbxassetid://3926305904"
    Close.ImageRectOffset = Vector2.new(924, 724)
    Close.ImageRectSize = Vector2.new(36, 36)
    Close.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    MainSide.Name = "MainSide"
    MainSide.Parent = Main
    MainSide.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    MainSide.Position = UDim2.new(0, 0, 0.0923076943, 0)
    MainSide.Size = UDim2.new(0, 150, 0, 295)

    MainSideCorner.Name = "MainSideCorner"
    MainSideCorner.Parent = MainSide

    TabFrames.Name = "TabFrames"
    TabFrames.Parent = MainSide
    TabFrames.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    TabFrames.BorderSizePixel = 0
    TabFrames.Position = UDim2.new(0.0466666669, 0, 0.0169491526, 0)
    TabFrames.Size = UDim2.new(0, 135, 0, 285)

    TabListing.Name = "TabListing"
    TabListing.Parent = TabFrames
    TabListing.SortOrder = Enum.SortOrder.LayoutOrder
    TabListing.Padding = UDim.new(0, 5)

    Pages.Name = "Pages"
    Pages.Parent = Main
    Pages.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    Pages.BorderSizePixel = 0
    Pages.Position = UDim2.new(0.290909082, 0, 0.123076923, 0)
    Pages.Size = UDim2.new(0, 380, 0, 275)
    Pages.ZIndex = 0

    PageFolder.Name = "PageFolder"
    PageFolder.Parent = Pages

    local Category = {}

    function Category:CreateCategory(CategoryName)
        local CategoryButton = Instance.new("TextButton")
        local CategoryCorner = Instance.new("UICorner")
        local page = Instance.new("ScrollingFrame")
        local pageListing = Instance.new("UIListLayout")

        page.Name = "page"
        page.Parent = PageFolder
        page.Active = true
        page.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        page.BorderSizePixel = 0
        page.Size = UDim2.new(0, 380, 0, 275)
        page.ScrollBarThickness = 6

        pageListing.Name = "pageListing"
        pageListing.Parent = page
        pageListing.SortOrder = Enum.SortOrder.LayoutOrder
        
        CategoryButton.Name = "TabButton"
        CategoryButton.Parent = TabFrames
        CategoryButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CategoryButton.Size = UDim2.new(0, 135, 0, 30)
        CategoryButton.Font = Enum.Font.SourceSans
        CategoryButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        CategoryButton.TextSize = 14.000

        CategoryCorner.CornerRadius = UDim.new(0, 4)
        CategoryCorner.Parent = TabButton
    end
    return Category
end

local main = TMenu:CreateWindow("T Hub")

local TestCategory = main:CreateCategory("Test1223")
local TestCategory = main:CreateCategory("Test1222")