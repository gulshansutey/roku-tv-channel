sub ShowSideMenuScreen()
    sideMenu = CreateObject("roSGNode", "SideMenu")
    sideMenu.ObserveField("screenObjectSelected", "OnSomeObjectSelected")
    ShowScreen(sideMenu)

end sub

sub OnSomeObjectSelected(event)
    toggleAnim(event)
end sub

sub toggleAnim(event)

    screen = event.GetRoSGNode()
    print screen.isSideMenuOpen
    anim = screen.FindNode("sliderAnim")

    titleMenu = screen.FindNode("titleMenu")
    transInter = screen.FindNode("navLabelsInterpolator")
    overlayDimInter = screen.FindNode("overlayDim")

    keyValue = "[ [-150, 0.0], [100, 0.0] ]"
    fieldToInterp = "titleMenu.translation"

    if screen.isSideMenuOpen = false and anim.state = "stopped"
        'expand back
        print "Expand"
        transInter = updateInterpolator(transInter, "[ [-320, 0.0], [100, 0.0] ]")
        overlayDimInter = updateInterpolator(overlayDimInter, "[[ #00000000, #00000088 ]]")
        anim.control = "start"
        screen.isSideMenuOpen = true
    else 
        print "Collapse"
        transInter = updateInterpolator(transInter, "[ [100, 0], [-320, 0] ]")
        overlayDimInter = updateInterpolator(overlayDimInter, "[[ #00000088 ,#00000000]]")
        screen.isSideMenuOpen = false
        anim.control = "start"
    end if

end sub

