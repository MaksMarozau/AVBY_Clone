//MARK: - Enums

enum CarName: String {
    case audi4 = "Audi a4"
    case audi5 = "Audi a5"
    case audi6 = "Audi a6"
    case audi7 = "Audi a7"
    case audi8 = "Audi a8"
}

enum Selector: String {
    case mechanic = "mechanic"
    case automatic = "automatic"
}

enum EngineType: String {
    case electric = "electric"
    case disel = "disel"
    case gasoline = "gasoline"
}

enum BodyType: String {
    case universal = "universal"
    case sedan = "sedan"
    case hatchback = "hatchback"
    case coupe = "coupe"
}

enum City: String {
    case Minsk = "Minsk"
    case Hrodno = "Hrodno"
    case Brest = "Brest"
    case Vitebsk = "Vitebsk"
    case Homel = "Homel"
    case Mohilev = "Mohilev"
}

enum Complectation: String {
    case abs = "ABS"
    case esp = "ESP"
    case rhainSensor = "Rhain Sensor"
    case backParctronics = "Back Parctronics"
    case headParctronics = "Head Parctronics"
    case lightSensor = "Light Sensor"
    case immobilaizer = "Immobilaizer"
    case panoramedRoof = "Panoramed Roof"
    case cruiseControl = "Cruise Control"
    case engineAutoStart = "Engine Auto Start"
    case climatControl = "Climat Control"
}

enum WheelsDrive: String {
    case forward = "forward"
    case back = "back"
    case full = "full"
}

enum Change: String {
    case audi4 = "Audi a4"
    case audi5 = "Audi a5"
    case audi6 = "Audi a6"
    case audi7 = "Audi a7"
    case audi8 = "Audi a8"
    case none = "none"
}



//MARK: - Struct CarModel

struct CarModel {
    
//Properties
    let photosName: [String]
    let year: Int
    let selector: Selector
    let engineVolume: Double
    let mileage: Int
    let priceByn: Int
    let dascription: String
    let publicDate: String
    let reloadDate: String
    let power: Int
    let fuelTakes: Double
    let color: String

    let engineType: EngineType
    let bodyType: BodyType
    let carName: CarName
    let city: City
    let complectation: [Complectation]
    let wheelsDrive: WheelsDrive
    let change: [Change]
    
//Methods
    func convertationPricetoUsd() -> Int {
        let priceUsd:Int = Int(Double(priceByn) / 3.2)
        return priceUsd
    }
    
    func leasing() -> Int {
        let mountlySum = (priceByn / 60) + Int(Double(priceByn / 60) * 0.05)
        return mountlySum
    }
}
