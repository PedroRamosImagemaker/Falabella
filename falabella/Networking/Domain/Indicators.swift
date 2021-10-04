//
//  Indicators.swift
//  falabella
//
//  Created by Image Maker on 2/10/21.
//

import Foundation

struct Indicators: Codable {
    var version: String
    var autor: String
    var fecha: Date
    var uf: IndicatorDetail
    var ivp: IndicatorDetail
    var dolar: IndicatorDetail
    var dolarIntercambio: IndicatorDetail
    var euro: IndicatorDetail
    var ipc: IndicatorDetail
    var utm: IndicatorDetail
    var imacec: IndicatorDetail
    var tpm: IndicatorDetail
    var libraCobre: IndicatorDetail
    var tasaDesempleo: IndicatorDetail
    var bitcoin: IndicatorDetail
}

extension Indicators {
    var list: [String: IndicatorDetail] {
        return ["uf": uf,
                "ivp": ivp,
                "dolar": dolar,
                "dolarIntercambio": dolarIntercambio,
                "euro": euro,
                "ipc": ipc,
                "utm": utm,
                "imacec": imacec,
                "tpm": tpm,
                "libraCobre": libraCobre,
                "tasaDesempleo": tasaDesempleo,
                "bitcoin": bitcoin]
    }
}
