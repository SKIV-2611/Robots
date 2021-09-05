
function move_to_border!(r::Robot)
    i::Integer = 0
    back::HorizonSide = HorizonSide(3)
    while !isborder(r, back)
        move!(r, back)
        i += 1
    end
    back = revert!(back)
    border!(r)
    
    move!(r, HorizonSide(0))
    while !ismarker(r)
        putmarker!(r)
        move!(r, HorizonSide(0))
    end
    move!(r, HorizonSide(2))

    for _ = 1:i
        move!(r, back)
    end
    
end

function border!(r::Robot)
    for i = 0:3
        side::HorizonSide = HorizonSide(i)
        while !isborder(r, side)
            move!(r, side)
            if !ismarker(r)
                putmarker!(r)
            end
        end
    end
end

function revert!(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)
end