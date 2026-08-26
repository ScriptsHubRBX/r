local tp = loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsHubRBX/Server/refs/heads/main/bb", true))()
_G.hook = false
local function teleport()
if _G.hook then return end
_G.hook = true
	if _G.tp == "change" then
		tp:changelogsteleport("Casino")
	elseif _G.tp == "jb" then
		tp:jbteleport("CROWN_JEWEL")
		else
        tp:random()
	end
end

local asset = "rbxassetid://90511395098994"

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
            loadstring(game:HttpGet('https://pastefy.app/QOdyXxEP/raw'))()
        ]])
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
spawn(function()
	while task.wait() do
		for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.WorldMarkersGui:GetChildren()) do
			pcall(function()
				local robname = v.ImageLabel.ImageLabel.Image
				if robname == asset and v.Visible == true then
					is = true
				elseif not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PowerPlantRobberyGui") and robname == asset and v.Visible == false then
					task.wait(1)
					teleport()
				end
			end)
		end
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
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in game:GetService("Players").LocalPlayer.Character:GetChildren() do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end)
infJump = game:GetService("UserInputService").JumpRequest:Connect(function()
	if not infJumpDebounce then
		infJumpDebounce = true
		game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
		task.wait()
		infJumpDebounce = false
	end
end)
local bv = nil
local hrp = character.HumanoidRootPart
local function moveTo(targetPos, moveSpeed)
	local disct = .7
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
moveTo(Vector3.new(-1129, 53, -1396),400)
moveTo(Vector3.new(-826, 274, -2070),400)
moveTo(Vector3.new(1048, 172, -3623),400)
moveTo(Vector3.new(1120, 158, -3673),400)
task.wait(.5)
if workspace.Casino:FindFirstChild("Elevator") then
	workspace.Casino.Elevator:Destroy()
end
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space.Value, false, nil)
task.wait()
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space.Value, false, nil)
task.wait(.2)
moveTo(Vector3.new(1120, 158, -3673),70)
moveTo(Vector3.new(1172, 160, -3650),70)
moveTo(Vector3.new(1182, 160, -3660),70)
moveTo(Vector3.new(1178, 77, -3654),70)
if workspace.Casino:GetAttribute("CasinoRobberyActive") == false then
	moveTo(Vector3.new(1167, 76, -3644),100)
	moveTo(Vector3.new(1006, 76, -3668),100)
	repeat task.wait()
		for i, v in workspace.Casino.Computers:GetChildren() do
			local pos = v.Display.CFrame + v.Display.CFrame.LookVector * 4
			moveTo(pos.Position,100)
			game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
			task.wait()
			game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
			local is = false
			for i, v in workspace.Casino.Computers:GetChildren() do
				if v:GetAttribute("ShowDisableSecurityPrompt") == true then
					local pos = v.Display.CFrame + v.Display.CFrame.LookVector * 4
					moveTo(pos.Position,100)
					game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
					task.wait(1)
					game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
					is = true
					break
				end
			end
			if is then break end
		end
	until workspace.Casino:GetAttribute("CasinoRobberyActive") == true
	moveTo(Vector3.new(1006, 76, -3668),100)
	moveTo(Vector3.new(1167, 76, -3644),100)
	moveTo(Vector3.new(1178, 77, -3654),100)
end
moveTo(Vector3.new(1179, -73, -3656),70)
moveTo(Vector3.new(1170, -73, -3646),70)
moveTo(Vector3.new(1172, -73, -3608),70)
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
task.wait(1)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
moveTo(Vector3.new(1173, -72, -3607),15)
moveTo(Vector3.new(1183, -73, -3597),15)
moveTo(Vector3.new(1140, -73, -3553),15)
moveTo(Vector3.new(1108, -73, -3581),70)
moveTo(Vector3.new(1062, -73, -3533),70)
moveTo(Vector3.new(1043, -73, -3474),70)
moveTo(Vector3.new(1055, -73, -3420),70)
moveTo(Vector3.new(1079, -72, -3377),70)
if workspace.Casino.HackableVaults.VaultDoorMain:GetAttribute("DoorOpen") == false then
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
	repeat task.wait() until workspace.Casino.HackableVaults.VaultDoorMain.InnerModel.Model.UnlockedLED.BrickColor == BrickColor.new("Sand violet metallic")
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
	repeat task.wait() until workspace.Casino.HackableVaults.VaultDoorMain.InnerModel.Model.UnlockedLED.BrickColor == BrickColor.new("Really red")
	repeat task.wait() until workspace.Casino.HackableVaults.VaultDoorMain.InnerModel.Model.UnlockedLED.BrickColor == BrickColor.new("Sand violet metallic")
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
	repeat task.wait() until workspace.Casino.HackableVaults.VaultDoorMain.InnerModel.Model.UnlockedLED.BrickColor == BrickColor.new("Really red")
	repeat task.wait() until workspace.Casino.HackableVaults.VaultDoorMain.InnerModel.Model.UnlockedLED.BrickColor == BrickColor.new("Sand violet metallic")
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
end
moveTo(Vector3.new(1118, -70, -3311),70)
local is = false
local start = tick()
repeat
	for i, v in workspace.Casino.Loots:GetChildren() do
		if (hrp.Position - v.Position).magnitude <= 40 then
			moveTo(v.Position,100)
			game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
			task.wait(1)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)
			is = true
			break
		end
	end
	task.wait()
until game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == true or tick() - start >= 5
if tick() - start >= 5 then
	is = false
end
if is == false then
	bv:Destroy()
	teleport()
end
repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == true
if not bv then
	bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bv.Velocity = Vector3.zero
	bv.Parent = hrp
end
moveTo(hrp.Position + Vector3.new(0,10,0),70)
moveTo(Vector3.new(1087, -73, -3364),70)
moveTo(Vector3.new(1079, -72, -3377),70)
moveTo(Vector3.new(1055, -73, -3420),70)
moveTo(Vector3.new(1043, -73, -3474),70)
moveTo(Vector3.new(1062, -73, -3533),70)
moveTo(Vector3.new(1108, -73, -3581),70)
moveTo(Vector3.new(1140, -73, -3553),70)
moveTo(Vector3.new(1183, -73, -3597),70)
moveTo(Vector3.new(1173, -72, -3607),70)
moveTo(Vector3.new(1172, -73, -3608),70)
moveTo(Vector3.new(1170, -73, -3646),70)
moveTo(Vector3.new(1179, -73, -3656),70)
moveTo(Vector3.new(1182, 160, -3660),70)
moveTo(Vector3.new(1172, 160, -3650),70)

for i, v in workspace.Vehicles:GetChildren() do
	if v:GetAttribute("LastDriverId") == game:GetService("Players").LocalPlayer.UserId then
		local pos = v.Engine.CFrame + v.Engine.CFrame.RightVector * -5
		moveTo(pos.Position,100)
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
moveTo(Vector3.new(1049, 182, -3599),400)
moveTo(Vector3.new(1392, 297, -2805),400)
moveTo(Vector3.new(1694, 300, -2048),400)
moveTo(Vector3.new(1689, 67, -2053),400)
moveTo(Vector3.new(1729, 73, -2046),100)
moveTo(Vector3.new(1751, 69, -2040),100)
moveTo(Vector3.new(1755, 41, -2042),100)
task.wait(1)
bv:Destroy()
task.wait(3)
teleport()
