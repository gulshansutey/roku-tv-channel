sub init()
        print "side menu"
        m.buttons = m.top.findNode("buttons")
        m.accounts = m.top.findNode("accounts")
        buttonsArray = ["Search", "Home", "Surprise Me", "New & Popular", "TV Shows", "Movies", "Categories", "My List"]
        results = []
        for each button in buttonsArray
            results.Push({ title: button })
        end for
        m.buttons.content = ContentListToSimpleNode(results)

        accountsArray = [ "User", "Children"]
        results = []
        for each account in accountsArray
            results.Push({ title: account })
        end for
        
        m.accounts.content = ContentListToSimpleNode(results)

end sub
 