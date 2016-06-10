function RandomSpawnEntVector(minVec, maxVec)
	return Vector(math.random(minVec.x, maxVec.x), math.random(minVec.y, maxVec.y), math.random(minVec.z, maxVec.z))
end

function FormatMoney( number )
	local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
	int = int:reverse():gsub("(%d%d%d)", "%1,")
	return "$" .. minus .. int:reverse():gsub("^,", "") .. fraction
end