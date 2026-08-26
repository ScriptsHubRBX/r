local tp = loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsHubRBX/Server/refs/heads/main/bb", true))()
_G.hook = false
local function teleport()
if _G.hook then return end
_G.hook = true
	if _G.tp == "change" then
		tp:changelogsteleport("CargoPlane")
	elseif _G.tp == "jb" then
		tp:jbteleport("CARGO_PLANE")
		else
        tp:random()
	end
end

local asset = "rbxassetid://123283496361865"

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
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptsHubRBX/r/refs/heads/main/pl'))()
        ]])
	end
end)
spawn(function()
	while task.wait() do
		for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.WorldMarkersGui:GetChildren()) do
			pcall(function()
				local robname = v.ImageLabel.ImageLabel.Image
				if workspace:FindFirstChild("Plane") and (Vector3.new(9, 31, 206) - workspace.Plane.CargoPlane.Position).magnitude <= 3700 and v.Visible == true then
					is = true
				elseif game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and not workspace:FindFirstChild("Plane") and v.Visible == false or (Vector3.new(9, 31, 206) - workspace.Plane.CargoPlane.Position).magnitude >= 3700 and game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false then
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
		if workspace:FindFirstChild("Plane") and v.Visible == true then
			is = true
		elseif game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == false and not workspace:FindFirstChild("Plane") and v.Visible == false then
			task.wait(1)
			teleport()
		end
	end)
end

if is == nil then
	teleport()
	return
end
local VirtualInputManager = game:GetService("VirtualInputManager")
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:AddTag('NoFallDamage')
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:AddTag('NoRagdoll')
local character = game:GetService("Players").LocalPlayer.Character
local function getPosition(target)
	if typeof(target) == "Vector3" then
		return target
	elseif typeof(target) == "Instance" then
		if target:IsA("Model") then
			local primary = target:FindFirstChild("HumanoidRootPart") or target:FindFirstChild("PrimaryPart") or target:FindFirstChildWhichIsA("BasePart")
			if primary then
				return primary.Position
			end
		elseif target:IsA("BasePart") then
			return target.Position
		end
	end
	return nil
end
game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in game:GetService("Players").LocalPlayer.Character:GetChildren() do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
		if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
			v.CanTouch = false
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
	local disct = 1
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

local function moveobj(obj, moveSpeed)
	local disct = 1
	if character.Humanoid.Sit == true then
		disct = 15
	end
	local is = false
	repeat
		local p = getPosition(obj)
		task.wait()
		direction = (p + Vector3.new(0,300,0) - hrp.Position).Unit
		bv.Velocity = direction * moveSpeed
	until (p + Vector3.new(0,300,0) - hrp.Position).Magnitude <= disct
	repeat
		local p = getPosition(obj)
		task.wait()
		direction = (p - hrp.Position).Unit
		bv.Velocity = direction * moveSpeed
	until (p - hrp.Position).Magnitude <= disct
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
		wait(.5)
		if character.Humanoid.Sit == true then
			break
		end
	end
until character.Humanoid.Sit == true and drive ~= nil
moveTo(hrp.Position + Vector3.new(0,300,0),400)
local is = false
repeat
	for i, v in workspace.Plane.Crates:GetChildren() do
		if v["1"].Transparency == 0 then
			is = true
			break
		end
	end
	task.wait(.1)
until is == true
moveobj(workspace.Plane.CargoPlane,400)
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space.Value, false, nil)
task.wait()
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space.Value, false, nil)
task.wait(.1)
hrp.CFrame = CFrame.new(workspace.Plane.CargoPlane.Position)
spawn(function()
	task.wait(1)
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E.Value, false, nil)
end)
repeat 
	for i, v in workspace.Plane.Crates:GetChildren() do
		if v["1"].Transparency == 0 then
			hrp.CFrame = v["1"].CFrame + Vector3.new(0,2,0) 
			break
		end
	end
	task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.RobberyMoneyGui.Frame.Visible == true
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E.Value, false, nil)

local ray = workspace:Raycast(hrp.Position - Vector3.new(0,50,0),Vector3.new(0,-1000,0))
if not ray then return end
moveTo(ray.Position,100)
task.wait(.3)
local args = {"Chassis", "Camaro"}
game:GetService("ReplicatedStorage"):WaitForChild("GarageSpawnVehicle"):FireServer(unpack(args))
task.wait(.5)
moveTo(hrp.Position + Vector3.new(0, 300, 0),400)
moveTo(Vector3.new(-285, 206, 1965),400)
moveTo(Vector3.new(-282, 20, 1961),400)
task.wait(3)
teleport()
