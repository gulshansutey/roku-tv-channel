' Play video script
sub ShowVideoScreen(content as object, index as integer)
    ' create video object instance.
    m.videoPlayer = CreateObject("roSGNode", "Video")
    if index <> 0
        ' get number of rows
        itemCount = content.GetChildCount()
        items = content.GetChildren(itemCount - index, index)
        clonedItem = []
        for each item in items
            clonedItem.Push(item.Clone(false))
        end for

        ' create new parent node for cloned items
        node = CreateObject("roSGNode", "ContentNode")
        
        node.Update({
            children: clonedItem
        }, true)
        m.videoPlayer.content = node
    else
        m.videoPlayer.content = content.Clone(true)
    end if
    ' enable video playlist
    m.videoPlayer.contentIsPlaylist = true
    ShowScreen(m.videoPlayer)
    ' start the playback
    m.videoPlayer.control = "play"
    m.videoPlayer.ObserveField("state", "OnVideoPlayerStateChange")
    m.videoPlayer.ObserveField("visible", "OnVideoPlayerVisibleChange")
end sub

sub OnVideoPlayerStateChange()

    state = m.videoPlayer.state

    if state = "finished" or state = "error"
        
        CloseScreen(m.videoPlayer)
    end if

end sub

sub OnVideoPlayerVisibleChange()
    ' is video player is not visible and current component
    ' at top of the screen is visible.
    if m.videoPlayer.visible = false and m.top.visible = true
        ' index of last video was playing
        currentIndex = m.videoPlayer.contentIndex
        ' stop and reset the video player
        m.videoPlayer.control = "stop"
        m.videoPlayer.content = invalid
        m.GridScreen.SetFocus(true)
        m.GridScreen.jumpToRowItem = [m.selectedIndex[0], currentIndex + m.selectedIndex[1]]
    end if

end sub


