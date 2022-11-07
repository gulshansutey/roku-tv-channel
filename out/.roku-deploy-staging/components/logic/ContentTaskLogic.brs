'content parsing logic, retrive data from the content feed
sub RunContentTask()
    'create task for feed retriving
    m.contentTask = CreateObject("roSGNode", "MainTaskLoader")
    ' observe on content to know when feed content is parsed
    m.contentTask.ObserveField("content","OnMainContentLoaded")
    m.contentTask.control = "run" 
    m.loadingIndicator.visible = true
end sub

sub OnMainContentLoaded()
    ' set focus to grid screen
    m.GridScreen.SetFocus(true) 
    m.loadingIndicator.visible = false
    m.GridScreen.content = m.contentTask.content
end sub

