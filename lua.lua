coroutine.wrap(function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/treeofplant/lua/main/luaa.lua"))
end)
end)()

local Notice = Instance.new("ScreenGui")
local Hold = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local Folder = Instance.new("Folder")
local TextButton = Instance.new("TextButton")
local UIListLayout_2 = Instance.new("UIListLayout")
local TextBox = Instance.new("TextBox")
local TextLabel_2 = Instance.new("TextLabel")
local UIListLayout_3 = Instance.new("UIListLayout")

--Properties:

Notice.Name = "Notice"
Notice.Parent = game.CoreGui
Notice.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Hold.Name = "Hold"
Hold.Parent = Notice
Hold.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Hold.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hold.BorderSizePixel = 0
Hold.Position = UDim2.new(0.35998109, 0, 0.339506179, 0)
Hold.Size = UDim2.new(0, 296, 0, 278)

TextLabel.Parent = Hold
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.091216214, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 221, 0, 33)
TextLabel.Font = Enum.Font.Cartoon
TextLabel.Text = "Copy the text"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000

Frame.Parent = Hold
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.143884897, 0)
Frame.Size = UDim2.new(0, 296, 0, 1)

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Hold

UIListLayout.Parent = Hold
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

Folder.Parent = Hold

TextButton.Parent = Folder
TextButton.BackgroundColor3 = Color3.fromRGB(172, 22, 22)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.864864886, 0, 0, 0)
TextButton.Size = UDim2.new(0, 40, 0, 28)
TextButton.Font = Enum.Font.Jura
TextButton.Text = "X"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 25.000

UIListLayout_2.Parent = Folder
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

TextBox.Parent = Hold
TextBox.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
TextBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.0270270277, 0, 0.273381293, 0)
TextBox.Size = UDim2.new(0, 280, 0, 191)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 11.000
TextBox.TextWrapped = true

TextLabel_2.Parent = Hold
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.0540540554, 0, 0.892086327, 0)
TextLabel_2.Size = UDim2.new(0, 262, 0, 12)
TextLabel_2.Font = Enum.Font.Arial
TextLabel_2.Text = "Once copied click \"I am done\""
TextLabel_2.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel_2.TextSize = 16.000

UIListLayout_3.Parent = Notice
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center

-- Scripts:

local function CUCRA_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(CUCRA_fake_script)()
local function ISEG_fake_script() -- TextBox.LocalScript 
	local script = Instance.new('LocalScript', TextBox)

	while wait() do
		pcall(function()
			pcall(function()
				for i,v in pairs(game.CoreGui["Notification | Cz8pLe-dJem1m-l1mdka-sxi53d"].Frame:GetDescendants()) do
					pcall(function()
						if v:IsA("TextLabel") and v.Name == "Title" then
							if v.Text:lower() == "saved to workspace" then
								game.CoreGui["Notification | Cz8pLe-dJem1m-l1mdka-sxi53d"]:Destroy()
							end
						end
					end)
				end
			end)
			script.Parent.Text = readfile("PremOutput.txt")
			
		end)
	end
end
coroutine.wrap(ISEG_fake_script)()
local function POLZ_fake_script() -- Hold.drag 
	local script = Instance.new('LocalScript', Hold)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)

end
coroutine.wrap(POLZ_fake_script)()
		

