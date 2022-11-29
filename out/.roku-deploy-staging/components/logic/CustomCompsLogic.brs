sub ShowSideMenuScreen()
    sideMenu = CreateObject("roSGNode", "SideMenu")
 
    ShowScreen(sideMenu)
    toggleAnim(sideMenu)
end sub

sub toggleAnim(screen) 
    sliderAnim = screen.FindNode("sliderAnim") 
    sliderAnim.control = "start"

end sub
 
