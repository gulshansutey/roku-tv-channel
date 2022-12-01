sub init()
    print "side menu"
    m.buttons = m.top.findNode("buttons")
    m.accounts = m.top.findNode("accounts")
    m.buttonsIcons = m.top.findNode("buttonsIcons")
    someObect = m.top.findNode("someObect")
    rect = someObect.boundingRect()
    
    someObect.translation = [(1280 - rect.width) / 2, (720 - rect.height) / 2]

    buttonsArray = ["Search", "Home", "Surprise Me", "New & Popular", "TV Shows", "Movies", "Categories", "My List"]
    results = []
    for each button in buttonsArray
        results.Push({ title: button })
    end for
    m.buttons.content = ContentListToSimpleNode(results)

    buttonsIconsArray = [
        "pkg:/images/search_ic.png",
        "pkg:/images/home_ic.png",
        "pkg:/images/shuffle_ic.png",
        "pkg:/images/growth_ic.png",
        "pkg:/images/tv_ic.png",
        "pkg:/images/cb_ic.png",
        "pkg:/images/objects_ic.png",
        "pkg:/images/plus_ic.png",
    ]
    iconList = []
    for each icon in buttonsIconsArray
        iconList.Push({ url: icon })
    end for
    m.buttonsIcons.content = ContentListToSimpleNode(iconList)

    accountsArray = ["User", "Children"]
    results = []
    for each account in accountsArray
        results.Push({ title: account })
    end for

    m.accounts.content = ContentListToSimpleNode(results)



end sub
