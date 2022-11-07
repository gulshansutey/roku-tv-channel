sub Init()
    'set the name of the function in the Task node component to be executed
    ' when the state field changes to RUN
    ' in our case this will be executed after we set m.contentTask.control = "run" 
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' make an api call
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetUrl("https://jonathanbduval.com/roku/feeds/roku-developers-feed-v1.json")
    response = xfer.GetToString()
    rootChildren = []
    rows = {}
    
    jsonResponse = ParseJson(response)
   
    if jsonResponse <> invalid
        for each item in jsonResponse
           
            value = jsonResponse.Lookup(item)
            ' if parsed key value have object roArray
           
            if Type(value) = "roArray"
                ' if item is not a series
                if item <> "series"
                    row = {}
                    row.title = item
                    row.children = []
                    for each subItem in value
                        print subItem
                        itemData = GetItemData(subItem)
                        row.children.Push(itemData)
                    end for
                    rootChildren.Push(row)
                end if
            end if
        end for
        ' for rowList in grid screen 
        ' we will set its child content nodes to the video stored in the children fields array
        ' using update method
        contentNode = CreateObject("roSGNode","ContentNode")
        contentNode.Update({
            children:rootChildren
        },true)
        'populate content in ContenttaskLoader.brs ->
        ' m.contentTask.ObserveField("content","OnMainContentLoaded")
        ' this observer will be invoked at this time
        m.top.content = contentNode
    end if
end sub

function GetItemData(video as Object) as Object
    item = {}
    'populate some standard content metadata fields to be disolaved on the GridScreen
    'https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata
    if video.longDescription <> invalid
        item.description = video.longDescription
    else 
        item.description = video.shortDescription
    end if
    item.hdPosterUrl = video.thumbnail
    item.title = video.title
    item.releaseDate = video.releaseDate
    item.id = video.id
    if video.content <> invalid
        'populate length of the content we need to show in itme title.
        item.length = video.content.duration
    end if
    return item
    end function
