' entry point of main_scene
sub Init()
    m.top.backgroundColor = "0x6f1bb1"
    m.top.backgroundUri = "pkg:/images/img1.jpg"
    m.loadingIndicator = m.top.FindNode("loadingIndicator")
    InitScreenStack()
    ShowGridScreen()
    RunContentTask()

end sub

' OnKeyEvent funciton receives remote control key events.
function OnKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        if key = "back"
            n = m.screenStack.Count()
            if n > 1
                CloseScreen(invalid)
                result = true
            end if
        end if
    end if
    return result
end function
