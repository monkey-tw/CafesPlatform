//
//  JoinDetailViewController.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/18.
//

import UIKit
import Common
import SnapKit

class JoinDetailViewController: BaseViewController {
    private let viewModel: JoinDetailViewModel
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    init(viewModel: JoinDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "加盟详情"
        
        setupViews()
        refreshUI()
    }
    
    private func setupViews() {
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func refreshUI() {
        var detailInfo = "id: \(viewModel.model.id)"
        detailInfo.append("\ncreatedAt: \(viewModel.model.createdAt)")
        detailInfo.append("\nstatus: \(viewModel.model.status.rawValue)")
        detailLabel.text = detailInfo
    }
}
