sub Main()
    showRSGScreen()
end sub

' RSG Roku screen graph screen
sub showRSGScreen()
    ' roSGScreen object is a screen graph object that displays the content of a Scene node instance
    screen = CreateObject("roSGScreen")
    ' message port is the place where events are sent
    m.port = CreateObject("roMessagePort")
    ' set the port which will be used for events from the screen.
    screen.SetMessagePort(m.port)
    ' every screen object must have a Scene node, or a node that derives from the Scene node
    scene = screen.CreateScene("MainScene")
    ' Init method in MainScene.brs is invoked
    screen.Show()
    count = 0
    ' event loop that wait for the events on the screen.
    while(true)
        ' timeout - number of milliseconds wait for an event
        ' port - Message port to listen for screen events
        event = wait(0, m.port)
        eventType = type(event)
        if eventType = "roSGScreenEvent"
            if event.IsScreenClosed() then return ' return if screen is closed
        end if
    end while

end sub
