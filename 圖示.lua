--WARFRAME 繁體中文維基 圖示模組
--https://warframe.fandom.com/zh-tw/
--原作者：ChickenBar (US-wiki)
--改寫：Arturiaxnight (TW-wiki)

local p = {}

local IconData = mw.loadData( '模組:圖示/資料' )


function p.Proc( frame )
    local iconname = frame.args[1]        
    local textexist = frame.args[2]          
    local color = frame.args[3]
    local imagesize = frame.args.imgsize
    local ignoreColor = frame.args.ignoreColor
    if(ignoreColor ~= nil and string.upper(ignoreColor) ~= "NO" and string.upper(ignoreColor) ~= "FALSE") then
        ignoreColor = true
    else
        ignoreColor = false
    end
    return p._Proc(iconname, textexist, color, imagesize, ignoreColor)
end

function p._Proc(iconname, textexist, color, imagesize, ignoreTextColor)
    local link = ''
    local iconFile = ""
    local textcolor = ''
    local title = ''
    local span1 = ''
    local span2 = ''
    
    if (string.upper(iconname) == "UNKNOWN") then
        return ""
    elseif IconData["異常狀態"][iconname] == nil then          
        return "<span style=\"color:red;\">錯誤</span>"
    else
        local spanTable = tooltipSpan(iconname, "異常狀態")
        if spanTable then
            span1 = spanTable[1]
            span2 = spanTable[2]
        end
        local tooltip = IconData["異常狀態"][iconname]["title"]
        link = IconData["異常狀態"][iconname]["link"]
        if color == '白' then
            iconFile = IconData["異常狀態"][iconname]["icon"][2]   --white icon
        else
            iconFile = IconData["異常狀態"][iconname]["icon"][1]   --black icon
        end
    
        if (imagesize == nil or imagesize == '') then
            imagesize = 'x18'                                 
        end
        if (textexist == '文字') then  
            textcolor = IconData["異常狀態"][iconname]["color"]
            if(ignoreTextColor == nil or not ignoreTextColor) then
                if(tooltip ~= nil and tooltip ~= '') then
                    return span1..'[[File:'..iconFile..'|'..imagesize..'px|link='..link..'|'..tooltip..']] [['..link..'|<span style=\"color:'..textcolor..';\">'..iconname..'</span>]]'..span2
                else
                    return span1..'[[File:'..iconFile..'|'..imagesize..'px|link='..link..']] [['..link..'|<span style=\"color:'..textcolor..';\">'..iconname..'</span>]]'..span2
                end
            else
                if(tooltip ~= nil and tooltip ~= '') then
                    return span1..'[[File:'..iconFile..'|'..imagesize..'px|link='..link..'|'..tooltip..']] [['..link..'|'..iconname..']]'..span2
                else
                    return span1..'[[File:'..iconFile..'|'..imagesize..'px|link='..link..']] [['..link..'|'..iconname..']]'..span2
                end
            end 
        end
        if(tooltip ~= nil and tooltip ~= '') then
            return span1..'[[File:'..iconFile..'|'..imagesize..'px|link='..link..'|'..tooltip..']]'..span2
        else
            return span1..'[[File:'..iconFile..'|'..imagesize..'px|link='..link..']]'..span2
        end
    end
end


return p

