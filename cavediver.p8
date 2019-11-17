pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

-- code starting from page 24
function _init()
	game_over=false
	make_player()
end

function _update()
    move_player()
end

function _draw()
	cls()
	draw_player()
end
-->8
-- make player & draw player
function make_player()
    player={}
    player.x=24      -- position
    player.y=60
    player.dy=0      -- fall speed
    player.rise=1    -- sprites
    player.fall=2
    player.dead=3
    player.speed=2   -- fly speed
    player.score=0
end

function draw_player()
    if (game_over) then
        spr(player.dead, player.x, player.y)
    elseif (player.dy<0) then
        spr(player.rise, player.x, player.y)
    else
        spr(player.fall, player.x, player.y)
    end
end

function move_player()
    gravity=0.2 -- bigger means more gravity
    player.dy+=gravity -- add gravity

    -- jump
    if (btnp(2)) then
        player.dy-=5
    end

    -- move to new position
    player.y+=player.dy
end

__gfx__
0000000000aaaa0000aaaa0000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00aaaaaa008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aa0aa0aaaaaaaaaa88988988000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaaaaaaaaa0aa0aa88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aa0000aaaaaaaaaa88899888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aaa00aaaaaa00aaa88988988000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00aa00aa008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000aaaa0000aaaa0000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
