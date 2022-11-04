' init stack to store all screens 
sub InitScreenStack()
    m.screenStack = []
end sub

sub ShowScreen(node as Object)
    ' peek stack and check if it has the any screen and change hide it
    prev = m.screenStack.Peek()
    if prev <> invalid 
        prev.visible = false 
    end if
    ' show new screen #node
    m.top.AppendChild(node)
    node.visible = true
    node.SetFocus(true)
    ' push current screen to top of the stack
    m.screenStack.Push(node)

end sub

sub CloseScreen(node as Object)
    ' check if node is invalid or stack.peek() is not invalid and is the same node
    if node = invalid OR (m.screenStack.Peek() <> invalid AND m.screenStack.Peek().IsSameNode(node))
        last = screenStack.Pop() ' pop last screen 
        last.visible = false ' hide the screen
        m.top.RemoveChild(node) 'remove screen

        'bring current node from stack
        prev = screenStack.Peek()
        ' Check if its not invalid
        if prev <> invalid
            prev.visible = true 
            prev.SetFocus(true)
        end if
    end if
end sub





