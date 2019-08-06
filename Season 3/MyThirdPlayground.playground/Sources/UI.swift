import UIKit

enum Theme{
    case DayMode
    case NightMode
}

public class UI{
    var fontColor: UIColor! // 不希望为nil, 但是根据themeMode来决定其值，在初始化时为nil
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{
        didSet{
            switch(themeMode){
            case .DayMode:
                fontColor = UIColor.black
                backgroundColor = UIColor.white
            case .NightMode:
                fontColor = UIColor.white
                backgroundColor = UIColor.black
            }
            
        }
    }
    
    init(themeMode: Theme){
        self.themeMode = themeMode
    }
}
