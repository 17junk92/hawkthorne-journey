local anim8 = require 'vendor/anim8'

local plyr = {}
plyr.name = 'britta'
plyr.offset = 10
plyr.ow = 1
plyr.costumes = {
    {name='Britta Perry', sheet='images/britta.png'},
    {name='Brittasaurus Rex', sheet='images/britta_dino.png'},
    {name='Cheerleader', sheet='images/britta_cheer.png'},
    {name='Darkest Timeline', sheet='images/britta_dark.png'},
    {name='Goth Assistant', sheet='images/britta_goth.png'},
    {name='Kool Kat', sheet='images/britta_cool.png'},
    {name='Queen of Spades', sheet='images/britta_spades.png'},
    {name='Squirrel', sheet='images/britta_squirrel.png'},
}

function plyr.new(sheet)
    local new_plyr = {}
    new_plyr.sheet = sheet
    new_plyr.sheet:setFilter('nearest', 'nearest')

    local g = anim8.newGrid(48, 48, new_plyr.sheet:getWidth(),
        new_plyr.sheet:getHeight())

    new_plyr.animations = {
        jump = {
            right = anim8.newAnimation('once', g('7,2'), 1),
            left = anim8.newAnimation('once', g('7,1'), 1)
        },
        walk = {
            right = anim8.newAnimation('loop', g('2-4,2', '3,2'), 0.16),
            left = anim8.newAnimation('loop', g('2-4,1', '3,1'), 0.16)
        },
        idle = {
            right = anim8.newAnimation('once', g(1,2), 1),
            left = anim8.newAnimation('once', g(1,1), 1)
        }
    }
    return new_plyr
end

return plyr
