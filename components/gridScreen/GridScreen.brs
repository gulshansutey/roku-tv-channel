'entry point for grid screen
' every xml need a coresponding behaviour file
sub Init()
    ' access rowList defined in its xml file and store it in a variable with 'm' component scope
    m.rowList = m.top.FindNode("rowList")
    m.rowList.SetFocus(true)
    m.description = m.top.FindNode("descriptionLabel")
    m.top.ObserveField("visible", "OnVisibleChange")
    m.thumbnail = m.top.FindNode("thumbnail")
    m.title = m.top.FindNode("titleLable")
    'on new row item focused invoke OnItemFoucsed
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused")

end sub

sub OnVisibileChange()
    if m.top.visible = true
        m.RowList.SetFocus(true)
    end if
end sub

sub OnItemFocused()
    focusedIndex = m.rowList.rowItemFocused 'Current focused item
    row = m.rowList.content.GetChild(focusedIndex[0])
    item = row.GetChild(focusedIndex[1])
    m.description.text = item.description
    m.title.text = item.title
    m.thumbnail = item.HDPOSTERURL

    if item.length <> invalid
        m.title.text += " | " + GetTime(item.length)
    end if

end sub

