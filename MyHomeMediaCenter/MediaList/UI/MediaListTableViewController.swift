//
//  MediaCenterTableViewController.swift
//  MyHomeMediaCenter
//
//  Created by Vitaliy Antonchik on 14.05.2022.
//

import UIKit

protocol MediaListActions: AnyObject {
    func imageTap()
}

class MediaCenterTableViewController: UITableViewController {
    
    let dataProvider: MediaListDataProvider
    
    init(dataProvider: MediaListDataProvider) {
        self.dataProvider = dataProvider
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MediaListTableViewCell.self, forCellReuseIdentifier: "MediaListTableViewCell")
        tableView.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Удалить элемент", style: .plain, target: self, action: #selector(deleteItemDidTap))

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить элемент", style: .plain, target: self, action: #selector(addItemDidTap))
    }
    
    @objc private func deleteItemDidTap() {
        dataProvider.deleteItem()
        tableView.beginUpdates()
        tableView.deleteRows(at: [
            .init(
                row: 0,
                section: dataProvider.mediaItemsCount - 1
            )], with: .left
            )
            tableView.endUpdates()
    }
    
    @objc private func addItemDidTap() {
        // обновляем дату
        dataProvider.addItem()
        // обновляем UI
        tableView.beginUpdates()
        tableView.insertRows(at: [
            .init(
                row: 0,
                section: dataProvider.mediaItemsCount - 1
            )
        ], with: .right
        )
//        tableView.scrollToRow(at: .init(row: dataProvider.mediaCount(forSection: 0) - 1, section: 0), at: .bottom, animated: true)
        tableView.endUpdates()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        dataProvider.mediaItemsCount
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataProvider.mediaCount(forSection: section)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = MediaListHeader()
        view.title = dataProvider.header(forSection: section)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaListTableViewCell", for: indexPath) as? MediaListTableViewCell
        cell?.update(dataModel: dataProvider.getMedia(withIndexPath: indexPath))
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = dataProvider.getMedia(withIndexPath: indexPath)
    }
    
    
}



extension MediaCenterTableViewController: MediaListActions {
    func imageTap() {}
    func headerButtonTap() {
        
        
    }
}


