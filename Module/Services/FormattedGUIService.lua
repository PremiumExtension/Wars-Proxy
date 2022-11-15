local GUI = {Button={}}

function GUI.Button:Disabled(button)
	local disableFrame = Instance.new('Frame',button)
	disableFrame.Size = UDim2.fromScale(1,1)
	disableFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	disableFrame.BackgroundTransparency = 0.75
	disableFrame.Name = "::disabled"
	button.Active = false
	function self:Enabled()
		disableFrame:Destroy()
		button.Active = true
	end
	return self
end
function GUI.Button:Enabled(button)
	if button:FindFirstChild('::disabled') then
		button:FindFirstChild('::disabled'):Destroy()
	else
		error('The button is not disabled!',2)
	end
end

return GUI