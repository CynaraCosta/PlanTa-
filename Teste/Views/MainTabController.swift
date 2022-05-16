import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .secondarySystemBackground
        self.tabBar.tintColor = UIColor(named: "verde-escuro")
        let Images = ["house", "calendar", "gear"]

        let homeVC = HomeVC()
        homeVC.title = "Sua casa"
        let calendarVC = CalendarVC()
        calendarVC.title = "Calendário"
        let settingVC = SettingVC()
        settingVC.title = "Suas configurações"

        self.setViewControllers([homeVC, calendarVC, settingVC], animated: false)
        guard let items = self.tabBar.items else {return}

        for vc in (0...Images.count - 1) {
            items[vc].image = UIImage(systemName: Images[vc])
        }
    }

}

