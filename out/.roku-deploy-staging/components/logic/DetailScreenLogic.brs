sub ShowDetailScreen(content as object, selectedItem as integer)
    detailScreen = CreateObject("roSGNode", "DetailScreen")
    detailScreen.content = content
    detailScreen.jumpToitem = selectedItem
    detailScreen.ObserveField("visible", "OnDetailScreenVisibleChange")
    detailScreen.ObserveField("buttonSelected", "OnButtonSelected")
    ShowScreen(detailScreen)
end sub


sub OnButtonSelected(event) '?
    deatils = event.GetRoSGNode()
    content = deatils.content
    buttonIndex = event.getData()
    selectedItem = deatils.itemFocused
    if buttonIndex = 0
        ShowVideoScreen(content, selectedItem)
    end if
end sub

sub OnDetailScreenVisibleChange(event as object)
    visible = event.GetData()
    detailScreen = event.GetRoSGNode()
    if visible = false
        m.GridScreen.jumpToRowItem = [m.selectedIndex[0], detailScreen.itemFocused] '?
    end if
end sub