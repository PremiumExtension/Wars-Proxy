local HoverService = {Type={Economy='Economy'}}
local RunService = game:GetService 'RunService'
function HoverService:Create(Type,Contents,MouseDisabled)
	local data = {}
	local player = game.Players.LocalPlayer
	local userMouse = player:GetMouse()
	if not player then
		error('The HoverService is Client side only',2)
	end
	local source = player:WaitForChild('PlayerGui',40):WaitForChild('Viewport',40):FindFirstChild(Type..'::InfoBox'):Clone()
	source.Parent = player:WaitForChild('PlayerGui',40):WaitForChild('Viewport',40):FindFirstChild('Wait')
	if Type == self.Type.Economy then
		source.Title.Text = Contents.Title
		source.Multiplier.Text = 'Multiplier: '..Contents.Multiplier..'x'
		source.Visible = true
		if Contents['Icon'] then
			source.Icon.Image = Contents.Icon
		end
	end
	function self:Remove():Remove_Prompt
		source:Destroy()
		if MouseDisabled then
			userMouse.Icon = data['MouseIcon']
		end
	end
	function self:Follow():Follows_The_Mouse
		RunService.RenderStepped:Connect(function(deltaTime)
			if source then
				source.Position = UDim2.fromOffset(userMouse.X,userMouse.Y)
				if MouseDisabled then
					data['MouseIcon'] = userMouse.Icon
					task.wait(0.02)
					userMouse.Icon = 'rbxassetid://0'
				end
			end
		end)
	end
	function self:Timer(sec)
		spawn(function()
			task.wait(sec)
			source:Destroy()
		end)
	end
	return self
end
return HoverService