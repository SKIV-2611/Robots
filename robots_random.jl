include("robots_border.jl")
function robots_random!(r::Robot)
    
end

function move_to_border_mod!(r::Robot)::Nothing
    i::Integer = 0
    back::HorizonSide = HorizonSide(3)
    while !isborder(r, back)
        move!(r, back)
        i += 1
    end
    back = revert!(back)
    border!(r)
    j::Integer = i
    for _ = 1:j
        move!(r, back)
        marker_border(r)
        i -= 1
    end
end

function marker_border(r::Robot)::Nothing
    for i = 0:3
        side::HorizonSide = HorizonSide(i)
        while !is_marker_to_side!(r, side)
            if !ismarker(r)
                putmarker!(r)
            end
            move!(r, side)
        end
    end
    while !ismarker(r)
        putmarker!(r)
        move!(r, HorizonSide(0))
    end
end

function is_marker_to_side!(r::Robot, side::HorizonSide)::Bool
    if isborder(r, side)
        return false
    end
    move!(r, side)
    marked::Bool = ismarker(r)
    side = revert!(side)
    move!(r, side)
    return marked
end

function revert!(side::HorizonSide)::HorizonSide
    return HorizonSide((Int(side) + 2) % 4)
end