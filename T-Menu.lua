local TMenu = {}

function TMenu:CreateWindow(title)
    title  = title or "Title"
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local MainHeader = Instance.new("Frame")
    local HeaderCorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Close = Instance.new("ImageButton")
    local MainSide = Instance.new("Frame")
    local MainSideCorner = Instance.new("UICorner")
    local CategoryFrames = Instance.new("Frame")
    local CategoryListing = Instance.new("UIListLayout")
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

    CategoryFrames.Name = "CategoryFrames"
    CategoryFrames.Parent = MainSide
    CategoryFrames.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
    CategoryFrames.BorderSizePixel = 0
    CategoryFrames.Position = UDim2.new(0.0466666669, 0, 0.0169491526, 0)
    CategoryFrames.Size = UDim2.new(0, 135, 0, 285)

    CategoryListing.Name = "CategoryListing"
    CategoryListing.Parent = CategoryFrames
    CategoryListing.SortOrder = Enum.SortOrder.LayoutOrder
    CategoryListing.Padding = UDim.new(0, 5)

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

    local first = true
    function Category:NewCategory(CategoryName)
        CategoryName = CategoryName or "Category"
        local CategoryCorner = Instance.new("UICorner")
        local CategoryButton = Instance.new("TextButton")
        local page = Instance.new("ScrollingFrame")
        local pageListing = Instance.new("UIListLayout")

        local function UpdateSize()
            local cS = pageListing.AbsoluteContentSize

            game.TweenService:Create(page, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                CanvasSize = UDim2.new(0,cS.X,0,cS.Y)
            }):Play()
        end

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
        pageListing.Padding = UDim.new(0, 6)
        
        CategoryButton.Name = "CategoryButton"
        CategoryButton.Parent = CategoryFrames
        CategoryButton.BackgroundColor3 = Color3.fromRGB(150, 44, 255)
        CategoryButton.Size = UDim2.new(0, 135, 0, 30)
        CategoryButton.Font = Enum.Font.SourceSans
        CategoryButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        CategoryButton.TextSize = 14.000

        CategoryCorner.CornerRadius = UDim.new(0, 4)
        CategoryCorner.Parent = CategoryButton

        if first then
            first = false
            page.Visible = true
            CategoryButton.BackgroundTransparency = 0
        else
            page.Visible = false
            CategoryButton.BackgroundTransparency = 1
        end

        table.insert(Category, CategoryName)

        page.ChildAdded:Connect(UpdateSize)
        page.ChildRemoved:Connect(UpdateSize)

        CategoryButton.MouseButton1Click:Connect(function()
            for i,v in next, Pages:GetChildren() do
            v.Visible = false
            end
            page.Visible = true
        end)

        local Sections = {}

        function Sections:NewSection(sectionName, hidden)
            sectionName = sectionName or "Section"
            local SectionFunctions = {}
            local Modules = {}
        hidden = hidden or "false"
            local SectionFrame = Instance.new("Frame")
            local SectionListing = Instance.new("UIListLayout")
            local SectionButton = Instance.new("TextButton")
            local SectionCorner = Instance.new("UICorner")
            local SectionInners = Instance.new("Frame")
            local SectionInnersListing = Instance.new("UIListLayout")
        if hidden then
            SectionInners.Visible = false
        else
            SectionInners.Visible = true
        end

            SectionFrame.Name = "SectionFrame"
            SectionFrame.Parent = page
            SectionFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            SectionFrame.BorderSizePixel = 0
            SectionFrame.Size = UDim2.new(0, 365, 0, 275)
            
            SectionListing.Name = "SectionListing"
            SectionListing.Parent = SectionFrame
            SectionListing.SortOrder = Enum.SortOrder.LayoutOrder
            SectionListing.Padding = UDim.new(0, 6)
            
            SectionButton.Name = "SectionButton"
            SectionButton.Parent = SectionFrame
            SectionButton.BackgroundColor3 = Color3.fromRGB(150, 44, 255)
            SectionButton.Size = UDim2.new(0, 359, 0, 35)
            SectionButton.Font = Enum.Font.SourceSans
            SectionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionButton.TextSize = 20.000
            
            SectionCorner.CornerRadius = UDim.new(0, 4)
            SectionCorner.Name = "SectionCorner"
            SectionCorner.Parent = SectionButton
            
            SectionInners.Name = "SectionInners"
            SectionInners.Parent = SectionButton
            SectionInners.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            SectionInners.BorderSizePixel = 0
            SectionInners.Position = UDim2.new(0, 0, 1.28571427, 0)
            SectionInners.Size = UDim2.new(0, 356, 0, 230)
            
            SectionInnersListing.Name = "SectionInnersListing"
            SectionInnersListing.Parent = SectionInners
            SectionInnersListing.SortOrder = Enum.SortOrder.LayoutOrder
        end
    end
    return Category
end

local main = TMenu:CreateWindow("T Hub")

local TestCategory = main:NewCategory("Test1223")
local TestCategory2 = main:NewCategory("Test1222")

local TestSection = TestCategory:NewSection("Test122323")