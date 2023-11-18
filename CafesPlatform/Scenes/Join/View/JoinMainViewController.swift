//
//  JoinMainViewController.swift
//  CafesPlatform
//
//  Created by Jiaxin Pu on 2023/11/17.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Common
import ProgressHUD

final class JoinMainViewController: BaseViewController {
    private let viewModel: JoinMainViewModel
    
    private lazy var applyJoinButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        button.setTitle("  申请加盟  ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private var bags = DisposeBag()
    
    init(viewModel: JoinMainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "加盟平台"
        
        setupViews()
        setupBindings()
    }
    
    private func setupViews() {
        view.addSubview(applyJoinButton)
        applyJoinButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        let applyJoinButtonDidClick = applyJoinButton.rx
            .tap
            .do(onNext: { _ in
                ProgressHUD.animate("loading")
            })
            .asDriver(onErrorJustReturn: ())
        let output = viewModel.transform(input: .init(join: applyJoinButtonDidClick))
        output.joinResult.drive {[weak self] result in
            switch result {
            case .success(_):
                ProgressHUD.succeed("加盟成功！！！")
                self?.showNaviRightItem()
            case .failure(let error):
                ProgressHUD.dismiss()
                self?.showErrorAlert(error.localizedDescription)
            }
        }.disposed(by: bags)
    }
    
    private func showNaviRightItem() {
        navigationItem.rightBarButtonItem = .init(title: "加盟详情", style: .plain, target: self, action: #selector(showJoinDetail))
    }
    
    @objc
    private func showJoinDetail() {
        viewModel.showJoinDetail()
    }
    
    private func showErrorAlert(_ message: String?) {
        let alert = UIAlertController(title: "接口报错", message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "ok", style: .cancel))
        present(alert, animated: true)
    }
}
