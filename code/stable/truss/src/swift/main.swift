/** main.swift
    Controls the flow of the program
    - Authors: Ting-Yu Wu
*/
import Foundation

extension String: Error {}

var outfile: FileHandle
var filename: String = CommandLine.arguments[0]
do {
    outfile = try FileHandle(forWritingTo: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("log.txt"))
    try outfile.seekToEnd()
} catch {
    throw "Error opening file."
}
do {
    try outfile.write(contentsOf: Data("var 'filename' assigned ".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(filename.utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(" in module Control".utf8))
    try outfile.write(contentsOf: Data("\n".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.close()
} catch {
    throw "Error closing file."
}
var inParams: InputParameters = InputParameters()
try get_input(filename, inParams)
try derived_values(inParams, inParams.F_vect_1, inParams.x_1, inParams.x_2)
try input_constraints(&inParams, pi)
var F_vect_AC: Double = try func_F_vect_AC(&inParams)
do {
    outfile = try FileHandle(forWritingTo: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("log.txt"))
    try outfile.seekToEnd()
} catch {
    throw "Error opening file."
}
do {
    try outfile.write(contentsOf: Data("var 'F_vect_AC' assigned ".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(String(F_vect_AC).utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(" in module Control".utf8))
    try outfile.write(contentsOf: Data("\n".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.close()
} catch {
    throw "Error closing file."
}
var F_vect_BC: Double = try func_F_vect_BC(&inParams)
do {
    outfile = try FileHandle(forWritingTo: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("log.txt"))
    try outfile.seekToEnd()
} catch {
    throw "Error opening file."
}
do {
    try outfile.write(contentsOf: Data("var 'F_vect_BC' assigned ".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(String(F_vect_BC).utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(" in module Control".utf8))
    try outfile.write(contentsOf: Data("\n".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.close()
} catch {
    throw "Error closing file."
}
var F_vect_AD: Double = try func_F_vect_AD(&inParams, F_vect_AC)
do {
    outfile = try FileHandle(forWritingTo: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("log.txt"))
    try outfile.seekToEnd()
} catch {
    throw "Error opening file."
}
do {
    try outfile.write(contentsOf: Data("var 'F_vect_AD' assigned ".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(String(F_vect_AD).utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(" in module Control".utf8))
    try outfile.write(contentsOf: Data("\n".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.close()
} catch {
    throw "Error closing file."
}
var F_vect_BD: Double = try func_F_vect_BD(&inParams, F_vect_BC)
do {
    outfile = try FileHandle(forWritingTo: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("log.txt"))
    try outfile.seekToEnd()
} catch {
    throw "Error opening file."
}
do {
    try outfile.write(contentsOf: Data("var 'F_vect_BD' assigned ".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(String(F_vect_BD).utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.write(contentsOf: Data(" in module Control".utf8))
    try outfile.write(contentsOf: Data("\n".utf8))
} catch {
    throw "Error printing to file."
}
do {
    try outfile.close()
} catch {
    throw "Error closing file."
}
try write_output(&inParams, F_vect_AC, F_vect_AD, F_vect_BC, F_vect_BD)
