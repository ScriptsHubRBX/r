local tp = loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsHubRBX/Server/refs/heads/main/bb", true))()
_G.hook = false
local function teleport()
if _G.hook then return end
_G.hook = true
while wait(1) do
	 if _G.tp == "change" then
			tp:changelogsteleport("Museum")
	 	elseif _G.tp == "jb" then
	 		tp:jbteleport("MUSEUM")
	 		else
				tp:random()
		 end
			
	end
end
local asset = "rbxassetid://77293148186745"

local function missing(t, f, fallback)
	if type(f) == t then return f end
	return fallback
end

local queueteleport = missing("function", 
	queue_on_teleport 
		or (syn and syn.queue_on_teleport) 
		or (fluxus and fluxus.queue_on_teleport)
)

local TeleportCheck = false
local Players = game:GetService("Players")
Players.LocalPlayer.OnTeleport:Connect(function(State)
	if not TeleportCheck and queueteleport then
		TeleportCheck = true
		queueteleport([[
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptsHubRBX/r/refs/heads/main/ms'))()
        ]])
	end
end)

spawn(function()
	while task.wait() do
		for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.WorldMarkersGui:GetChildren()) do
			pcall(function()
				local robname = v.ImageLabel.ImageLabel.Image
				if robname == asset and v.Visible == true then
					is = true
				elseif game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and robname == asset and v.Visible == false then
					task.wait(1)
					teleport()
				end
			end)
		end
	end
end)
spawn(function()
  while wait(1) do
      pcall(function()
          if game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed == 0 then
              teleport()
          end
      end)
  end
end)
for i = 1, 5 do
	pcall(function()
		local UserInputService = game:GetService("UserInputService")
		local VirtualInputManager = game:GetService("VirtualInputManager")
		local button = game:GetService("Players").LocalPlayer.PlayerGui.TeamSelectGui.TeamSelect.Frame.MiddleContainer.Container.Criminal
		local pos = button.AbsolutePosition
		local size = button.AbsoluteSize

		local x = pos.X + size.X / 2
		local y = pos.Y + size.Y / 2

		VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)
		task.wait()
		VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)
		task.wait(1)
	end)
end
task.wait(2)
if workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable then
	teleport()
end
local is = nil
for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.WorldMarkersGui:GetChildren()) do
	pcall(function()
		local robname = v.ImageLabel.ImageLabel.Image
		if robname == asset and v.Visible == true then
			is = true
		elseif game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and robname == asset and v.Visible == false then
			task.wait(1)
			teleport()
		end
	end)
end
if is == nil then
	teleport()
	return
end
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1080, 140, 1321)
wait(.5)
if workspace.Museum.Roof.Hole.RoofPart.Transparency == 1 then
	is = true
else
	is = false
end
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
if is == false then teleport() return end
wait(1)
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in game:GetService("Players").LocalPlayer.Character:GetChildren() do
		if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
			v.CanTouch = false
		end
	end
end)
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:AddTag('NoFallDamage')
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:AddTag('NoRagdoll')
local character = game:GetService("Players").LocalPlayer.Character


local bv = nil
local hrp = character.HumanoidRootPart
local function moveTo(targetPos, moveSpeed)
	local disct = 2
	if character.Humanoid.Sit == true then
		disct = 5
	end
	repeat
		task.wait()
		direction = (targetPos - hrp.Position).Unit
		bv.Velocity = direction * moveSpeed
	until (targetPos - hrp.Position).Magnitude <= disct
	bv.Velocity = Vector3.zero
end
bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.Velocity = Vector3.zero
bv.Parent = hrp
local vec = hrp.Position + Vector3.new(0,30,0)
moveTo(vec,35)
moveTo(Vector3.new(-1276, 50, -1446),100)
moveTo(Vector3.new(-1221, 50, -1348),100)
local vec1 = hrp.Position
moveTo(vec1-Vector3.new(0,30,0),35)
local drive = nil
local t = os.time()
repeat
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
	task.wait(1)
	for i, v in workspace.Vehicles:GetChildren() do
		if v:GetAttribute("LastDriverId") == game:GetService("Players").LocalPlayer.UserId then
			drive = v
			break
		end
	end
	if character.Humanoid.Sit == true and drive == nil or os.time() - t >= 5 then
		game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space.Value, false, nil)
		task.wait()
		game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space.Value, false, nil)
		moveTo(Vector3.new(-1221, 20, -1348),100)
		local args = {"Chassis", "Camaro"}
		game:GetService("ReplicatedStorage"):WaitForChild("GarageSpawnVehicle"):FireServer(unpack(args))
		wait(.5)
		if character.Humanoid.Sit == true then
			break
		end
	end
until character.Humanoid.Sit == true and drive ~= nil
moveTo(Vector3.new(-662, 85, -718),400)
moveTo(Vector3.new(982, 196, 1192),400)
moveTo(Vector3.new(1090, 139, 1350),400)
task.wait(.5)
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space.Value, false, nil)
task.wait()
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space.Value, false, nil)
task.wait(.2)
moveTo(Vector3.new(1080, 140, 1321),50)
if workspace.Museum.Roof.Hole.RoofPart.Transparency == 0 then
	repeat game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil) wait(2) game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil) until workspace.Museum.Roof.Hole.RoofPart.Transparency == 1
end
moveTo(Vector3.new(1083, 139, 1311),35)
if workspace.Museum:FindFirstChild("Lights") then
	workspace.Museum.Lights:Destroy()
end
moveTo(Vector3.new(1085, 126, 1313),35)
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
moveTo(Vector3.new(1133, 108, 1307),35)
for i, v in workspace.Museum.Dino:GetChildren() do
	if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == true then
		break
	end
	if v.Transparency ~= 1 then
		moveTo(Vector3.new(v.Position.X, v.Position.Y, v.Position.Z),35)
		task.wait(2)
	end
end
if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
	for i, v in workspace.Museum.CenterItems:GetDescendants() do
		if v:IsA("Part") or v:IsA("MeshPart") then
			if v.Transparency == 0 then
				moveTo(Vector3.new(v.Position.X, v.Position.Y, v.Position.Z),35)
				task.wait(2)
				break
			end
		end
	end
end
if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and workspace.Museum.Paintings.asimo3089.Frame.Transparency ~= 1 then
	moveTo(Vector3.new(workspace.Museum.Paintings.asimo3089.Frame.Position.X, workspace.Museum.Paintings.asimo3089.Frame.Position.Y, workspace.Museum.Paintings.asimo3089.Frame.Position.Z),35)
	task.wait(2)
end

if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and workspace.Museum.Paintings.badcc.Frame.Transparency ~= 1 then
	moveTo(Vector3.new(workspace.Museum.Paintings.badcc.Frame.Position.X, workspace.Museum.Paintings.badcc.Frame.Position.Y, workspace.Museum.Paintings.badcc.Frame.Position.Z),35)
	task.wait(2)
end
if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and workspace.Museum.EgyptianCase.Relic.Head.Transparency ~= 1 then
	moveTo(Vector3.new(workspace.Museum.Paintings.badcc.Frame.Position.X, workspace.Museum.Paintings.badcc.Frame.Position.Y, workspace.Museum.Paintings.badcc.Frame.Position.Z),35)
	task.wait(2)
end
if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and workspace.Museum.JewelCase.Jewel.Jewel.Transparency ~= 1 then
	moveTo(Vector3.new(workspace.Museum.Paintings.badcc.Frame.Position.X, workspace.Museum.Paintings.badcc.Frame.Position.Y, workspace.Museum.Paintings.badcc.Frame.Position.Z),35)
	task.wait(2)
end
-- if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
-- 	moveTo(Vector3.new(1143, 106, 1262),35)
-- 	task.wait(2)
-- end

-- if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
-- 	moveTo(Vector3.new(1140, 108, 1323),35)
-- 	task.wait(2)
-- end

-- if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
-- 	moveTo(Vector3.new(1171, 109, 1299),35)
-- 	task.wait(2)
-- end
-- if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
-- 	moveTo(Vector3.new(1140, 108, 1323),35)
-- 	task.wait(2)
-- end
-- if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
-- 	moveTo(Vector3.new(1089, 106, 1319),35)
-- 	task.wait(2)
-- end
-- if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
-- 	moveTo(Vector3.new(1140, 108, 1323),35)
-- 	task.wait(2)
-- end
if game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
	teleport()
	end
moveTo(Vector3.new(1133, 108, 1307),35)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
moveTo(Vector3.new(1085, 126, 1313),50)
moveTo(Vector3.new(1083, 150, 1311),50)
for i, v in workspace.Vehicles:GetChildren() do
	if v:GetAttribute("LastDriverId") == game:GetService("Players").LocalPlayer.UserId then
		local pos = v.Engine.CFrame + v.Engine.CFrame.RightVector * -5
		moveTo(pos.Position,50)
		task.wait(.2)
		game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
		task.wait()
		game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
		task.wait(1)
		break
	end
end
if character.Humanoid.Sit == false then
	repeat
		task.wait(.3)
		if character.Humanoid.Sit == false then
			local args = {"Chassis", "Camaro"}
			game:GetService("ReplicatedStorage"):WaitForChild("GarageSpawnVehicle"):FireServer(unpack(args))
		end
	until character.Humanoid.Sit == true
end
moveTo(Vector3.new(1089, 160, 1353),300)
moveTo(Vector3.new(1694, 300, -2048),400)
moveTo(Vector3.new(1689, 67, -2053),400)
task.wait(5)
moveTo(Vector3.new(1729, 73, -2046),100)
moveTo(Vector3.new(1751, 69, -2040),100)
moveTo(Vector3.new(1755, 41, -2042),100)
task.wait(1)
bv:Destroy()
task.wait(3)
teleport()
