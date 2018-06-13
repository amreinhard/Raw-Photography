//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//let heightFeet = Measurement(value: 6, unit: UnitLength.feet)
//let heightInches = heightFeet.converted(to: UnitLength.inches)
//let heightSensible = heightFeet.converted(to: UnitLength.meters)
//
//let furlongs = heightFeet.converted(to: UnitLength.furlongs)
//let heightAUs = heightFeet.converted(to: UnitLength.astronomicalUnits)
//
//let degrees = Measurement(value: 180, unit: UnitAngle.degrees)
//let radians = degrees.converted(to: .radians)
//
//let squareMeters = Measurement(value: 4, unit: UnitArea.squareMeters)
//let squareCentimeters = squareMeters.converted(to: .squareCentimeters)
//
//let bushels = Measurement(value: 6, unit: UnitVolume.bushels)
//let teaspoons = bushels.converted(to: .imperialTeaspoons)
//
//let doubleHeight = heightFeet * 2
//
//let firstLap = Measurement(value: 49, unit: UnitDuration.seconds)
//let secondLap = Measurement(value: 58, unit: UnitDuration.seconds)
//let thirdLap = Measurement(value: 1.3, unit: UnitDuration.minutes)
//let total = (firstLap + secondLap + thirdLap).converted(to: .minutes)

let formatter = MeasurementFormatter()
let temperature = Measurement(value: 32, unit: UnitTemperature.celsius)
formatter.unitStyle = .medium
let result = formatter.string(from: temperature)

formatter.locale = Locale(identifier: "en-GB")
formatter.unitOptions = .providedUnit
