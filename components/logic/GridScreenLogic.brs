sub ShowGridScreen()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
    ' When an item is selected, set to a 2-element array,
    ' where element 0 contains the index of the row containing the selected item,
    ' and element 1 contains the index of the selected item in that row.
    m.GridScreen.ObserveField("rowItemSelected", "OnGridScreenItemSelected")
    ShowScreen(m.GridScreen) ' show GridScreen
end sub

sub OnGridScreenItemSelected(event as Object)
    grid = event.GetRoSGNode()
    ' array of integer
    m.selectedIndex = event.GetData()
    rowContent = grid.content.GetChild(m.selectedIndex[0])
    itemIndex = m.selectedIndex[1]
    ShowVideoScreen(rowContent,itemIndex)
end sub

