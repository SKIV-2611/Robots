using HorizonSideRobots
export HorizonSide, HorizonSideRobots, Nord, Ost, Robot, Sud, West, isborder, ismarker, move!, putmarker!, save, show, show!, sitcreate, sitedit, sitedit!, temperature



r=Robot("temp.sit"; animate=true)
include("robots_border.jl")
move_to_border!(r)