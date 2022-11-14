sub ShowVideoPlayerScreen(content as object, index as integer)
    ' Play video script
    screen = CreateObject("roSGNode", "VideoPlayerScreen")
    screen.ObserveField("visible", "OnVPSVisibleChange")
    screen.ObserveField("buttonSelected", "OnScoreButtonSelected")
    ' create video object instance.
    m.videoPlayer = screen.FindNode("player")
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
    ShowScreen(screen)
    ' start the playback
    m.videoPlayer.control = "play"


end sub

sub OnVPSVisibleChange(event as object)
    visible = event.GetData()
    screen = event.GetRoSGNode()
    if visible = false
        m.videoPlayer.control = "stop"
    end if
end sub

sub OnScoreButtonSelected(event as object)
    toggleSize(event)
end sub

sub toggleSize(event)
    screen = event.GetRoSGNode()
    player = screen.FindNode("player")
    anim = screen.FindNode("playerAnim")
    scaleInter = screen.FindNode("scaleInter")
    transInter = screen.FindNode("transInter")


    if player.scale[0] < 1 and player.scale[1] < 1  and anim.state = "stopped"
        'expand back
        print "Expand"
        print player.width
        scaleInter = updateInterpolator(scaleInter, "[ [0.7, 0.7], [1, 1] ]")
        transInter = updateInterpolator(transInter, "[ [350, 30], [0, 0] ]")
        anim.control = "start"
    else
        print "Collapse"
        print player.width
        scaleInter = updateInterpolator(scaleInter, "[ [1, 1], [0.7, 0.7] ]")
        transInter = updateInterpolator(transInter, "[ [0.0, 0.0], [350, 30] ]")
        anim.control = "start"
    end if

end sub

function updateInterpolator(interpolator as object, value as object) as object
    interpolator.key = "[0.0, 1.0]"
    interpolator.keyValue = value
end function



