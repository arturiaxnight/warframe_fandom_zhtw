local p = {}
local dictionary = mw.loadData('模組:翻譯/資料')

function p.E2T(frame)
	local text = frame.args[1]
	return dictionary[text]
end

 
return p

