' Helper function convert AA to Node
' default value for param  nodeType = "ContentNode" as string
function ContentListToSimpleNode(contentList as object, nodeType = "ContentNode" as string) as object
    result = CreateObject("roSGNode", nodeType) ' create node instance based on specified nodeType
    if result <> invalid
        ' go through contentList and create node instance for each item of list
        for each itemAA in contentList
            item = CreateObject("roSGNode", nodeType)
            item.SetFields(itemAA)
            result.AppendChild(item)
        end for
    end if
    return result
end function


'converts seconds to mm:ss format
function GetTime(length as integer) as string
    min = (length \ 60).ToStr()
    sec = (length mod 60)
    if sec < 10
        sec = "0" + sec.ToStr()
    else sec = sec.ToStr()
    end if
    print min
    return min + " : " + sec
end function
