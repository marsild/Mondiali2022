//
//  NotificationManager.swift
//  Mondiali 2022
//
//  Created by Marsild Spahiu on 10/08/22.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let istance = NotificationManager() //Singleton
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if success {
                print("success")
            } else {
                print("error")
            }
        }
    }
    func scheduleNotification(id: String, data: Date){
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "it")
        let dateComponents = calendar.dateComponents([.day, .hour, .minute] , from: data)
        let content = UNMutableNotificationContent()
        content.title = "Matchday!"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: id,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotification(id: String){
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
    func printNotificationsInPending(){
        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
           for notification:UNNotificationRequest in notificationRequests {
                  print(notification.identifier)
           }
        }
    }
}
