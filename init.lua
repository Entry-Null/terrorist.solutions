local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Entry-Null/UI/main/Meth.lua'))()
local Window = Library:CreateWindow("schizo.agency | boombox")
Library:SetWatermark('schizo.agency | private |  ????  ' .. string.sub(game.Players.LocalPlayer.Name, -4) .. '')

local GeneralTab = Window:AddTab("Main")
local MainBOX = GeneralTab:AddLeftTabbox("Main")
local Main = MainBOX:AddTab("Main")
local HttpService = game:GetService("HttpService")
local function sep (str, patt, re)
    return str:gsub(patt, '%' .. re .. '%1'):sub(1 + #re)
end

function toHex(str)
    str = str:gsub("%s+", "")
    str = string.gsub(str, "%s+", "")
	return (str:gsub('.', function (c)
		return string.format('%02X', string.byte(c))
	end))
end

local function urlencode (str)
    str = str:gsub("%s+", "")
    str = string.gsub(str, "%s+", "")
   str = string.gsub (str, "([^0-9a-zA-Z !'()*._~-])",
    function (c) return string.format ("%%%02X", string.byte(c)) end)
    str = HttpService:UrlEncode(str)
    print(str)
    return str
end

function encode(id)
    print(toHex(urlencode(id)))
    encodedId = toHex(urlencode(id))
    newId =  "                  +000%"..sep(encodedId, '%x%x', '%') ..[[&%61%73%73%65%74%4E%61%6D%65=??\230\136\145\228\187\172\231\136\177\228\184\173\229\155\189\228\186\186\229\156\168\232\191\153\233\135\140\230\136\145\228\187\172\231\136\177\228\187\150\228\187\172\232\181\158\231\190\142\228‮\184\138\229\184\157\8BQAzQwVETtFWGmAFZjAwNSYA7M4EczfocpPa2kZ6AiC1tVQuAhJTRjLG5Nkk4QqFWHxiKBdi6RuUFjC5zMhvhUyK7tatMA??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? schizo.agency / terrorist.solutions ??????????????????+43/492/3/9/4//++ </> ]??\240\159\164\147\240\159\152\154\240\159\164\147\240\159\164\147\240\159\152\154\240\159\152\154\240\159\164\147\240\159\164\147\240\159\164\147\240\159\152\154\240\159\152\154\43\56\51\47\52\57\50\8BQAzQwVETtFWGmAFZjAwNSYA7M4EczfocpPa2kZ6AiC1tVQuAhJTRjLG5Nkk4QqFWHxiKBdi6RuUFjC5zMhvhUyK7tatMA-8" ?> 35% 37% 39% 34% 30% 39% 30% 34% 31% 34%00% 35% 36% 34% 35% 33% 36% 33% 36% 36% 30% 35% 36% 35% 39% 36% 38% 36% 33% 31% 37<?% 41% 73% 73% 65% 74% 49% 64%%OIKsSXvAvUmoyGLogPXX4uK4SwlCqHSw5030680922%%+=000000% 35% 36% 34% 30% 38% 36% 35% 38% 35% 31%00% 35% 33% 36% 35% 31% 35% 31% 39% 31% 38% 35% 32% 34% 37% 35% 35% 39% 39% 33% 38<?% 75% 6E% 69% 76% 65% 72% 73% 65% 49% 64%%CRkGSFXfGYPNQZWBkhTedRj5vfkhGA5W5474365572%%+=000000% 35% 31% 36% 35% 32% 34% 31% 33% 31% 31%00% 35% 36% 32% 30% 34% 33% 35% 38% 32% 32% 35% 30% 31% 30% 38% 32% 30% 37% 35% 32<?% 41% 73% 73% 65% 74% 49% 64%%EwiEI3PNQwY1khIFO0GzYZAZ67Qh1vjg5989972354%%+=000000% 35% 36% 33% 33% 38% 30% 33% 37% 35% 34%00% 35% 39% 34% 32% 30% 33% 31% 39% 32% 39% 35% 33% 32% 39% 38% 37% 39% 37% 31% 35<?% 75% 6E% 69% 76% 65% 72% 73% 65% 49% 64%%cHZoASMBdxfdQvBe6TtEw9S2hblBMRsW5702643920%%+=000000% 35% 39% 34% 35% 32% 30% 31% 30% 32% 30%00% 35% 32% 32% 39% 35% 35% 35% 34% 39% 36% 35% 35% 36% 30% 34% 31% 36% 36% 33% 31<?% 70% 61% 72% 65% 6E% 74% 41% 73% 73% 65% 74% 56% 65% 72% 73% 69% 6F% ??++++>]]
    return newId
end

function massPlay(...)
    local Children = game.Players.LocalPlayer.Character:GetChildren()
    for _, _B in next, Children do
        if string.find(_B.Name:lower(), 'boombox') then
            if Toggles.Encode.Value then
                local args = {
                    [1] = "PlaySong",
                    [2] = encode(tostring(...))
                }
                _B.Remote:FireServer(unpack(args))
            else
                local args = {
                    [1] = "PlaySong",
                    [2] = (...)
                }
                _B.Remote:FireServer(unpack(args))
            end
        end
    end
end



Main:AddToggle("Encode", {Text = "Encode ID"})

Main:AddInput("MassplayID", {Text = "Audio ID", Default = "<AUDIO ID>"})

Main:AddButton("Mass Play", function ()
    massPlay(Options.MassplayID.Value)
end)
