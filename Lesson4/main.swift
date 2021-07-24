//
//  main.swift
//  Lesson4
//
//  Created by Andrei Naumenko on 24.07.2021.
//

import Foundation

enum markAuto :String {                                             //список марок авто
    case toyota, bentley, zil, scania, kamaz, nissan
}

enum eng : String{                                                  //статус работы двигателя
    case rabotaet = "Отключен", otkluchen = "Включен"
}

enum win :String {                                                  //статус окон
    case otkrito = "Открыто", zakrito = "Закрыто"
}

enum spol: String {                                                  //статус сполера Спорткара
    case spriatan = "Спрятан", vidvenut = "Выдвинут"
}

enum tent: String {                                                 //материал тента грузовика
    case tkan = "Ткань", metal = "Металл"
}

class Car {                                                 //описываем и иниц класс Car
    var mark: markAuto
    var year: Int
    var vbagage: Double
    var engine: eng
    var windows: win
    var zapolnenbagage: Double
    
    init(mark:markAuto, year: Int, vbagage: Double, engine: eng, windows: win, zapolnenbagage: Double) {
        self.mark = mark
        self.year = year
        self.vbagage = vbagage
        self.engine = engine
        self.windows = windows
        self.zapolnenbagage = zapolnenbagage
    }
}

class SportCar: Car {                               //содаем класс наследник спорткар
  
    var spoler: spol                                //добавляем новое св-во
    
    init(mark:markAuto, year: Int, vbagage: Double, engine: eng, windows: win, zapolnenbagage: Double, spoler: spol) {      //Инициализируем наследника с нов. св-в
        self.spoler = spoler
        super.init(mark: mark, year: year, vbagage: vbagage, engine: engine, windows: windows, zapolnenbagage: zapolnenbagage)          //инициализируем родительский класс
    }
   
    func soplerStatusSpriatan(){                     //У спорткара спрятан сполер
        spoler = .spriatan
        print("Сполер спрятан")
    }
    
    func soplerStatusVidvinut (){                     //У спорткара выдвинут сполер
        spoler = .vidvenut
        print("Сполер выдвинут")
    }
}
    

class TrunkCar: Car {                               //содаем класс наследник грузовик
  
    var nalichieTenta: tent                                //добавляем новое св-во
    
    init(mark:markAuto, year: Int, vbagage: Double, engine: eng, windows: win, zapolnenbagage: Double, nalichieTenta: tent) {      //Инициализируем наследника с нов. св-в
        self.nalichieTenta = nalichieTenta
        super.init(mark: mark, year: year, vbagage: vbagage, engine: engine, windows: windows, zapolnenbagage: zapolnenbagage)          //инициализируем родительский класс
    }
   
    func tentStatusTkan(){                     //У грузовика тканевый тент
        nalichieTenta = .tkan
        print("У грузовика тканевый тент")
    }
    
    func tentStatusMetal(){                     //У грузовика металлический тент
        nalichieTenta = .metal
        print("У грузовика металлический тент")
    }
}

let spcar = SportCar (mark: .bentley, year: 2015, vbagage: 200, engine: .otkluchen, windows: .zakrito, zapolnenbagage: 0, spoler: .spriatan)  //Создали автомобиль
print("Спорткар \(spcar.mark) | \(spcar.year) выпуска | \(spcar.vbagage) л багажник |  двигатель \(spcar.engine.rawValue) | окна \(spcar.windows.rawValue) | В багажнике \(spcar.zapolnenbagage) л | Спойлер \(spcar.spoler.rawValue) ")

print (" ")
spcar.soplerStatusVidvinut()                         //Выдвинули сполер

print (" ")
spcar.zapolnenbagage = 50                            //Загрузили 50 л в багажник
print("В багажник загрузили \(spcar.zapolnenbagage) л")

spcar.engine = .rabotaet                             //Завели спорткар

print (" ")
print("Спорткар \(spcar.mark) | \(spcar.year) выпуска | \(spcar.vbagage) л багажник |  двигатель \(spcar.engine.rawValue) | окна \(spcar.windows.rawValue) | В багажнике \(spcar.zapolnenbagage) л | Спойлер \(spcar.spoler.rawValue) ")


let tcar = TrunkCar (mark: .kamaz, year: 2020, vbagage: 1000, engine: .otkluchen, windows: win.zakrito, zapolnenbagage: 0, nalichieTenta: .tkan)

print (" ")
print("Грузовик \(tcar.mark) | \(tcar.year) выпуска | \(tcar.vbagage) л багажник |  двигатель \(tcar.engine.rawValue) | окна \(tcar.windows.rawValue) | В багажнике \(tcar.zapolnenbagage) л | Тент \(tcar.nalichieTenta.rawValue) ")
print (" ")
tcar.engine = .rabotaet
tcar.tentStatusMetal()

print (" ")
print("Грузовик \(tcar.mark) | \(tcar.year) выпуска | \(tcar.vbagage) л багажник |  двигатель \(tcar.engine.rawValue) | окна \(tcar.windows.rawValue) | В багажнике \(tcar.zapolnenbagage) л | Тент \(tcar.nalichieTenta.rawValue) ")

