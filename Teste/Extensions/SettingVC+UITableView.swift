
import UIKit

extension SettingVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPlants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String = CustomTableViewCellSetting.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCellSetting else{
            return UITableViewCell()
        }

        cell.configure(text: myPlants[indexPath.row].name)
        
        
        let bgColor = UIView()
        bgColor.backgroundColor = .secondarySystemBackground
        cell.selectedBackgroundView = bgColor
        
        return cell
    }
    
    
}

extension SettingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
}

