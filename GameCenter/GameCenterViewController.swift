//
//  GameCenterViewController.swift
//  Pilgrim
//
//  Created by Yara Vitoria on 22/06/23.
//

import UIKit
import GameKit

class GameCenterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func authenticateUser() {
        let isAutheticated = GKLocalPlayer.local.isAuthenticated
        if !isAutheticated {
            let player = GKLocalPlayer.local
            player.authenticateHandler = { viewController, error in
                guard error == nil else {
                    print(error?.localizedDescription ?? "")
                    return
                }
                if let gameCenterViewController = viewController {
                    self.present(gameCenterViewController, animated: true, completion: nil)
                }
            }
        }
    }
    func saveGameCenterLeaderboard (record: Int) {
        let local = GKLocalPlayer.local
        if GKLocalPlayer.local.isAuthenticated {
            GKLeaderboard.submitScore(record, context: 0, player: local, leaderboardIDs: ["Viajante1"], completionHandler: { error in
                if error != nil {
                    print(error!)
                } else {
                    print("Score \(record) submitted")
                }
            })
        } else {
            print("User not sign into Game Center")
        }
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


