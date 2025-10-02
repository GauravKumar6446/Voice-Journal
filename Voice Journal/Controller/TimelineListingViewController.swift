//
//  TimelineListingViewController.swift
//  Voice Journal
//
//  Created by Gaurav Kumar on 02/10/25.
//

import UIKit
import InstantSearchVoiceOverlay


class TimelineListingViewController: UIViewController, VoiceOverlayDelegate {
   
    //MARK: -VARIABLES-
    
    let voiceOverlay = VoiceOverlayController()
    var journalList = [Voices]()
    var record : String = ""
    
    //MARK: -OUTLETS-
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet var VoiceBtn : UIButton!
    @IBOutlet weak var TableView: UITableView!
    
    //MARK: -VIEWCONTROLLER LIFE CYCLE-
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.roundCornerBottom(10)
        topView.dropShadowCustom(shadowColor: .appColor(.black,alpha: 0.3))
        
        titleLbl.setAppFontColor(.appColor(.black), font: .Montserrat(.bold, size: .twoOne))
        VoiceBtn.backgroundColor = .appColor(.white)
        VoiceBtn.makeRoundCornerwithborder(30, bordercolor: .appColor(.black, alpha: 0.5), borderwidth: 1.0)

        TableView.registerCell(type: JournalCellTableViewCell.self)
        TableView.registerCell(type: EmptyCellTableViewCell.self)
        TableView.backgroundColor = .clear
        TableView.makeRoundCorner(12)
        TableView.delegate = self
        TableView.dataSource = self
        TableView.separatorStyle = .none
        TableView.showsVerticalScrollIndicator = false
        TableView.showsHorizontalScrollIndicator = false
        
        journalList = DataBaseHelper.shareInstance.getList()
    
            
    }
    //MARK: -ACTIONS-
    @IBAction func tapOnVoiceBtn(_ sender: Any) {
        voiceOverlay.delegate =  self
        voiceOverlay.datasource = self
        voiceOverlay.settings.autoStop = false
        voiceOverlay.settings.autoStart = true
        voiceOverlay.settings.autoStopTimeout = 3.0
        self.record = ""
        voiceOverlay.start(on: self, textHandler: {text, final, _ in
           if final {
                if !text.isEmpty { self.record = text }
                let title = self.record.split(separator: " ").prefix(5).joined(separator: " ")
               DataBaseHelper.shareInstance.save(textTitle: title, text: self.record, time: self.getDate())
                self.journalList = DataBaseHelper.shareInstance.getList()
                self.TableView.reloadData()
            } else {
                self.record = text
            }
        }, errorHandler: {error in
            
        })
    }
    //Get current date and time
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeStyle = .none
        let date = Date()
        dateFormatter.locale = Locale(identifier: "en_US") // set how the output should look like
        return dateFormatter.string(from: date)
       
    }
    //MARK: -VOICE OVERLAY DELEGAGTES-
    func recording(text: String?, final: Bool?, error: (any Error)?) {
       // I am using the closure instead of this delegate
    }
   
}

//MARK: -TABLE VIEW DELEGATE-

extension TimelineListingViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController.instantiate(fromAppStoryboard: .Main)
        vc.text = self.journalList[indexPath.row].journal ?? ""
        vc.time = self.journalList[indexPath.row].time ?? ""
        vc.titleText = self.journalList[indexPath.row].title ?? ""
        self.present(vc, animated: true, completion: nil)
   
    }
}

//MARK: -TABLE VIEW DATASOURCES-
extension TimelineListingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalList.count > 0 ? journalList.count : 1
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if journalList.count > 0 {
               guard let cell = tableView.dequeueCell(withType: JournalCellTableViewCell.self, for: indexPath) as? JournalCellTableViewCell else {
                   fatalError("JournalCellTableViewCell is not initialized...")
               }
               let journal = journalList[indexPath.row]
               cell.titleLbl.text = journal.title
               cell.journalLbl.text = journal.journal
               cell.timeLBl.text = journal.time
               return cell
           }
           
           guard let cell = tableView.dequeueCell(withType: EmptyCellTableViewCell.self, for: indexPath) as? EmptyCellTableViewCell else {
               fatalError("EmptyCellTableViewCell is not initialized...")
           }
           return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            self.journalList.remove(at: indexPath.row)
            DataBaseHelper.shareInstance.deleteJournal(at: indexPath.row)
            self.journalList.count > 0 ? tableView.deleteRows(at: [indexPath], with: .automatic) :  tableView.reloadData()
            
           
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

