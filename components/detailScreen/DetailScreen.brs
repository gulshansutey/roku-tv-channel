function Init()
    m.top.ObserveField("visible", "OnVisibleChange")
    m.top.ObserveField("itemFocused", "OnItemFocusChange")

    m.buttons = m.top.FindNode("buttons")
    m.poster = m.top.FindNode("poster")
    m.description = m.top.FindNode("descriptionLabel")
    m.timeLabel = m.top.FindNode("timeLabel")
    m.titleLabel = m.top.FindNode("titleLabel")
    m.releaseLabel = m.top.FindNode("releaseLabel")
    results = []
    for each button in ["PLay"]
        results.Push({ title: button })
    end for
    m.buttons.content = ContentListToSimpleNode(results)

end function

sub OnVisibleChange()
    print "here baby"
    print m.top.visible
    if m.top.visible = true
        m.buttons.SetFocus(true)
        m.top.itemFocused = m.top.jumpToItem
    end if
end sub

sub SetDetails(content as object)
    m.description.text = content.description
    m.poster.uri = content.hdPosterUrl
    m.timeLabel.text = GetTime(content.length)
    m.titleLabel.text = content.title
    m.releaseLabel.text = content.releaseLabel
end sub

'invokes when jumpToItem field updated
sub OnJumpToItem()
    content = m.top.content
    if content <> invalid and m.top.jumpToItem >= 0 and content.GetChildCount() > m.top.jumpToItem
        m.top.itemFocused = m.top.jumpToItem
    end if
end sub

sub OnItemFocusChange(event as object)
    focusedItem = event.GetData()
    content = m.top.content.GetChild(focusedItem)
    SetDetails(content)
end sub

function OnKeyEvent(key as string, press as boolean) as boolean
    result = false
    if press
        currentItem = m.top.itemFocused
        if key = "left"
            m.top.jumpToItem = currentItem - 1
            result = true
        else if key = "right"
            m.top.jumpToItem = currentItem + 1
            result = true
        end if
    end if
    return result
end function


