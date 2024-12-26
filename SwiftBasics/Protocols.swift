
// Protocol can be defined a following way.

protocol Animal {
    var legCount:Int {get set}
    var diet :String {get set}   
}

// struct and classes can get inheritance from protocols. 

struct Bird: Animal{
 var legCount: Int = 4    
 var diet: String = "omnivore"
 var wingCount: Int = 2
 var canFly: Bool = true
}

let osman:Bird = Bird()

print(osman.canFly)


class CannotFlyableAnimals: Animal {
    var legCount: Int
    var diet: String
    var canFly: Bool = false

    init(legCount: Int, diet: String ) {
        self.legCount = legCount
        self.diet = diet
    }
}

var haydut: CannotFlyableAnimals = CannotFlyableAnimals(legCount: 4, diet: "herbivor")
print(haydut.canFly)
var haydutsWife: CannotFlyableAnimals = CannotFlyableAnimals(legCount: 4, diet: "herbivor")

protocol CountOfBreeding{
    func NumberOfBabies(dog1: Animal, dog2: Animal) -> Int 

}

class BabiesCount:CountOfBreeding {
    func NumberOfBabies(dog1: any Animal, dog2: any Animal) -> Int {
     
         let babyNumber:Int = 4
         return babyNumber
        
    }
}

let babies = BabiesCount() 


