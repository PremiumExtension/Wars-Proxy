local ReplicatedStorage = game.ReplicatedStorage
local Assets = ReplicatedStorage.Assets
local GraphingStatistic = {}

function GraphingStatistic:add(frame,indexes:table,max:int,information:table,theme:table)
	for dec, index in pairs(indexes) do
		local ypercent = math.clamp(index/max,0,1)
		local xpercent = math.clamp(1/#indexes,0,1)
		local xppercent = math.clamp(1/#indexes,0,1)
		print(xpercent,ypercent,index/max,1/#indexes)
		local newGraph = Instance.new('Frame',frame)
		if theme then
			newGraph.BackgroundColor3 = theme[dec]
		else
			newGraph.BackgroundColor3 = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))
		end
		newGraph.BorderSizePixel = 0
		newGraph.Size = UDim2.fromScale(xpercent,ypercent)
		newGraph.Position = UDim2.fromScale(xpercent*(dec-1),1-ypercent)
		local graphInformation = Assets.statisticinfobox:Clone()
		graphInformation.Parent = newGraph
		graphInformation.title.Text = information[dec].title
		graphInformation.description.Text = information[dec].description
		graphInformation.Position = UDim2.fromScale(0,1)
		graphInformation.Visible = false
		newGraph.MouseEnter:Connect(function()
			graphInformation.Visible = true
			newGraph.MouseLeave:Wait()
			graphInformation.Visible = false
		end)
	end
end

return GraphingStatistic