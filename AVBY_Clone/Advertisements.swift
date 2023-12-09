//MARK: - Advertisements == Struct, where was added the specific car models(examples) for following advertisements.

struct Advertisements {
    
    let carModels = [
        
        CarModel(photosName: ["a4_1", "a4_2", "a4_3", "a4_4", "a4_5", "a4_6"] , year: 2018, selector: .automatic, engineVolume: 2.0, mileage: 126000, priceByn: 78734, dascription: "The Best car! White! Beautifull! Without any problems", publicDate: "29 okt.", reloadDate: "31.okt", power: 180, fuelTakes: 7.2, color: "white",  engineType: .gasoline, bodyType: .sedan, carName: .audi4, city: .Brest, complectation: [.abs, .backParctronics, .esp , .lightSensor, .rhainSensor], wheelsDrive: .forward, change: [.audi5,]),
        
        CarModel(photosName: ["a6_2", "a6_3", "a6_4", "a6_5", "a6_6", "a6_1"], year: 2018, selector: .automatic, engineVolume: 3.0, mileage: 60500, priceByn: 155000, dascription: "This is an amazing bussines sedan! Carefurly its Powerfull!", publicDate: "25.okt", reloadDate: "31.okt", power: 320, fuelTakes: 8.8, color: "black", engineType: .gasoline, bodyType: .sedan, carName: .audi6, city: .Hrodno, complectation: [.abs, .backParctronics, .climatControl, .cruiseControl, .esp, .lightSensor, .rhainSensor, .panoramedRoof], wheelsDrive: .full, change: [.audi7, .audi8]),
        
        CarModel(photosName: ["a8_1", "a8_2", "a8_3", "a8_4", "a8_5", "a8_6", "a8_7"], year: 2018, selector: .automatic, engineVolume: 3.0, mileage: 108000, priceByn: 201300, dascription: "Excellent condition! Originale mileage! Serviced only by an autoriced dealer!", publicDate: "05.nov", reloadDate: "05.nov", power: 285, fuelTakes: 5.6, color: "black", engineType: .disel, bodyType: .sedan, carName: .audi8, city: .Minsk, complectation: [.abs, .backParctronics, .climatControl, .cruiseControl, .engineAutoStart, .esp, .headParctronics, .immobilaizer, .lightSensor, .panoramedRoof, .rhainSensor], wheelsDrive: .full, change: [.none])
        ]
}
