hs.window.animationDuration = 0

-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- Hyper+h: Left half window
k:bind({}, 'h', nil, function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
    k.triggered = true
end)

-- Hyper+l: Right half window
k:bind({}, 'l', nil, function()

    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
    k.triggered = true
end)


-- Hyper+f: Fullscreen
k:bind({}, 'f', nil, function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
    k.triggered = true
end)

-- Hyper+a: Focus or launch Alacritty
k:bind({}, 'a', nil, function()
  local name = 'Alacritty'
  local app = hs.application.get(name)
  if app then
    app:activate()
  else
    hs.application.open(name)
  end
  k.triggered = true
end)

-- Hyper+c: Focus or launch Chrome
k:bind({}, 'c', nil, function()
  local name = 'Google Chrome'
  local app = hs.application.get(name)
  if app then
    app:activate()
  else
    hs.application.open(name)
  end
  k.triggered = true
end)

-- Hyper+q: Focus or launch VSCode
k:bind({}, 'q', nil, function()
  local name = 'Code'
  local app = hs.application.get(name)
  if app then
    app:activate()
  else
    hs.application.open(name)
  end
  k.triggered = true
end)


-- Hyper+c: Focus or launch Trello
k:bind({}, 't', nil, function()
  local name = 'Trello'
  local app = hs.application.get(name)
  if app then
    app:activate()
  else
    hs.application.open(name)
  end
  k.triggered = true
end)

-- Hyper+s: Focus or launch Slack
k:bind({}, 's', nil, function()
  local name = 'Slack'
  local app = hs.application.get(name)
  if app then
    app:activate()
  else
    hs.application.open(name)
  end
  k.triggered = true
end)


-- Hyper+delete: Screensaver
k:bind({}, 'delete', nil, function()
  hs.caffeinate.startScreensaver()
end)


-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

-- Reload config when any lua file in config directory changes
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == '.lua' then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
hs.alert.show('Config loaded')

-- Detect external keyboard
local usbWatcher = nil
local externalKeyboardName = "daskeyboard"

function usbDeviceCallback(data)
  if (data["productName"] == externalKeyboardName) then
    if (data["eventType"] == "added") then
      hs.execute('~/.dotfiles/bin/karabiner-element-switch-profile.py external')
      hs.notify.new({title="Hammerspoon", informativeText="Switched to external keyboard profile for Karabiner-Element"}):send()
    elseif (data["eventType"] == "removed") then
      hs.execute('~/.dotfiles/bin/karabiner-element-switch-profile.py internal')
      hs.notify.new({title="Hammerspoon", informativeText="Switched to internal keyboard profile for Karabiner-Element"}):send()
    end
  end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
