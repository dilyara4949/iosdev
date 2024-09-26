import Cocoa

var shoppingList: [String] = []

func add() {
    print("\nEnter the item to add:")
    if let item = readLine(), item != "" {
        shoppingList.append(item)
        print("'\(item)' has been added to the shopping list")
    } else {
        print("Invalid input")
    }
}

func remove() {
    print("\nEnter the item to remove:")
    if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
        print("'\(item)' removed")
    } else {
        print("Item not found in shopping list")
    }
}
       
func displayList() {
    if shoppingList.isEmpty {
        print("\nThe shopping list is empty")
    } else {
        print("\nShopping List:")
        for (i, item) in shoppingList.enumerated() {
            print("\(i + 1). \(item)")
        }
    }
}

func displayMenu() {
    print("""
    \nShopping List Menu:
    1. Add item to the list
    2. Remove item from the list
    3. Display shopping list
    4. Exit
    """)
}

var run = true
    
    while run {
        displayMenu()
        print("\nEnter your command from menu:")
        
        if let cmd = readLine(), let option = Int(cmd) {
            switch option {
            case 1:
                add()
            case 2:
                remove()
            case 3:
                displayList()
            case 4:
                run = false
                print("Exit")
            default:
                print("Invalid command. Please enter a number between 1 and 4")
            }
        } else {
            print("Invalid input. Please enter a number")
        }
    }