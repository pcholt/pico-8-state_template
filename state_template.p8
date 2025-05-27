pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

states = {
    menu = {
        update = function()
            if btnp(5) then
                enter(states.game)
            end
        end,
        draw = function()
            cls(13)
            print("\^t\^wfAST gAME", 10, 10, 7)
            print("press ❎ to start", 10, 30, 7)
        end},
    game = {
        update = function()
            if btnp(1) then
                enter(states.game_over)
            end
        end,
        draw = function()
            cls(1)
            print("game", 10, 10, 7)
            print("press ➡️ to game_over", 10, 20, 7)
        end},
    game_over = {
        t = 0,
        enter = function(self)
            self.t = t() + 2
        end,
        update = function(self)
            self.active = t() > self.t
            if self.active then
                enter(states.menu)
            end
        end,
        draw = function(self)
            cls(3)
            print("game_over", 10, 10, 2)
            print("press ⬆️ to menu", 10, 20, 7)
        end
    }
}

state = states.menu
function enter(new_state)
    if state.exit then
        state:exit()
    end
    state = new_state
    if state.enter then
        state:enter()
    end
end

function _draw()
    state:draw()
end

function _update()
    state:update()
end

function _init()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700077777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000077777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000077777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700077777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
