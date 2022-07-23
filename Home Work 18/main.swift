//
//  main.swift
//  Home Work 18
//
//  Created by Rafik on 23.07.22.
//

import Foundation

//Home Work 18
//
//1. հայտարարել protocol Sum անունով որը պետք է սահմանի մեկ ֆունկցիա sum անունով որը չի ընդունում արգումենտ և վերադարձնում է գումարի արդյունք Double տիպի


protocol Sum {
    func sum() -> Double
}

//2. Ստեղծել ստրուկտորա որը պետք է ունենա 3 stored փրոփրտիները a, b, c  Double տիպի և պետք է բավարարի Sum protocol-ի պահանջներին , Sum protocol-ի sum ֆունկցիան պետք է վերդարձնի a, b, c -ի գումարը

struct Mystruct {
    var a: Double
    var b: Double
    var c: Double
    
    func sum() -> Double {
      
        return self.a + self.b + self.c
    }
    
}

var b = Mystruct(a: 2, b: 3, c: 3)
print(b.sum())


//3. Array-ի համար գրել Extension որը պետք է բավարարի Sum protocol-ի պահանջներին միայն այն դեպքում երբ Array ի էլեմենտները Double տիպի են ( where Element == Double ), Sum protocol-ի sum ֆունկցիան պետք է վերդարձնի Array-ի էլեմենտների գումարը



extension Array: Sum where Element == Double {
    func sum() -> Double {
        var result: Double = 0
        for item in self {
            result += item
        }
        return result
    }
}

let a: Array<Double> = [2, 3, 4.2, 7.3]

print(a.sum())


//4. հայտարարել protocol Editable անունով որը պետք է սահմանի մեկ ֆունկցիա edit(newValue: Int) -> Int անունով որը  վերադարձնում հին արժեքը

protocol Editable {
   func edit(newValue: Int) -> Int
}

//5. Int -ի համար գրել Extension որը պետք է բավարարի Editable protocol-ի պահանջներին Editable protocol-ի edit ֆունկցիան պետք է ընդունի նոր արժեք որը փոխելու է ընտացիք արժեքը իսկ հին արժեքը պեքտ է վերադաձնել
  

extension Int: Editable {

    func edit(newValue: Int) -> Int {
        return newValue
    }

    func edit(newValue:inout Int, currentValue: Int ) -> Int {

        let temp = newValue
        newValue = currentValue
        
        return temp
    }
}

var val = 1

print(val.edit(newValue: &val, currentValue: 7))


