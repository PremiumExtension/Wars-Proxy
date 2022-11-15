local abbreviations = {
	["k"] = 4,
	["m"] = 7,
	["b"] = 10,
	["t"] = 13,
	["qd"] = 16,
	["qi"] = 19,
	["se"] = 22,
	["sp"] = 25,
	["o"] = 28,
}

return {
	Number = function (num)
		local text = tostring(string.format("%.f",math.floor(num)))

		local chosenAbbreviation
		for abbreviation,digit in pairs(abbreviations) do
			if (#text >= digit and #text < (digit + 3)) then
				chosenAbbreviation = abbreviation
				break
			end
		end

		if (chosenAbbreviation) then
			local digits = abbreviations[chosenAbbreviation]

			local rounded = math.floor(num / 10 ^  (digits - 2)) * 10 ^  (digits - 2)
			text = string.format("%.1f", rounded / 10 ^ (digits - 1)) .. chosenAbbreviation
		else
			text = num
		end

		return text
	end,
    String = function (str,max)
        if str:len() >= max then
            return str:sub(1,max)..'...'
        end
    end
}