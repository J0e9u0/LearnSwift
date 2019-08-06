import UIKit

var str = "Season 4"

struct Matrix{
    
    var data:[[Double]]
    let r:Int
    let c:Int
    
    init(row: Int, col:Int) {
        self.r = row
        self.c = col
        data = [[Double]]()
        for _ in 0..<r{
            let aRow = Array(count: col, repeatedValue: 0.0)
            dasta.append(aRow)
        }
    }
}
