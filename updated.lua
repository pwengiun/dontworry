if game.PlaceId == 5602055394 then
  local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

  --[[local colors = {
      SchemeColor = Color3.fromRGB(0,255,255),
      Background = Color3.fromRGB(25,25,25),
      Header = Color3.fromRGB(35,35,35),
      TextColor = Color3.fromRGB(255,255,255),
      ElementColor = Color3.fromRGB(20, 20, 20)
  }--]]
  local Window = Library.CreateLib("RTX-WARE 2.0 || :3 , https://discord.gg/APg8n5vknZ", "BloodTheme") 

  local Main = Window:NewTab("Main") 
  local MainSection = Main:NewSection("Main")
  MainSection:NewButton("Aimlock", "Q, type /e autosettings in chat for best settings", function()
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Hyotinhofofinho/s1mple/main/LIXO"))() 
  end) 
  MainSection:NewButton("AntiStomp", "AntiStomp", function()   
      loadstring(game:HttpGet(("https://raw.githubusercontent.com/MasterViera/raidware/main/antibypass"), true))()
  end) 
  MainSection:NewButton("SuperSpeed (c)", "hold c for superspeed", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/angeloX041/Speedc/main/SuperSpeedC "))()  
  end) 

  MainSection:NewButton("Infinite Jump", "Jump in the air", function()   
      local gayer = game:GetService'Players'.LocalPlayer;
      local gayus = game:GetService'UserInputService';

      _G.JumpHeight = 50;

      function Action(Object, Function) if Object ~= nil then Function(Object); end end

      gayus.InputBegan:connect(function(UserInput)
          if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
              Action(gayer.Character.Humanoid, function(self)
                  if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                      Action(self.Parent.HumanoidRootPart, function(self)
                          self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                      end)
                  end
              end)
          end
      end)

  end)
  MainSection:NewButton("No jump cooldown", "Removes jump cooldown", function()
      local Players = game:GetService("Players")
      local lp = Players.LocalPlayer
      local mouse = lp:GetMouse()
      local uis = game:GetService("UserInputService")
      local rservice = game:GetService("RunService")
      local cam = workspace.CurrentCamera
      local NormalGravity = game.Workspace.Gravity

      local Raw = getrawmetatable(game)
      local Caller = checkcaller or is_protosmasher_caller or Cer.isCerus
      local CallingScript = getcallingscript or get_calling_script
      local Closure = newcclosure or read_me or function(Func) return Func end
      local CallingMethod = getnamecallmethod or get_namecall_method
      setreadonly(Raw,false)
      local NewIndex = Raw.__newindex;
      Raw.__newindex = Closure(function(self,Property,Value)
          if Caller() then return NewIndex(self,Property,Value) end
          if Property == "WalkSpeed" then return 16 end
          if Property == "JumpPower" then return 50 end 
          if Property == "HipHeight" then return 0 end 
          if self == workspace and Property == "Gravity" then return NormalGravity end
          if Property == "CFrame" and self:IsDescendantOf(lp.Character) then return end 
          return NewIndex(self,Property,Value)
      end)
      local Namecall = Raw.__namecall;
      Raw.__namecall = Closure(function(self,...)
      local Args = {...}
          if Caller() then 
              if CallingMethod() == "FindFirstChild" and Args[1] == "HumanoidRootPart" then 
                  Args[1] = "HumanoidRootPart" 
                  return Namecall(self,unpack(Args))
              end
              return Namecall(self,...) 
          end 
          if CallingMethod() == "Destroy" or CallingMethod() == "Kick" then 
              if self == lp then return wait(9e9) end
              if tostring(self) == 'BodyGyro' or tostring(self) == 'BodyVelocity' then return wait(9e9) end 
          end
          if CallingMethod() == "BreakJoints" and self == lp.Character then return wait(9e9) end
          return Namecall(self,...)
      end)
      setreadonly(Raw,true)
  end)






  local Silent = Window:NewTab("Silent Aim")
  local Silentsection = Silent:NewSection("Silent Aim")

  local GetService = setmetatable({}, {
      __index = function(self, key)
          return game:GetService(key)
      end
  })


  local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
  local Notify = NotifyLibrary.Notify


  local RunService = GetService.RunService
  local Players = GetService.Players
  local LocalPlayer = Players.LocalPlayer
  local Mouse = LocalPlayer:GetMouse()
  local serInputService = game:GetService("UserInputService")
  local nouseLocation = serInputService:GetMouseLocation()

  local CurrentCamera = workspace.CurrentCamera
  local UserInputService = GetService.UserInputService
  local GuiInset = GetService.GuiService:GetGuiInset()
  local AimbotFOV = Drawing.new("Circle")
  AimbotFOV.Thickness = 1
  local SilentAimFOV = Drawing.new("Circle")
  SilentAimFOV.Thickness = 1

  local Insert = table.insert
  local Network = GetService.NetworkClient
  local CheckmateFolder = Instance.new("Folder", workspace)
  CheckmateFolder.Name = "Checkmate-Folder"
  local StarterGui = GetService.StarterGui
  local ReplicatedStorage = GetService.ReplicatedStorage





    local CheckmateSettings = {
        Aiming = {
            Aimbot = {
                Enabled = false,
                AimAssist = false,
                IsAiming = false,
                ShowFOV = false,
                FOVColor = Color3.new(0.603921, 0.011764, 1),
                UseNearestDistance = false,
                WallCheck = false,
                KnockedOutCheck = false,
                GrabbedCheck = false,
                Hitboxes = {"Head"}
            },
            TriggerBot = {
                Enabled = false,
                Delay = false,
                DelayAmount = 0
            },
            SilentAim = {
                Enabled = false,
                ShowFOV = false,
                FOVColor = Color3.new(0.603921, 0.011764, 1),
                WallCheck = false,
                KnockedOutCheck = false,
                UseNearestDistance = false,
                GrabbedCheck = false,
                Hitboxes = {"Head"}
            },
            TargetAim = {
                Enabled = false,
                ShowFOV = false,
                FOVColor = Color3.new(0.603921, 0.011764, 1),
                WallCheck = false,
                KnockedOutCheck = false,
                UseNearestDistance = false,
                GrabbedCheck = false,
                Hitboxes = {"Head"},
                Target = nil
            },
            AimingSettings = {
                MovementPrediction = false,
                MovementPredictionAmount = 0.165 * 1,
                HitChance = false,
                HitChanceAmount = {
                    HitPercent = 100,
                    NotHitPercent = 0
                },
                AimAssistType = "Camera",
                MovementPrediction = false,
                MovementPredictionAmount = 0.165 * 1,
                SmoothingTracing = false,
                SmoothingTracingAmount = 5,
                PingBasedPrediction = false,
                GetVelocity = 0.165
            },
            TargetAimSettings = {
                UnlockTargetKnocked = false,
                NotificationAlert = false,
            },
            FOV = {
                FOVFilled = false,
                AimAssistSize = 100,
                SilentAimSize = 200,
                TargetAimSize = 100
            },
            Whitelist = {
                Players = {},
                Friends = {},
                Holder = "",
                Enabled = false,
                CrewEnabled = false,
                FriendsWhitelist = false
            },
        },
        Blatant = {
            BlatantAA = {
                Enabled = false,
                NoAutoRotate = false,
                UndergroundWallbang = false,
                Underground = false,
                AntiAimType = "Jitter",
                AntiAimSpeed = 100,
                JitterAngle = 180
            },
            LegitAA = {
                Enabled = false,
                AntiAimAt = false,
                AntiAimAtDistance = 20
            },
            FakeLag = {
                Enabled = false,
                TriggerAmount = 5
            },
            Movement = {
                SpeedEnabled = false,
                SpeedType = "Default",
                SpeedRender = "Default",
                SpeedAmount = 5
            },
            Reaching = {
                FistReach = false,
                MeleeReach = false
            },
            Character = {
                AntiGrab = false,
                AntiStomp = false,
                AntiStompType = "Nil Char",
                AntiBag = false,
                AutoArmor = false,
                AutoLettuce = false,
                AutoReload = false
            },
            Farming = {
                ATMFarm = false,
                ShoeFarm = false,
                MuscleFarm = false,
                MuscleFarmingType = "Normal",
                BoxFarm = false,
                HospitalFarm = false,
                ATMPick = false
            },
            Cash = {
                AutoDrop = false,
                AutoDropAmount = 5000,
                AutoPickCash = false
            }
        },
        Teleport = {
            TeleportReturn = false,
            ReturnDelay = false,
            AutoPurchase = false,
            AmmoPurchaseAmount = 1
        }
    }


    local CheckmateModule = {
        Old = {
            CFrame,
        },
        God = {
            MeleeAlive = false,
            GodMelee = false,
            GodBullet = false,
            AntiRagdoll = false
        },
        LagTick = 0,
        Ignores = {
            "UpperTorso",
            "LowerTorso",
            "Head",
            "LeftHand",
            "LeftUpperArm",
            "LeftLowerArm",
            "RightHand",
            "RightUpperArm",
            "RightLowerArm"
        },
        PingBasedPrediction = 0.165,
        Instance = {},
        Teleport = {
            Players = {},
            Food = {
                "Cranberry",
                "Donut",
                "Pizza",
                "Chicken",
                "Popcorn",
                "Hamburger",
                "Taco",
                "Starblox Latte",
                "Lettuce",
                "Lemonade"
            },
            Location = {
                "Bank",
                "Boxing Place",
                "Police Station",
                "Admin Base",
                "Sewers",
                "Shoe Store",
                "Hospital",
                "Phone Store",
                "Taco Shack",
                "Casino",
                "UFO",
                "Fire Station",
                "Church",
                "Downhill Shop",
                "Uphill Shop"
            },
            Gun = {
                "Glock",
                "SMG",
                "Silencer",
                "TacticalShotgun",
                "P90",
                "AUG",
                "Shotgun",
                "RPG",
                "AR",
                "Double-Barrel SG",
                "Flamethrower",
                "Revolver",
                "LMG",
                "AK47",
                "DrumGun",
                "Silencer",
                "GrenadeLauncher",
                "Taser",
                "SilencerAR",
                "Grenade"
            },
            Armor = {
                "High-Medium Armor",
                "Medium Armor"
            },
            Mask = {
                "Surgeon Mask",
                "Riot Mask",
                "Pitchfork",
                "Hockey Mask",
                "Breathing Mask",
                "Pumpkin Mask",
                "Skull Mask",
                "Paintball Mask",
                "Ninja Mask"
            },
            Weight = {
                "Weights",
                "HeavyWeights"
            },
            Melee = {
                "Shovel",
                "Bat",
                "Pencil",
                "StopSign",
                "Knife",
                "Pitchfork"
            },
            Phone = {
                "iPhone",
                "iPhoneB",
                "iPhoneG",
                "iPhoneP",
                "Old Phone",
                "Orange Phone",
                "Original Phone",
            },
            Bike = {
                "DuoBike",
                "Solo Bike",
            },
            Extra = {
                "PepperSpray",
                "LockPicker",
                "Flashlight",
                "Flowers",
                "Money Gun",
                "Brown Bag",
                "Anti Bodies",
                "Firework"
            }
        }
    }


  Silentsection:NewToggle("Enable Silent Aim", "Silent aim", function(state)
      CheckmateSettings.Aiming.SilentAim.Enabled = state
  end)
  Silentsection:NewToggle("Show FOV", "Show Silent aim FOV circle", function(state)
      CheckmateSettings.Aiming.SilentAim.ShowFOV = state
  end)

  Silentsection:NewToggle("Wall check", "Dont shoot players behind a wall", function(state)
      CheckmateSettings.Aiming.SilentAim.WallCheck = state
  end)

  Silentsection:NewToggle("Ignore Friends", "Dont aim at friends", function(state)
      CheckmateSettings.Aiming.Whitelist.FriendsWhitelist = state
  end)

  Silentsection:NewSlider("FOV", "Change FOV size", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
      CheckmateSettings.Aiming.FOV.SilentAimSize = s
  end)







   local Player = Window:NewTab("Player") 
   local PlayerSection = Player:NewSection("Player")
   PlayerSection:NewButton("Right Korblox ", "Right korblox (client) ", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/carlcoded/pro/main/rightkorbloxperma'))()
   end)

   PlayerSection:NewButton("Headless (FE)", "Headless ", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/carlcoded/pro/main/headlessperma'))()
   end)

   local settings_tbl = {
        ESP_Enabled = false,
        ESP_TeamCheck = false,
        Chams = true,
        Chams_Color = Color3.fromRGB(255,255,255),
        Chams_Transparency = 0.1,
        Chams_Glow_Color = Color3.fromRGB(255,255,255)
   }
   local Visuals = Window:NewTab("Visuals") 
   local VisualsSection = Visuals:NewSection("Visuals")
   VisualsSection:NewToggle("Chams", "Enable chams", function(state)
        settings_tbl.ESP_Enabled = state
   end)

   local dwEntities = game:GetService("Players")
   local dwLocalPlayer = dwEntities.LocalPlayer 
   local dwRunService = game:GetService("RunService")



   function destroy_chams(char)

   for k,v in next, char:GetChildren() do 

        if v:IsA("BasePart") and v.Transparency ~= 1 then

             if v:FindFirstChild("Glow") and 
             v:FindFirstChild("Chams") then

                  v.Glow:Destroy()
                  v.Chams:Destroy() 

             end 

        end 

   end 

   end

   dwRunService.Heartbeat:Connect(function()

   if settings_tbl.ESP_Enabled then

        for k,v in next, dwEntities:GetPlayers() do 

             if v ~= dwLocalPlayer then

                  if v.Character and
                  v.Character:FindFirstChild("HumanoidRootPart") and 
                  v.Character:FindFirstChild("Humanoid") and 
                  v.Character:FindFirstChild("Humanoid").Health ~= 0 then

                       if settings_tbl.ESP_TeamCheck == false then

                       local char = v.Character 

                       for k,b in next, char:GetChildren() do 

                            if b:IsA("BasePart") and 
                            b.Transparency ~= 1 then

                                 if settings_tbl.Chams then

                                      if not b:FindFirstChild("Glow") and
                                      not b:FindFirstChild("Chams") then

                                           local chams_box = Instance.new("BoxHandleAdornment", b)
                                           chams_box.Name = "Chams"
                                           chams_box.AlwaysOnTop = true 
                                           chams_box.ZIndex = 4 
                                           chams_box.Adornee = b 
                                           chams_box.Color3 = settings_tbl.Chams_Color
                                           chams_box.Transparency = settings_tbl.Chams_Transparency
                                           chams_box.Size = b.Size + Vector3.new(0.02, 0.02, 0.02)

                                           local glow_box = Instance.new("BoxHandleAdornment", b)
                                           glow_box.Name = "Glow"
                                           glow_box.AlwaysOnTop = false 
                                           glow_box.ZIndex = 3 
                                           glow_box.Adornee = b 
                                           glow_box.Color3 = settings_tbl.Chams_Glow_Color
                                           glow_box.Size = chams_box.Size + Vector3.new(0.13, 0.13, 0.13)

                                      end

                                 else

                                      destroy_chams(char)

                                 end

                            end

                       end

                       else

                       if v.Team == dwLocalPlayer.Team then
                            destroy_chams(v.Character)
                       end

                       end

                  else

                       destroy_chams(v.Character)

                  end

             end

        end

   else 

        for k,v in next, dwEntities:GetPlayers() do 

             if v ~= dwLocalPlayer and 
             v.Character and 
             v.Character:FindFirstChild("HumanoidRootPart") and 
             v.Character:FindFirstChild("Humanoid") and 
             v.Character:FindFirstChild("Humanoid").Health ~= 0 then

                  destroy_chams(v.Character)

             end

        end

   end

   end)


   VisualsSection:NewButton("Unnamed ESP", "Load UnnamedESP", function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"), true))()
   end)







   local Misc = Window
