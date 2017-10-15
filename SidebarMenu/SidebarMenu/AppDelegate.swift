import UIKit
import Firebase
import GoogleSignIn
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    var audioPlayer: AVAudioPlayer?
    
    

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //FirebaseApp.configure()
        
        playSong(song: "OM")
        
        return true
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func playSong(song: NSString) -> Void
    {
        //Check filepath exits or not.
        if let filePaths = Bundle.main.path(forResource: song as String, ofType: "mp3")
        {
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePaths))
                
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.prepareToPlay()
                
                let audioSession =  AVAudioSession.sharedInstance()
                do{
                    try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                }
                catch{
                    
                }
            }catch
            {
                print("Error")
            }
            audioPlayer?.play()
        }
    }
}

