//
//  HapticsManager.swift
//  Spark
//
//  Created by Alex Roman on 10/13/21.
//

import Foundation
import CoreHaptics

/**
        The Haptics Manager handles the creation of Haptics engines, patterns, and players.
 */
class HapticsManager {
    var engine:  CHHapticEngine!
    var player: CHHapticPatternPlayer!
    
    init?(){
        //check for support
        if(!deviceHasCHEngine()){
            print("Device does not support or have access to the CHHaptics Engine")
            return nil
        }
        //attempt to create engine
        do {
            try createEngine()
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    /**
                Create engine will attempt to initialize an engine, but will throw an error otherwise.
     */
    private func createEngine() throws {
        do {
            engine = try CHHapticEngine()
        } catch let error {
            throw error
        }
    }
    
    /**
                Setups handlers for the engine to restart on failure, and case handling of engine for different failures.
     */
    private func setupHandlers() throws {
        engine.resetHandler = {
            do {
                try self.engine.start()
            } catch let error{
                print("Failed to restart engine: \(error)")
            }
        }
        
        engine.stoppedHandler = { reason in
            print("Stop Handler: The engine stopped for the reason - \(reason.rawValue)")
            
            switch reason {
            case .audioSessionInterrupt: print("Audio session interrpt")
            case .applicationSuspended: print("Application suspended")
            case .idleTimeout: print("Idle timout")
            case .systemError: print("System Error")
            @unknown default:
                    print("Unkown Error")
            }
        }
    }
    

    
    /**
                Will return a boolean value determining whether the current application device supports haptic engine.
     */
    func deviceHasCHEngine() -> Bool {
        let hapticSupport = CHHapticEngine.capabilitiesForHardware()
        
        if (!hapticSupport.supportsHaptics){
           
            return false
        }
        
        return true
    }
    
    func playError(){
            do{
                
                let pattern = try errorPattern()
                
                try engine.start()
                
                let player = try engine.makePlayer(with: pattern)
                
                try player.start(atTime: CHHapticTimeImmediate)
                engine.notifyWhenPlayersFinished(finishedHandler: {
                    _ in return .stopEngine
                })
            }
            catch {
                print("Failed to play error haptics: \(error)")
            }
    }
}
extension HapticsManager {
    private func errorPattern() throws -> CHHapticPattern {
       //create paramenteres to adjust intensity/sharpness
        let params: [CHHapticEventParameter] = [
            CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.7),
            CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        ]
        
        //create haptic events to be played
        let block = CHHapticEvent(eventType: .hapticTransient, parameters: params, relativeTime: 0, duration: 5.0)
        let block2 = CHHapticEvent(eventType: .hapticTransient, parameters: params, relativeTime: 0.25, duration: 5.0)
        //attempt to create patttern from single events
        return try CHHapticPattern(events: [block, block2], parameters: [])
        
    }
}
