import Foundation
protocol Car {
    var model: String { get }
    var color: String { get }
    var buildDate: Int { get }
    var price: Float { get set }
    var accessories: [Accessories] { get set }
    var isServiced: Bool { get set }
}
protocol Dealership {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Car] { get set }
    var showroomCars: [Car] { get set }
    var cars: [Car] { get set }
    
    func offerAccesories(accessories: [Accessories])
    func presaleService(_ car: inout Car)
    func addToShowroom(_ car: inout Car)
    func sellCar(car: Car)
    func orderCar()
}
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer()
}
enum Accessories {
    case signaling, rugs, winterTires, multimedia, alloyWheels, otherSecurityElements
}
struct Toyota: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Float
    var accessories: [Accessories] = []
    var isServiced: Bool
}
struct Honda: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Float
    var accessories: [Accessories] = []
    var isServiced: Bool
}
struct Subaru: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Float
    var accessories: [Accessories] = []
    var isServiced: Bool
}

struct Mazda: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Float
    var accessories: [Accessories] = []
    var isServiced: Bool
}
struct Ford: Car {
    var model: String
    var color: String
    var buildDate: Int
    var price: Float
    var accessories: [Accessories] = []
    var isServiced: Bool
}
class ToyotaDealer: Dealership, SpecialOffer {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars: [Car] = []
    var securityElements: [Accessories] = []
    init(name: String, showroomCapacity: Int) {
        self.name = name
        self.showroomCapacity = showroomCapacity
    }
    func addEmergencyPack() {
        securityElements.contains(.otherSecurityElements)
        print("Добавлена аптечка и огнетушитель в автомобиль")
    }
    func makeSpecialOffer() {
        for car in cars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
                securityElements.contains(.otherSecurityElements)
                print("Добавлена аптечка и огнетушитель в автомобиль")
            }
        }
    }
    func offerAccesories(accessories: [Accessories]) {
        if !accessories.contains(.signaling) {
            print("Хотите приобрести сигнализацию к автомобилю?")
        } else if accessories.contains(.winterTires) {
            print("У нас кстате акция, зимняя резина в подарок")
        } else if accessories.contains(.rugs) {
            print("Коврики, кстате, за пол цены")
        } else if accessories.contains(.multimedia) {
            print("Мультимедиа на iOS, топ за свои деньги")
        } else if accessories.contains(.alloyWheels) {
            print("Покупайте литье, оно легче, ниже расход топлива")
        }
    }
    func presaleService(_ car: inout Car) {
        if car.isServiced == false {
            car.isServiced = true
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
        }
    }
    func addToShowroom(_ car: inout Car) {
        for var car in stockCars {
            stockCars.removeAll(where: { $0.model == car.model })
            showroomCars.append(car)
            if car.isServiced == false {
                car.isServiced = true
                print("Автомобиль \(car.model) прошел предпродажную подготовку")
            } else {
                print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
            }
            print("Автомобиль \(car.model) был перевезен со склада в автосалон")
        }
    }
    func sellCar(car: Car) {
        if car.isServiced == false {
            print("Предпродажной подготовки не было, значит машину пока не продаем")
        } else {
            car.accessories.contains(.signaling)
            print("Клиент купил сигнализацию")
            car.accessories.contains(.rugs)
            print("Клиент купил коврики")
            car.accessories.contains(.winterTires)
            print("Клиент купил зимнюю резину")
            car.accessories.contains(.multimedia)
            print("Клиент купил мультимедийную систему")
            car.accessories.contains(.alloyWheels)
            print("Клиент купил литые диски")
            showroomCars.removeAll(where: { $0.model == car.model })
            print("Предпродажная подготовка выполнена, пакет доп. опций установлен и машина продана")
        }
    }
    func orderCar() {
        let addToyotaCamry = Toyota(model: "Toyota Camry", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
        let addToyotaCorolla = Toyota(model: "Toyota Corolla", color: "White", buildDate: 2020, price: 1550000, isServiced: false)
        let addToyotaRunx = Toyota(model: "Toyota Runx", color: "Green", buildDate: 2019, price: 1100500, isServiced: true)
        stockCars.append(addToyotaCamry)
        stockCars.append(addToyotaCorolla)
        stockCars.append(addToyotaRunx)
        print("Добавлен автомобиль на склад \(addToyotaCamry.model), \(addToyotaCorolla.model), \(addToyotaRunx.model)")
    }
    func discountedCars() {
        for car in showroomCars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
            }
        }
        for car in stockCars {
            if car.buildDate < 2021 {
                stockCars.removeAll(where: { $0.model == car.model })
                showroomCars.append(car)
                print("Автомобиль со скидкой \(car.model) был перевезен со склада в автосалон")
            }
        }
    }
}
var toyota: Car = Toyota(model: "Toyota Camry", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
var toyotaCar: Car = toyota
let toyotaDealer = ToyotaDealer(name: "Метдведь АТЦ", showroomCapacity: 3)
print("Официальный диллер Тойота \(toyotaDealer.name)")
toyotaDealer.offerAccesories(accessories: toyota.accessories)
toyotaDealer.presaleService(&toyotaCar)
toyotaDealer.orderCar()
toyotaDealer.addToShowroom(&toyotaCar)
toyotaDealer.sellCar(car: toyota)
let addToyotaAllex = Toyota(model: "Toyota Allex", color: "White", buildDate: 2015, price: 650000, isServiced: false)
let addToyotaSprinter = Toyota(model: "Toyota Sprinter", color: "Blue", buildDate: 2001, price: 300000, isServiced: false)
toyotaDealer.showroomCars.append(addToyotaAllex)
toyotaDealer.showroomCars.append(addToyotaSprinter)
toyotaDealer.showroomCars.forEach {
    print("На парковке автосалона стоит автомобиль: \($0.model)")
}
toyotaDealer.cars += toyotaDealer.showroomCars
toyotaDealer.cars += toyotaDealer.stockCars
toyotaDealer.cars.forEach {
    print("Автомобиль на складе и на парковке: \($0.model)")
}
toyotaDealer.addEmergencyPack()
toyotaDealer.makeSpecialOffer()
toyotaDealer.discountedCars()
print("------------------------------------------")
class HondaDealer: Dealership, SpecialOffer {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars: [Car] = []
    var securityElements: [Accessories] = []
    init(name: String, showroomCapacity: Int) {
        self.name = name
        self.showroomCapacity = showroomCapacity
    }
    func addEmergencyPack() {
        securityElements.contains(.otherSecurityElements)
        print("Добавлена аптечка и огнетушитель в автомобиль")
    }
    func makeSpecialOffer() {
        for car in cars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
                securityElements.contains(.otherSecurityElements)
                print("Добавлена аптечка и огнетушитель в автомобиль")
            }
        }
    }
    func offerAccesories(accessories: [Accessories]) {
        if !accessories.contains(.signaling) {
            print("Хотите приобрести сигнализацию к автомобилю?")
        } else if accessories.contains(.winterTires) {
            print("У нас кстате акция, зимняя резина в подарок")
        } else if accessories.contains(.rugs) {
            print("Коврики, кстате, за пол цены")
        } else if accessories.contains(.multimedia) {
            print("Мультимедиа на iOS, топ за свои деньги")
        } else if accessories.contains(.alloyWheels) {
            print("Покупайте литье, оно легче, ниже расход топлива")
        }
    }
    func presaleService(_ car: inout Car) {
        if car.isServiced == false {
            car.isServiced = true
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
        }
    }
    func addToShowroom(_ car: inout Car) {
        for var car in stockCars {
            stockCars.removeAll(where: { $0.model == car.model })
            showroomCars.append(car)
            if car.isServiced == false {
                car.isServiced = true
                print("Автомобиль \(car.model) прошел предпродажную подготовку")
            } else {
                print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
            }
            print("Автомобиль \(car.model) был перевезен со склада в автосалон")
        }
    }
    func sellCar(car: Car) {
        if car.isServiced == false {
            print("Предпродажной подготовки не было, значит машину пока не продаем")
        } else {
            car.accessories.contains(.signaling)
            print("Клиент купил сигнализацию")
            car.accessories.contains(.rugs)
            print("Клиент купил коврики")
            car.accessories.contains(.winterTires)
            print("Клиент купил зимнюю резину")
            car.accessories.contains(.multimedia)
            print("Клиент купил мультимедийную систему")
            car.accessories.contains(.alloyWheels)
            print("Клиент купил литые диски")
            showroomCars.removeAll(where: { $0.model == car.model })
            print("Предпродажная подготовка выполнена, пакет доп. опций установлен и машина продана")
        }
    }
    func orderCar() {
        let addHondaAccord = Honda(model: "Honda Accord", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
        let addHondaFit = Honda(model: "Honda Fit", color: "White", buildDate: 2020, price: 1550000, isServiced: false)
        let addToyotaCRV = Honda(model: "Honda CRV", color: "Green", buildDate: 2019, price: 1100500, isServiced: true)
        stockCars.append(addHondaAccord)
        stockCars.append(addHondaFit)
        stockCars.append(addToyotaCRV)
        print("Добавлен автомобиль на склад \(addHondaAccord.model), \(addHondaFit.model), \(addToyotaCRV.model)")
    }
    func discountedCars() {
        for car in showroomCars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
            }
        }
        for car in stockCars {
            if car.buildDate < 2021 {
                stockCars.removeAll(where: { $0.model == car.model })
                showroomCars.append(car)
                print("Автомобиль со скидкой \(car.model) был перевезен со склада в автосалон")
            }
        }
    }
}
var honda: Car = Honda(model: "Honda Accord", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
var hondaCar: Car = honda
let hondaDealer = HondaDealer(name: "Хонда АТЦ", showroomCapacity: 3)
print("Официальный диллер Хонды \(hondaDealer.name)")
hondaDealer.offerAccesories(accessories: honda.accessories)
hondaDealer.presaleService(&hondaCar)
hondaDealer.orderCar()
hondaDealer.addToShowroom(&hondaCar)
hondaDealer.sellCar(car: honda)
let addHondaCivic = Honda(model: "Honda Civic", color: "White", buildDate: 2015, price: 650000, isServiced: false)
let addHondaJazz = Honda(model: "Honda Jazz", color: "Blue", buildDate: 2001, price: 300000, isServiced: false)
hondaDealer.showroomCars.append(addHondaCivic)
hondaDealer.showroomCars.append(addHondaJazz)
hondaDealer.showroomCars.forEach {
    print("На парковке автосалона стоит автомобиль: \($0.model)")
}
hondaDealer.cars += hondaDealer.showroomCars
hondaDealer.cars += hondaDealer.stockCars
hondaDealer.cars.forEach {
    print("Автомобиль на складе и на парковке: \($0.model)")
}
hondaDealer.addEmergencyPack()
hondaDealer.makeSpecialOffer()
hondaDealer.discountedCars()
print("------------------------------------------")
class SubaruDealer: Dealership {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars: [Car] = []
    var securityElements: [Accessories] = []
    init(name: String, showroomCapacity: Int) {
        self.name = name
        self.showroomCapacity = showroomCapacity
    }
    func addEmergencyPack() {
        securityElements.contains(.otherSecurityElements)
        print("Добавлена аптечка и огнетушитель в автомобиль")
    }
    func makeSpecialOffer() {
        for car in cars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
                securityElements.contains(.otherSecurityElements)
                print("Добавлена аптечка и огнетушитель в автомобиль")
            }
        }
    }
    func offerAccesories(accessories: [Accessories]) {
        if !accessories.contains(.signaling) {
            print("Хотите приобрести сигнализацию к автомобилю?")
        } else if accessories.contains(.winterTires) {
            print("У нас кстате акция, зимняя резина в подарок")
        } else if accessories.contains(.rugs) {
            print("Коврики, кстате, за пол цены")
        } else if accessories.contains(.multimedia) {
            print("Мультимедиа на iOS, топ за свои деньги")
        } else if accessories.contains(.alloyWheels) {
            print("Покупайте литье, оно легче, ниже расход топлива")
        }
    }
    func presaleService(_ car: inout Car) {
        if car.isServiced == false {
            car.isServiced = true
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
        }
    }
    func addToShowroom(_ car: inout Car) {
        for var car in stockCars {
            stockCars.removeAll(where: { $0.model == car.model })
            showroomCars.append(car)
            if car.isServiced == false {
                car.isServiced = true
                print("Автомобиль \(car.model) прошел предпродажную подготовку")
            } else {
                print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
            }
            print("Автомобиль \(car.model) был перевезен со склада в автосалон")
        }
    }
    func sellCar(car: Car) {
        if car.isServiced == false {
            print("Предпродажной подготовки не было, значит машину пока не продаем")
        } else {
            car.accessories.contains(.signaling)
            print("Клиент купил сигнализацию")
            car.accessories.contains(.rugs)
            print("Клиент купил коврики")
            car.accessories.contains(.winterTires)
            print("Клиент купил зимнюю резину")
            car.accessories.contains(.multimedia)
            print("Клиент купил мультимедийную систему")
            car.accessories.contains(.alloyWheels)
            print("Клиент купил литые диски")
            showroomCars.removeAll(where: { $0.model == car.model })
            print("Предпродажная подготовка выполнена, пакет доп. опций установлен и машина продана")
        }
    }
    func orderCar() {
        let addSubaruImpreza = Subaru(model: "Subaru Impreza", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
        let addSuraruForester = Subaru(model: "Subaru Forester", color: "White", buildDate: 2020, price: 1550000, isServiced: false)
        stockCars.append(addSubaruImpreza)
        stockCars.append(addSuraruForester)
        print("Добавлен автомобиль на склад \(addSubaruImpreza.model), \(addSuraruForester.model)")
    }
    func discountedCars() {
        for car in showroomCars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
            }
        }
        for car in stockCars {
            if car.buildDate < 2021 {
                stockCars.removeAll(where: { $0.model == car.model })
                showroomCars.append(car)
                print("Автомобиль со скидкой \(car.model) был перевезен со склада в автосалон")
            }
        }
    }
}
var subaru: Car = Subaru(model: "Subaru Impreza", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
var subaruCar: Car = subaru
let subaruDealer = SubaruDealer(name: "Субару АТЦ", showroomCapacity: 3)
print("Официальный диллер Субару \(subaruDealer.name)")
subaruDealer.offerAccesories(accessories: subaru.accessories)
subaruDealer.presaleService(&subaruCar)
subaruDealer.orderCar()
subaruDealer.addToShowroom(&subaruCar)
subaruDealer.sellCar(car: subaru)
let addSubaruWRX = Subaru(model: "Subaru WRX", color: "White", buildDate: 2015, price: 650000, isServiced: false)
let addSubaruOutback = Subaru(model: "Subaru Outback", color: "Blue", buildDate: 2001, price: 300000, isServiced: false)
subaruDealer.showroomCars.append(addSubaruWRX)
subaruDealer.showroomCars.append(addSubaruOutback)
subaruDealer.showroomCars.forEach {
    print("На парковке автосалона стоит автомобиль: \($0.model)")
}
subaruDealer.cars += subaruDealer.showroomCars
subaruDealer.cars += subaruDealer.stockCars
subaruDealer.cars.forEach {
    print("Автомобиль на складе и на парковке: \($0.model)")
}
subaruDealer.addEmergencyPack()
subaruDealer.makeSpecialOffer()
subaruDealer.discountedCars()
print("------------------------------------------")
class MazdaDealer: Dealership {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars: [Car] = []
    var securityElements: [Accessories] = []
    init(name: String, showroomCapacity: Int) {
        self.name = name
        self.showroomCapacity = showroomCapacity
    }
    func addEmergencyPack() {
        securityElements.contains(.otherSecurityElements)
        print("Добавлена аптечка и огнетушитель в автомобиль")
    }
    func makeSpecialOffer() {
        for car in cars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
                securityElements.contains(.otherSecurityElements)
                print("Добавлена аптечка и огнетушитель в автомобиль")
            }
        }
    }
    func offerAccesories(accessories: [Accessories]) {
        if !accessories.contains(.signaling) {
            print("Хотите приобрести сигнализацию к автомобилю?")
        } else if accessories.contains(.winterTires) {
            print("У нас кстате акция, зимняя резина в подарок")
        } else if accessories.contains(.rugs) {
            print("Коврики, кстате, за пол цены")
        } else if accessories.contains(.multimedia) {
            print("Мультимедиа на iOS, топ за свои деньги")
        } else if accessories.contains(.alloyWheels) {
            print("Покупайте литье, оно легче, ниже расход топлива")
        }
    }
    func presaleService(_ car: inout Car) {
        if car.isServiced == false {
            car.isServiced = true
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
        }
    }
    func addToShowroom(_ car: inout Car) {
        for var car in stockCars {
            stockCars.removeAll(where: { $0.model == car.model })
            showroomCars.append(car)
            if car.isServiced == false {
                car.isServiced = true
                print("Автомобиль \(car.model) прошел предпродажную подготовку")
            } else {
                print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
            }
            print("Автомобиль \(car.model) был перевезен со склада в автосалон")
        }
    }
    func sellCar(car: Car) {
        if car.isServiced == false {
            print("Предпродажной подготовки не было, значит машину пока не продаем")
        } else {
            car.accessories.contains(.signaling)
            print("Клиент купил сигнализацию")
            car.accessories.contains(.rugs)
            print("Клиент купил коврики")
            car.accessories.contains(.winterTires)
            print("Клиент купил зимнюю резину")
            car.accessories.contains(.multimedia)
            print("Клиент купил мультимедийную систему")
            car.accessories.contains(.alloyWheels)
            print("Клиент купил литые диски")
            showroomCars.removeAll(where: { $0.model == car.model })
            print("Предпродажная подготовка выполнена, пакет доп. опций установлен и машина продана")
        }
    }
    func orderCar() {
        let addMazda6 = Mazda(model: "Mazda 6", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
        let addMazda3 = Mazda(model: "Mazda 3", color: "White", buildDate: 2020, price: 1550000, isServiced: false)
        let addMazda2 = Mazda(model: "Mazda 2", color: "Green", buildDate: 2019, price: 1100500, isServiced: true)
        stockCars.append(addMazda6)
        stockCars.append(addMazda3)
        stockCars.append(addMazda2)
        print("Добавлен автомобиль на склад \(addMazda6.model), \(addMazda3.model), \(addMazda2.model)")
    }
    func discountedCars() {
        for car in showroomCars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
            }
        }
        for car in stockCars {
            if car.buildDate < 2021 {
                stockCars.removeAll(where: { $0.model == car.model })
                showroomCars.append(car)
                print("Автомобиль со скидкой \(car.model) был перевезен со склада в автосалон")
            }
        }
    }
}
var mazda: Car = Mazda(model: "Mazda 6", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
var mazdaCar: Car = mazda
let mazdaDealer = MazdaDealer(name: "Мазда АТЦ", showroomCapacity: 3)
print("Официальный диллер Мазды \(mazdaDealer.name)")
mazdaDealer.offerAccesories(accessories: mazda.accessories)
mazdaDealer.presaleService(&mazdaCar)
mazdaDealer.orderCar()
mazdaDealer.addToShowroom(&mazdaCar)
mazdaDealer.sellCar(car: mazda)
let addMazdaDemio = Mazda(model: "Mazda Demio", color: "White", buildDate: 2015, price: 650000, isServiced: false)
let addMazdaFamilia = Mazda(model: "Mazda Familia", color: "Blue", buildDate: 2001, price: 300000, isServiced: false)
mazdaDealer.showroomCars.append(addMazdaDemio)
mazdaDealer.showroomCars.append(addMazdaFamilia)
mazdaDealer.showroomCars.forEach {
    print("На парковке автосалона стоит автомобиль: \($0.model)")
}
mazdaDealer.cars += mazdaDealer.showroomCars
mazdaDealer.cars += mazdaDealer.stockCars
mazdaDealer.cars.forEach {
    print("Автомобиль на складе и на парковке: \($0.model)")
}
mazdaDealer.addEmergencyPack()
mazdaDealer.makeSpecialOffer()
mazdaDealer.discountedCars()
print("------------------------------------------")
class FordDealer: Dealership {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car] = []
    var showroomCars: [Car] = []
    var cars: [Car] = []
    var securityElements: [Accessories] = []
    init(name: String, showroomCapacity: Int) {
        self.name = name
        self.showroomCapacity = showroomCapacity
    }
    func addEmergencyPack() {
        securityElements.contains(.otherSecurityElements)
        print("Добавлена аптечка и огнетушитель в автомобиль")
    }
    func makeSpecialOffer() {
        for car in cars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
                securityElements.contains(.otherSecurityElements)
                print("Добавлена аптечка и огнетушитель в автомобиль")
            }
        }
    }
    func offerAccesories(accessories: [Accessories]) {
        if !accessories.contains(.signaling) {
            print("Хотите приобрести сигнализацию к автомобилю?")
        } else if accessories.contains(.winterTires) {
            print("У нас кстате акция, зимняя резина в подарок")
        } else if accessories.contains(.rugs) {
            print("Коврики, кстате, за пол цены")
        } else if accessories.contains(.multimedia) {
            print("Мультимедиа на iOS, топ за свои деньги")
        } else if accessories.contains(.alloyWheels) {
            print("Покупайте литье, оно легче, ниже расход топлива")
        }
    }
    func presaleService(_ car: inout Car) {
        if car.isServiced == false {
            car.isServiced = true
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
        }
    }
    func addToShowroom(_ car: inout Car) {
        for var car in stockCars {
            stockCars.removeAll(where: { $0.model == car.model })
            showroomCars.append(car)
            if car.isServiced == false {
                car.isServiced = true
                print("Автомобиль \(car.model) прошел предпродажную подготовку")
            } else {
                print("Предпродажную подготовку автомобиля \(car.model) делать не нужно")
            }
            print("Автомобиль \(car.model) был перевезен со склада в автосалон")
        }
    }
    func sellCar(car: Car) {
        if car.isServiced == false {
            print("Предпродажной подготовки не было, значит машину пока не продаем")
        } else {
            car.accessories.contains(.signaling)
            print("Клиент купил сигнализацию")
            car.accessories.contains(.rugs)
            print("Клиент купил коврики")
            car.accessories.contains(.winterTires)
            print("Клиент купил зимнюю резину")
            car.accessories.contains(.multimedia)
            print("Клиент купил мультимедийную систему")
            car.accessories.contains(.alloyWheels)
            print("Клиент купил литые диски")
            showroomCars.removeAll(where: { $0.model == car.model })
            print("Предпродажная подготовка выполнена, пакет доп. опций установлен и машина продана")
        }
    }
    func orderCar() {
        let addToyotaCamry = Toyota(model: "Toyota Camry", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
        let addToyotaCorolla = Toyota(model: "Toyota Corolla", color: "White", buildDate: 2020, price: 1550000, isServiced: false)
        let addToyotaRunx = Toyota(model: "Toyota Runx", color: "Green", buildDate: 2019, price: 1100500, isServiced: true)
        stockCars.append(addToyotaCamry)
        stockCars.append(addToyotaCorolla)
        stockCars.append(addToyotaRunx)
        print("Добавлен автомобиль на склад \(addToyotaCamry.model), \(addToyotaCorolla.model), \(addToyotaCamry.model)")
    }
    func discountedCars() {
        for car in showroomCars {
            if car.buildDate < 2021 {
                print("На автомобиль \(car.model) действует скидка 15%")
            }
        }
        for car in stockCars {
            if car.buildDate < 2021 {
                stockCars.removeAll(where: { $0.model == car.model })
                showroomCars.append(car)
                print("Автомобиль со скидкой \(car.model) был перевезен со склада в автосалон")
            }
        }
    }
}
var ford: Car = Ford(model: "Toyota Camry", color: "Black", buildDate: 2021, price: 2650000, isServiced: true)
var fordCar: Car = ford
let fordDealer = FordDealer(name: "Форд АТЦ", showroomCapacity: 3)
print("Официальный диллер Форд \(fordDealer.name)")
fordDealer.offerAccesories(accessories: ford.accessories)
fordDealer.presaleService(&fordCar)
fordDealer.orderCar()
fordDealer.addToShowroom(&fordCar)
fordDealer.sellCar(car: ford)
let addFordExplorer = Ford(model: "Ford Explorer", color: "White", buildDate: 2015, price: 650000, isServiced: false)
let addFordMondeo = Toyota(model: "Ford Mondeo", color: "Blue", buildDate: 2001, price: 300000, isServiced: false)
fordDealer.showroomCars.append(addFordExplorer)
fordDealer.showroomCars.append(addFordMondeo)
fordDealer.showroomCars.forEach {
    print("На парковке автосалона стоит автомобиль: \($0.model)")
}
fordDealer.cars += fordDealer.showroomCars
fordDealer.cars += fordDealer.stockCars
fordDealer.cars.forEach {
    print("Автомобиль на складе и на парковке: \($0.model)")
}
fordDealer.addEmergencyPack()
fordDealer.makeSpecialOffer()
fordDealer.discountedCars()
print("------------------------------------------")
let arrayDealer: [Dealership] = [toyotaDealer, hondaDealer, subaruDealer, mazdaDealer, fordDealer]
for dealer in arrayDealer {
    if dealer is ToyotaDealer {
        print("Тойота, управляй мечтой")
    } else if dealer is HondaDealer {
        print("Сначала человек, потом машина")
    } else if dealer is SubaruDealer {
        print("Мыслить, чувствовать, управлять")
    } else if dealer is MazdaDealer {
        print("Зум-Зум")
    } else if dealer is FordDealer {
        print("Надежен. Создан для жизни")
    }
}

