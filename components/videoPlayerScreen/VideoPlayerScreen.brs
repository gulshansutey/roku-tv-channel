sub init()
    m.player = m.top.FindNode("player")
    m.player.mute = true
    m.button = m.top.FindNode("button")
    m.top.ObserveField("currentFocus", "OnItemFocusChange")
    m.top.SetFocus(true)
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
    result = false
    if press
        if key = "up" or key = "down"
            if m.top.currentFocus = m.player.id
                m.top.currentFocus = m.button.id
            else m.top.currentFocus = m.player.id
            end if
        end if
    end if
    return result
end function

sub OnItemFocusChange(nodeId as object)
    m.top.FindNode(nodeId.GetData()).SetFocus(true)
end sub