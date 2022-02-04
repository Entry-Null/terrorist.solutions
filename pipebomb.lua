if not syn or not protectgui then
getgenv().protectgui = function()end
else
    game.Players.LocalPlayer:Kick("There was one child with down's syndrome, there is now none")
end
local http = game:GetService('HttpService')
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Entry-Null/UI/main/Meth.lua'))()
local ESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/Entry-Null/ESP/main/Terrorism.lua'))()
Library.AccentColor = Color3.fromRGB(222, 37, 0)
Library.OutlineColor = Color3.fromRGB(10, 10, 10)
Library.MainColor = Color3.fromRGB(18, 18, 18)
Library.FontColor = Color3.fromRGB(217, 210, 210)
local CurrentCamera = workspace.CurrentCamera
function Chance(percent)
    assert(percent >= 0 and percent <= 100) 
    return percent >= math.random(1, 100) 
end
local config = {}

if isfolder("terrorist Config") then
    local configC = http:JSONDecode(readfile("terrorist Config/config.ts"))

    config = {
        SilentAimFOVRad = configC["SilentAimFOVRad"] or 180,
        Streamer = configC['Streamer'] or false,
        SilentAimEnabled = configC['SilentAimEnabled'] or false,
        SilentAimFOVVis = configC['SilentAimFOVVis'] or false,
        SilentAimFOVEnabled = configC['SilentAimFOVEnabled'] or false,
        SilentAimMethod = configC['SilentAimMethod'] or 4,
        message = configC['message'] or "There are several explosives lining the walls of the interior of my home!",
        messageduration = configC['messageduration'] or 20,
        Aimhitpart = configC['Aimhitpart'] or 1,
        debugTracers = configC['debugTracers'] or false,
        debugTracersFade = configC['debugTracersFade'] or "2",
        triggerBot = configC['triggerBot'] or false,
        VisualsEnabled = configC['VisualsEnabled'] or true,
        espEnabled = configC['espEnabled'] or true,
        espBoxes = configC['espBoxes'] or true,
        espShowTeam = configC['espShowTeam'] or true,
        espShowTeamHue = configC['espShowTeamHue'] or true,
        headShotChance = configC['headShotChance'] or 43,
        TriggerBotMSDelay = configC['TriggerBotMSDelay'] or 30,
        Footsteps = configC['Footsteps'] or false,
        FootstepsVol = configC['FootstepsVol'] or 2
                }
    if configC['Streamer'] ~= true then
        Library:Notify(config['message'] or "There are several explosives lining the walls of the interior of my home!", config['messageduration'] or 20)
    end
    writefile("terrorist Config/config.ts", http:JSONEncode(config))
else
    config = {
        SilentAimFOVRad = 180,
        Streamer = false,
        SilentAimEnabled = false,
        SilentAimFOVVis = false,
        SilentAimFOVEnabled = false,
        SilentAimMethod = 4,
        message = "There are several explosives lining the walls of the interior of my home!",
        messageduration = 20,
        Aimhitpart = 1,
        debugTracers = false,
        debugTracersFade = "2",
        triggerBot = false,
        VisualsEnabled = true,
        espEnabled =  true,
        espBoxes = true,
        espShowTeam = true,
        espShowTeamHue = true,
        headShotChance = 43,
        TriggerBotMSDelay = 30,
        Footsteps = false,
        FootstepsVol = 1
    }

    makefolder("terrorist Config")
    writefile("terrorist Config/config.ts", http:JSONEncode(config))

    Library:Notify("New config detected (workspace/terrorist Config/config.ts).", 20)
end
    


_G.Raping = true
local int = coroutine.resume
local cre = coroutine.create
local coreFunctions = {
    ["Sex"] = function(them)
        you = game.Players.LocalPlayer.Name
        Library:Notify("".. you .." is being fucked by ".. them .."!", 20)
        you = game.Players[you].Character or game.Players.LocalPlayer.Character
        them = game.Players[them].Character
        themH = them.Humanoid
        themP = themH.RootPart.CFrame
        youH = you.Humanoid
        youH.Sit = true
        while _G.Raping do
            wait()
            you.HumanoidRootPart.CFrame = them.HumanoidRootPart.CFrame * CFrame.fromEulerAnglesYXZ (math.rad(-90), math.rad(360), math.rad(0))  + them.HumanoidRootPart.CFrame.LookVector * math.random(1,3) - them.HumanoidRootPart.CFrame.UpVector
        end
    end
}

local rs = game:GetService("RunService").RenderStepped
function createBeam(p1, p2)
    local beam = Instance.new("Part", workspace)
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = Enum.Material.ForceField
    beam.Color = Color3.fromRGB(255, 120, 0)
    beam.Size = Vector3.new(0.1, 0.1, (p1 - p2).magnitude)
    beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -beam.Size.Z / 2)
    return beam
end

--int(coreFunctions["Sex"], "you", "another nigga")
local Functions =  {

Default = function(n)
    local v = 3
    for i = 2, n do
        v = v * i
    end
    return v
end,

FakeduckResolve = function(n, k)
    
    local fac = Default
    
    return fac(n) / fac(n - k)
end,

GetDistanceSq3 = function(v1, v2)
	local a = v2.x - v1.x
	local b = v2.y - v1.y
	local c = v2.z - v1.z
    return a*a + b*b + c*c
end

}

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GetChildren = game.GetChildren
local WorldToScreen = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild

local function getPositionOnScreen(Vector)
local Vec3, OnScreen = WorldToScreen(Camera, Vector)
return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
local Matches = 0
if #Args < RayMethod.ArgCountRequired then
    return false
end
for Pos, Argument in next, Args do
    if typeof(Argument) == RayMethod.Args[Pos] then
        Matches = Matches + 1
    end
end
    return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end

local function getMousePosition()
    return Vector2.new(Mouse.X, Mouse.Y)
end

function CalculateThreat3D(Character)
    local distance = tonumber(Options.DistanceThreat.Value)
    local magnitude = Functions.GetDistanceSq3(game.Players.LocalPlayer.Character.Head.Position, Character.Head.Position)
    return distance > magnitude
end

function isThreat(p)
    local ignorelist = {game.Players.LocalPlayer.Character, p.Character}
    local parts = CurrentCamera:GetPartsObscuringTarget({p.Character.Head.CFrame:ToObjectSpace()}, ignorelist)
    if #parts < 2 then
        return true
    else
        return false
    end
end

function isPartVisible(Part, PartDescendant)
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded)
    local Origin = CurrentCamera.CFrame.p
    local _, OnScreen = CurrentCamera.WorldToViewportPoint(CurrentCamera, Part.Position)
    if OnScreen then
        local newRay = Ray.new(Origin, Part.Position - Origin)
        local PartHit, _ = Workspace.FindPartOnRayWithIgnoreList(Workspace, newRay, {Character, CurrentCamera})
        local Visible = (not PartHit or PartHit.IsDescendantOf(PartHit, PartDescendant))
        return Visible
    end
    return false
end

local function getClosestPlayer()
    if not Options.TargetPart.Value then
        return
    end
    local Closest
    local DistanceToMouse
    for _, Player in next, GetChildren(Players) do
        if Player == LocalPlayer then
            continue 
        end
        if Toggles.TeamCheck.Value and Player.Team == LocalPlayer.Team then
            continue
        end
        if Toggles.friendCheck.Value and player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
            continue
        end
        local Character = Player.Character
        
        if Toggles.VisCheck.Value and not isPartVisible(Character[Options.TargetPart.Value], Character) then
            continue
        end

        if Toggles.CalculateThreat.Value and CalculateThreat3D(Character) --[[and not isThreat(Player)]] then
            continue
        end

        if not Character then
            continue
        end

        local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
        local Humanoid = FindFirstChild(Character, "Humanoid")

        if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then
            continue
        end
        local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)

        if Toggles.invisibleCheck.Value and Character["Head"].Transparency > 0.6 then 
            continue
        end
        if not OnScreen then
            continue
        end

        local Distance = (getMousePosition() - ScreenPosition).Magnitude
        if Distance <= (DistanceToMouse or (Toggles.fov_Enabled.Value and Options.Radius.Value) or 2000) then
            if Toggles.Alternation.Value and Chance(Options.HeadhitChance.Value) then
                Closest = Character["Head"]
            else
                Closest = Character[Options.TargetPart.Value]
            end
            DistanceToMouse = Distance
        end
    end
    return Closest
end


local Window = Library:CreateWindow("terrorist.solutions")

local GeneralTab = Window:AddTab("Aimbot")
local MainBOX = GeneralTab:AddLeftTabbox("Main")
local MainBOX2 = GeneralTab:AddRightTabbox("Main")
local MainBOX5 = GeneralTab:AddRightTabbox("Main")

local VisualTab = Window:AddTab("Visuals")
local VisualBOX = VisualTab:AddLeftTabbox("Main")
local VisualBOX2 = VisualTab:AddRightTabbox("Menu Config")
local VisualEsp = VisualBOX:AddTab("Main")
local MenuVisual = VisualBOX2:AddTab("Menu Config")

local AATab = Window:AddTab("Anti Aim")
local AABOX = AATab:AddLeftTabbox("Advanced Config")
local ADABOX = AATab:AddRightTabbox("Advanced Config")

local SexTab = Window:AddTab("Sex")

local SEXBOX = SexTab:AddLeftTabbox("Sex Main")
local Sex = SEXBOX:AddTab("Sex Main")
local DebugTab  = Window:AddTab("Debug")
local DEBUGBOX = DebugTab:AddLeftTabbox("Debug")
local Debug = DEBUGBOX:AddTab("Debug")

local SoundTab  = Window:AddTab("Sound")
local SOUNDBOX = SoundTab:AddLeftTabbox("Sound")
local Sound = SOUNDBOX:AddTab("Sound Adjustment")

local Boombox  = Window:AddTab("Boombox")
local BoomboxBOX = Boombox:AddLeftTabbox("Boombox")
local BoomboxBOXVisuals = Boombox:AddRightTabbox("Visual")

local BoomboxHV = BoomboxBOXVisuals:AddTab("Visuals")

local BoomboxH = BoomboxBOX:AddTab("Boombox")

local LocalPlayer = game.Players.LocalPlayer
local SoundFE = game.SoundService.RespectFilteringEnabled
local Radios = {}
local BackPack = LocalPlayer.Backpack
local Players = game:GetService("Players");

local function GetPlayer(Input)
    for _, Player in ipairs(Players:GetPlayers()) do
        if (string.lower(Input) == string.sub(string.lower(Player.Name), 1, #Input)) then
            return Player;
        end
    end
end

function massPlay(...)
    local BackPack = LocalPlayer.Backpack
    local Tools = BackPack:GetChildren()
    for _, _B in next, Tools do
    	if string.find(_B.Name:lower(), 'boombox') then
    		table.insert(Radios, _B)
    		_B['Parent'] = LocalPlayer.Character
            local args = {
                [1] = "PlaySong",
                [2] = (...)
            }
            _B.Remote:FireServer(unpack(args))
    	end
    end
end
-- massPlay(<id>)

function demesh()
    for _, tool in  pairs(Radios) do
        if string.find(tool.Name:lower(), 'boombox') and tool:IsA("Tool") then
            tool.Handle.Mesh:Destroy()
        end
    end
end

--demesh(<void>)

function mute(plr)
    local playerToMute = GetPlayer(plr)
   for _, tool in pairs(playerToMute.Character:GetDescendants()) do
       if tool:IsA("Sound") then
           tool.Playing = false
       end
   end
    Library:Notify("Muted "..playerToMute.Name)
end

-- mute(<string>)


local Create = function(Class,Properties)
	Properties = Properties or {};
	local Obj = Instance.new(Class)
	for K,V in next, Properties do 
		if rawequal(K,'Parent') then
			continue;
		end
		Obj[K] = V;
	end
	if Properties['Parent'] then
		Obj['Parent'] = Properties['Parent']
	end
	return Obj
end

local fullCircle = math.sin(2 * math.pi)

local function getXAndZPositions(angle)
	local x = math.cos(angle) * Options.BoomBoxRadius.Value
	local z = math.sin(angle) * Options.BoomBoxRadius.Value
	return x, z
end

--sync ( <SyncTime> )

BoomboxH:AddInput("MassplayID", {Text = "Mass play ID", Default = "<AUDIO ID>"})

BoomboxH:AddButton("Massplay", function()
        LocalPlayer.Character.Humanoid:UnequipTools()
    massPlay(Options.MassplayID.Value)
    Library:Notify("Massplaying ".. Options.MassplayID.Value)
end)

BoomboxH:AddInput("PlayerMuteName", {Text = "PLR To Mute", Default = "<Shortend Name>"})

BoomboxH:AddButton("Mute Plr", function()
    mute(Options.PlayerMuteName.Value)
end)

BoomboxH:AddInput("SyncTime", {Text = "Sync Radios", Default = "<number>"})

BoomboxH:AddButton("Sync", function()
    for _, sound in  pairs(LocalPlayer.Character:GetDescendants()) do
        if sound:IsA("Sound") then
            sound.TimePosition = tonumber(Options.SyncTime.Value)
        end
    end
    Library:Notify("Sync set to  ".. Options.SyncTime.Value)
end)

BoomboxHV:AddButton("Visualise", function()
    game["Run Service"].RenderStepped:connect(
        function()
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0
        end
     )
     
     local LocalPlayer = game:GetService("Players").LocalPlayer
     LocalPlayer.SimulationRadiusChanged:Connect(function(radius)
        radius = 9e9
        return radius
     end)
    for i, v in pairs(Radios) do
        pos =  Create('BodyPosition',{
            Parent = v.Handle;
            MaxForce = Vector3.new(1/0,1/0,1/0);
            Position =  LocalPlayer.Character.HumanoidRootPart.Position;
            P = 1.0e5;
        })
        pos =  Create('BodyGyro',{
            Parent = v.Handle;
            MaxTorque = Vector3.new(Options.rotX.Value * 2, Options.rotY.Value * 2, Options.rotZ.Value * 2);
            D =  0;
            CFrame = CFrame.new(Options.rotX.Value* 2, Options.rotY.Value* 2, Options.rotZ.Value* 2);
            P = 1.0e5;
        })
        for k, c in pairs(LocalPlayer.Character:GetDescendants()) do
            if c['Name'] == 'RightGrip' then c:Destroy() end
        end
    end
    game:GetService("RunService").Heartbeat:Connect(function()
        for i, v in pairs(Radios) do
            LocalPlayer.Character:WaitForChild("HumanoidRootPart")
            local angle = i * (fullCircle * Options.SidesBoom.Value / #Radios)
            local x, z = getXAndZPositions(angle)
            
            local position = (LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(x, Options.pitchYBoom.Value, z)).p
            local lookAt = LocalPlayer.Character.HumanoidRootPart.Position
            local finalposition = CFrame.new(position, lookAt).p

            v:FindFirstChild("Handle").BodyPosition.Position = finalposition
        end
    end)
end)

BoomboxHV:AddSlider("BoomBoxRadius", {Text = "Visualise Radius", Min = 0, Max = 10, Default =  1, Rounding = 0})

BoomboxHV:AddSlider("pitchYBoom", {Text = "Visualise Rise Y", Min = -15, Max = 15, Default =  1, Rounding = 0})

BoomboxHV:AddSlider("SidesBoom", {Text = "Visualise precision", Min = -50, Max = 50, Default =  1, Rounding = 0})

BoomboxHV:AddSlider("rotX", {Text = "Visualise rot X", Min = -500, Max = 500, Default =  1, Rounding = 0})
BoomboxHV:AddSlider("rotY", {Text = "Visualise rot Y", Min = -500, Max = 500, Default =  1, Rounding = 0})
BoomboxHV:AddSlider("rotZ", {Text = "Visualise rot Z", Min = -500, Max = 500, Default =  1, Rounding = 0})


BoomboxHV:AddButton("Demesh", function()
    demesh()
    Library:Notify("Demeshed")
end)

Sound:AddToggle("Footsteps", {Text = "Toggle Footstep Volume", Default = config['Footsteps'] or false})
Sound:AddSlider("FootstepsVolume", {Text = "Step Volume", Min = 0, Max = 10, Default = config['FootstepsVol'] or 1, Rounding = 0})


Debug:AddToggle("debugTracers", {Text = "Toggle Debug Tracers", Default = config['debugTracers'] or false})
Debug:AddToggle("CalculateThreat", {Text = "Toggle Threat Calculation", Default = false})
Debug:AddInput("DistanceThreat", {Text = "Distance Threat TH", Default = "1000"})

Debug:AddInput("debugTracersFade", {Text = "Debug Tracers Fade", Default = config['debugTracersFade'] or "2"})

local CreditTab = Window:AddTab("Credits")
local CreditTabBox = CreditTab:AddLeftTabbox("Credits")
local Credits = CreditTabBox:AddTab("Credits")

Credits:AddLabel("plotting#2399")
Credits:AddLabel("sex: fed")
Credits:AddLabel("john: leech")
Credits:AddButton("Join Discord", function()
    local http = game:GetService('HttpService') 	
    local req = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
    if req then
        req({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                Origin = 'https://discord.com'
            },
            Body = http:JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = http:GenerateGUID(false),
                args = {code = 'DWwzTjgYA7'}
            })
        })
    end 
end)
Sex:AddToggle("ToggledSex", {Text = "Toggle"}):OnChanged(function()
    _G.Raping = not _G.Raping
 end)
Sex:AddInput("ThemName", {Text = "Name", Default = "Person"})

Sex:AddButton("Troll", function() 
    coreFunctions["Sex"](Options.ThemName.Value)
end)

do
local AntiAim = AABOX:AddTab("Anti Aim")
local ADAntiAim = ADABOX:AddTab("Advanced Config")

--Visuals
--[[
    Enabled = false,
    Boxes = true,
    BoxShift = CFrame.new(0,-1.5,0),
    BoxSize = Vector3.new(4,6,0),
    Color = Color3.fromRGB(222, 33, 52),
    FaceCamera = false,
    Names = true,
    TeamColor = true,
    Thickness = 2,
    AttachShift = 1,
    TeamMates = true,
]]
ESP.Color = Color3.fromRGB(222, 33, 52); -- Red

VisualEsp:AddToggle("VisualEnabled", {Text = "Enabled", Default = config['VisualsEnabled'] or false}):AddColorPicker("VisualColor", {Default = Color3.fromRGB(222, 33, 52)}):OnChanged(function()
    ESP.Enabled = Toggles.VisualEnabled.Value
    while Options.VisualEnabled do
        ESP.Color = Options.VisualColor.Value
        task.wait()
    end
 end)

ESP:Toggle(true)

 VisualEsp:AddToggle("ESPToggle", {Text = "Draw ESP", Default = config['espEnabled'] or false}):OnChanged(function()
    ESP:Toggle(ESPToggle)
 end)


VisualEsp:AddToggle("Boxes", {Text = "Boxes", Default = config['espBoxes'] or false}):OnChanged(function()
    ESP.Boxes = Toggles.Boxes.Value 
 end)

VisualEsp:AddSlider("Thickness", {Text = "Thickness", Min = 0, Max = 10, Default = 1, Rounding = 1}):OnChanged(function()
    ESP.Thickness = Options.Thickness.Value
end)

 VisualEsp:AddToggle("Names", {Text = "Show Names"}):OnChanged(function()
    ESP.Names = Toggles.Names.Value 
 end)

 VisualEsp:AddToggle("FaceCamera", {Text = "Face Camera"}):OnChanged(function()
    ESP.FaceCamera = Toggles.FaceCamera.Value 
 end)

 VisualEsp:AddToggle("ShowTeam", {Text = "Show Team", Default = config['espShowTeam'] or false}):OnChanged(function()
    ESP.TeamMates = Toggles.ShowTeam.Value 
 end)

 VisualEsp:AddToggle("TeamHue", {Text = "Team Color", Default = config['espShowTeamHue'] or false}):OnChanged(function()
    ESP.TeamColor = Toggles.TeamHue.Value 
 end)

--End visuals[[
--]]




AntiAim:AddToggle("aaing", {Text = "Enabled"})

AntiAim:AddToggle("hitbox", {Text = "Small Hitbox"})

AntiAim:AddSlider("angle", {Text = "Down Pitch Perpendicular", Min = 0, Max = -15 , Default = 0, Rounding = 0})
AntiAim:AddSlider("angle2", {Text = "Up Pitch Perpendicular", Min = -15, Max = 15, Default = 0, Rounding = 0})
ADAntiAim:AddToggle("Inverse", {Text = "Inverse (Tanget Fallacy)"})
ADAntiAim:AddInput("reciprocal", {Text = "Inverse Reciprocal Resolver", Default = "0"})
ADAntiAim:AddToggle("FalseDuck", {Text = "False Duck"})

local Main = MainBOX:AddTab("Main")

local MainChecks = MainBOX2:AddTab("Checks")
local MainOffsets = MainBOX5:AddTab("Offsets")


MainOffsets:AddSlider("offsetX", {Text = "Offset X", Min = -15, Max = 15 , Default = 0, Rounding = 1})
MainOffsets:AddSlider("offsetY", {Text = "Offset Y", Min = -15, Max = 15, Default = 0, Rounding = 1})
MainOffsets:AddSlider("offsetZ", {Text = "Offset Z", Min = -15, Max = 15, Default = 0, Rounding = 1})


Main:AddToggle("aim_Enabled", {Text = "Enabled", config['SilentAimEnabled'] or false})
MainChecks:AddToggle("VisCheck", {Text = "Visible Check"})
MainChecks:AddToggle("TeamCheck", {Text = "Team Check"})
MainChecks:AddToggle("friendCheck", {Text = "Friend Check"})

MainChecks:AddToggle("invisibleCheck", {Text = "Invisible Player Check"})

Main:AddDropdown("TargetPart", {Text = "Priority Part", Default = config['Aimhitpart'] or 1, Values = {
"HumanoidRootPart", "Head"
}})

Main:AddToggle("Alternation", {Text = "Headshot Alternation"})
Main:AddSlider("HeadhitChance", {Text = "Headshot Chance", Min = 0, Max = 100, Default = config['headShotChance'] or 30, Rounding = 0})

Main:AddDropdown("Method", {Text = "Silent Aim Method", Default = config['SilentAimMethod'] or  4, Values = {
"Raycast","FindPartOnRay",
"FindPartOnRayWithWhitelist",
"FindPartOnRayWithIgnoreList",
"Mouse.Hit/Target"
}})
end
local FieldOfViewBOX = GeneralTab:AddLeftTabbox("Field Of View")
do
local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 100
fov_circle.Radius = 180
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.ZIndex = 999
fov_circle.Transparency = 1
fov_circle.Color = Color3.fromRGB(54, 57, 241)

local Main = FieldOfViewBOX:AddTab("Field Of View")
Main:AddToggle("fov_Enabled", {Text = "Enabled", Default = config['SilentAimFOVEnabled'] or false})
Main:AddSlider("Radius", {Text = "Radius", Min = 0, Max = 360, Default = config["SilentAimFOVRad"] or 180, Rounding = 0}):OnChanged(function()
fov_circle.Radius = Options.Radius.Value
end)

local TriggerHolder = FieldOfViewBOX:AddTab("Trigger Bot")
TriggerHolder:AddToggle("TriggerFOV", {Text = "Toggle Trigger Bot", Default = config['triggerBot'] or false})
TriggerHolder:AddSlider("TriggerMSDelay", {Text = "Delay in MS", Min = 0, Max = 2000, Default = config['TriggerBotMSDelay'] or 30, Rounding = 0})

Main:AddToggle("Filled", {Text = "Filled"}):OnChanged(function()
fov_circle.Filled = Toggles.Filled.Value
end)

Main:AddSlider("Transparency", {Text = "Transparency", Min = 0, Max = 1, Default = 0.4, Rounding = 2}):OnChanged(function()
    fov_circle.Transparency = Options.Transparency.Value
end)

Main:AddToggle("Visible", {Text = "Visible", Default = config['SilentAimFOVVis'] or false}):AddColorPicker("Color", {Default = Color3.fromRGB(54, 57, 241)}):OnChanged(function()
fov_circle.Visible = Toggles.Visible.Value
while Toggles.Visible.Value do
    fov_circle.Visible = Toggles.Visible.Value
    fov_circle.Color = Options.Color.Value
    fov_circle.Position = getMousePosition() + Vector2.new(0, 36)
    task.wait()
end
end)
end


local ExpectedArguments = {
    FindPartOnRayWithIgnoreList = {
        ArgCountRequired = 3,
        Args = {
            "Instance",
            "Ray",
            "table",
            "boolean",
            "boolean"
        }
    },
    FindPartOnRayWithWhitelist = {
        ArgCountRequired = 3,
        Args = {
            "Instance",
            "Ray",
            "table",
            "boolean"
        }
    },
    FindPartOnRay = {
        ArgCountRequired = 2,
        Args = {
            "Instance",
            "Ray",
            "Instance",
            "boolean",
            "boolean"
        }
    },
    Raycast = {
        ArgCountRequired = 3,
        Args = {
            "Instance",
            "Vector3",
            "Vector3",
            "RaycastParams"
        }
    }
}



local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(...)
local Method = getnamecallmethod()
local Arguments = {...}
local self = Arguments[1]

if Toggles.aim_Enabled.Value and self == workspace then
if Method == "FindPartOnRayWithIgnoreList" and Options.Method.Value == Method then
    if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
        local A_Ray = Arguments[2]

        local HitPart = getClosestPlayer()
        if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position + Vector3.new(Options.offsetX.Value,Options.offsetY.Value, Options.offsetZ.Value))
            Arguments[2] = Ray.new(Origin, Direction)
            lasthittick = tick()
            spawn(function()
                if Toggles.debugTracers.Value then
                    local beam = createBeam(Origin, HitPart.Position + Vector3.new(Options.offsetX.Value,Options.offsetY.Value, Options.offsetZ.Value))
                    for i = 1, 60 * tonumber(Options.debugTracersFade.Value) do
                        rs:Wait()
                        beam.Transparency = i / (60 * 3)
                    end
                    beam:Destroy()
                end
            end)
            return oldNamecall(unpack(Arguments))
        end
    end
elseif Method == "FindPartOnRayWithWhitelist" and Options.Method.Value == Method then
    if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithWhitelist) then
        local A_Ray = Arguments[2]

        local HitPart = getClosestPlayer()
        if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position + Vector3.new(math.random(-.2, .3) + Options.offsetX.Value,math.random(-.2, .2) + Options.offsetY.Value, Options.offsetZ.Value))
            Arguments[2] = Ray.new(Origin, Direction)
            lasthittick = tick()
            spawn(function()
                if Toggles.debugTracers.Value then
                    local beam = createBeam(Origin, HitPart.Position + Vector3.new(math.random(-.2, .3) + Options.offsetX.Value,math.random(-.2, .2) + Options.offsetY.Value, Options.offsetZ.Value))
                    for i = 1, 60 * tonumber(Options.debugTracersFade.Value) do
                        rs:Wait()
                        beam.Transparency = i / (60 * 3)
                    end
                    beam:Destroy()
                end
            end)
            return oldNamecall(unpack(Arguments))
        end
    end
elseif (Method == "FindPartOnRay" or Method == "findPartOnRay") and Options.Method.Value:lower() == Method:lower() then
    if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRay) then
        local A_Ray = Arguments[2]

        local HitPart = getClosestPlayer()
        if HitPart then
            local Origin = A_Ray.Origin
            local Direction = getDirection(Origin, HitPart.Position + Vector3.new(math.random(-.2, .3) + Options.offsetX.Value,math.random(-.2, .2) + Options.offsetY.Value, Options.offsetZ.Value))
            Arguments[2] = Ray.new(Origin, Direction)
            lasthittick = tick()
            spawn(function()
                if Toggles.debugTracers.Value then
                    local beam = createBeam(Origin, HitPart.Position + Vector3.new(math.random(-.2, .3) + Options.offsetX.Value,math.random(-.2, .2) + Options.offsetY.Value, Options.offsetZ.Value))
                    for i = 1, 60 * tonumber(Options.debugTracersFade.Value) do
                        rs:Wait()
                        beam.Transparency = i / (60 * 3)
                    end
                    beam:Destroy()
                end
            end)
            return oldNamecall(unpack(Arguments))
        end
    end
elseif Method == "Raycast" and Options.Method.Value == Method then
    if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
        local A_Origin = Arguments[2]

        local HitPart = getClosestPlayer()
        if HitPart then
            Arguments[3] = getDirection(A_Origin, HitPart.Position + Vector3.new(math.random(-.2, .3) + Options.offsetX.Value,math.random(-.2, .2) + Options.offsetY.Value, Options.offsetZ.Value))
            lasthittick = tick()
            spawn(function()
                if Toggles.debugTracers.Value then
                    local beam = createBeam(A_Origin, HitPart.Position + Vector3.new(math.random(-.2, .3) + Options.offsetX.Value,math.random(-.2, .2) + Options.offsetY.Value, Options.offsetZ.Value))
                    for i = 1, 60 * tonumber(Options.debugTracersFade.Value) do
                        rs:Wait()
                        beam.Transparency = i / (60 * 3)
                    end
                    beam:Destroy()
                end
            end)
            return oldNamecall(unpack(Arguments))
        end
    end
end
end
return oldNamecall(...)
end)


local oldIndex = nil 
oldIndex = hookmetamethod(game, "__index", function(self, Index)
if self == Mouse and (Index == "Hit" or Index == "Target") then 
if Toggles.aim_Enabled.Value == true and Options.Method.Value == "Mouse.Hit/Target" and getClosestPlayer() then
    local HitPart = getClosestPlayer()

    return ((Index == "Hit" and HitPart.CFrame) or (Index == "Target" and HitPart))
end
end

return oldIndex(self, Index)
end)

local Players = game:GetService("Players")

local function onCharacterAdded(character)
if Toggles.hitbox.Value then
    if game.Players.LocalPlayer.Character:FindFirstChild("FakeHead") then
    game.Players.LocalPlayer.Character["FakeHead"]:Destroy()
    end
    for i, v in pairs(game.Players.LocalPlayer.Character) do
        if v:IsA("Accessory") then
            v:Destroy()
        end
    end
end
end

local function onPlayerAdded(player)
player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)
while Toggles.aaing.Value do
    if Toggles.FalseDuck.Value == false then
        local args = {
            [1] = Options.angle.Value * (math.deg(0.2, 0.6))
        }

        game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer(unpack(args))
        wait()
    else
        local args = {
            [1] = math.huge,
        }

        game:GetService("ReplicatedStorage").Events.ControlTurn:FireServer(unpack(args))
        wait()
    end
    wait()
end
wait()
wait()

deb = false

game:GetService("RunService").Stepped:Connect(function()
    if Toggles.TriggerFOV.Value and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
        local PossibleClosest = getClosestPlayer()
        if PossibleClosest ~= nil then
            if isPartVisible(PossibleClosest, PossibleClosest.Parent) then
                if deb then 
                    return 
                end
                deb = true
                wait(Options.TriggerMSDelay.Value/1000)
                mouse1click()
                deb = false
            end
        end
    elseif Toggles.Footsteps.Value then
        for i, v in pairs(game.Players:GetChildren()) do
            local Character = v.Character
            local RootPart = Character.HumanoidRootPart
            local Steps = RootPart:WaitForChild("Running", 10)

            Steps.Volume = Options.FootstepsVolume.Value
        end
    end
end)
