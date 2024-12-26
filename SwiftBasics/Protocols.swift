
// Protocol can be defined a following way.

protocol Animal {
    var legCount:Int {get set}
    var diet :String {get set}   
}

// struct and classes can get inheritance from protocols. 

struct Bird: Animal{
 var legCount: Int = 2   
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

//BreedingManager class can be used encapsulate to breed logics. This allows to centralize the management plus modificate to easily if needed.

class BreedingManager{
    func numberOfBabies(animal1:Animal, animal2: Animal) -> Int{ 
        let babies: Int
        if(animal1.legCount != animal2.legCount) {
            print("these animals cannot be mated")
            return -1
        }
        else if(animal1.legCount == 2) {
            babies = 2
            return babies
        }
        babies = 4
        return  babies
    }
}

class Animals : Animal {
     
    var legCount: Int 
    var diet: String 
    var breedist: BreedingManager

    init (legCount:Int, diet: String, breedist: BreedingManager) {
        self.legCount = legCount
        self.diet = diet
        self.breedist = breedist
    }   

    func numberOfBabies(animal1: Animal, animal2: Animal) -> Int {
        return breedist.numberOfBabies(animal1: self.self, animal2: animal2)
    }
}

let breedingManager = BreedingManager()

let cimri = Animals(legCount: 2, diet: "herbivore", breedist: breedingManager)

let babiesOfOsmanAndCimri = cimri.numberOfBabies(animal1: cimri, animal2: osman)

print(babiesOfOsmanAndCimri)
// Adding new proporties with existing class using extensions. 
protocol BreedingMechanism {
    var explainBreedingMechanism: String {get}

}
extension BreedingManager: BreedingMechanism {
    var explainBreedingMechanism: String {
    """
    To mate two animals, they both must have same number of legs. 
    For example, you can mate a dinosour and a bird because their leg numbers are 2. 
    But you can't mate an ant and a crocodile. Ants have 6, crocodiles have 4 legs.
    """
    }
}

let mateCimri: String = cimri.breedist.explainBreedingMechanism

print(mateCimri)

protocol babyDog: BreedingMechanism {
    var babiesOfDogs :String {get}
}

extension BreedingManager : babyDog{
    var babiesOfDogs: String {
        "🐶🐶🐶🐶"
    }
}

let puppysOfCimri: String = cimri.breedist.babiesOfDogs
print(puppysOfCimri)