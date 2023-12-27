//MARK: - Enums

enum CarName: String {
    case audi4 = "Audi a4"
    case audi5 = "Audi a5"
    case audi6 = "Audi a6"
    case audi7 = "Audi a7"
    case audi8 = "Audi a8"
    case audiEtronS = "Audi e-tron S"
    case audi80 = "Audi 80"
    case audi90 = "Audi 90"
}

enum Selector: String {
    case mechanic = "механика"
    case automatic = "автомат"
    case robot = "робот"
    case variator = "вариатор"
}

enum EngineType: String {
    case electric = "электро"
    case disel = "дизель"
    case gasoline = "бензин"
}

enum BodyType: String {
    case universal = "универсал"
    case sedan = "седан"
    case hatchback = "хэтчбек"
    case coupe = "купе"
    case suv3 = "внедорожник 3 дв."
    case suv5 = "внедорожник 5 дв."
}

enum City: String {
    case Minsk = "Менск"
    case Hrodno = "Гродно"
    case Brest = "Брест"
    case Vitebsk = "Витебск"
    case Homel = "Гомель"
    case Mohilev = "Могилев"
}

enum Complectation: String {
    case abs = "ABS"
    case esp = "ESP"
    case rhainSensor = "Датчик дождя"
    case backParctronics = "Задние парктронники"
    case headParctronics = "Передние парктронники"
    case lightSensor = "Датчик света"
    case immobilaizer = "Иммобилайзер"
    case panoramedRoof = "Панарамная крыша"
    case cruiseControl = "Круиз контроль"
    case engineAutoStart = "Старт-стоп"
    case climatControl = "Климат контроль"
}

enum WheelsDrive: String {
    case forward = "передний привод"
    case back = "задний привод"
    case constantFull = "постоянный полный привод"
    case plugInFull = "подключаемый полный привод"
}

enum Change: String {
    case audi4 = "Audi a4"
    case audi5 = "Audi a5"
    case audi6 = "Audi a6"
    case audi7 = "Audi a7"
    case audi8 = "Audi a8"
    case none = "Не интересует"
}

enum Mark: String {
    case top = "Top"
    case vin = "Vin"
    case topVin = "Top and Vin"
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
    
    let marks: Mark
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
