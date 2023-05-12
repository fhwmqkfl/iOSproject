//
//  DetailViewController.swift
//  MemberList
//
//  Created by coco on 2023/05/11.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var member: Member?
    
    weak var delegate: MemberDelegate? // 강한참조순환을 막기위해 설정
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtonAction()
        detailView.member = member
        setupTapGestures()
    }
    
    // 뷰는 버튼 클릭시 액션을 정의하지 못함, 그래서 뷰컨에서 정의
    // 뷰에 있는 버튼의 타겟 설정
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    // 제스처 설정 (이미지 뷰가 눌리면, 실행)
    func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageVIew))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true
    }
    @objc func touchUpImageVIew() {
        print("이미지뷰 터치")
        
        // 기본 설정 셋팅
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
        
        // 기본설정을 가지고, 피커뷰 컨트롤러 생성
        let picker = PHPickerViewController(configuration: configuration)
        
        // 피커뷰 컨트롤러의 대리자 설정
        picker.delegate = self
        
        // 피커뷰 띄우기
        self.present(picker, animated: true)
    }
    
    @objc func saveButtonTapped() {
        // 전화면으로 돌아가고 & 유저가 입력한 내용이 업데이트 되어야함
        print("button clicked!!")
        
        // [1] 멤버가 없다면 (새로운 멤버를 추가하는 화면) -> 지금 당장
        if member == nil {
            // 입력이 안되어있다면 -> (일반적) 빈문자열로 저장
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            // 새로운 멤버 구조체 생성
            var newMember = Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            // 1) 델리게이트 방식이 아닌 구현 ⭐️
//            let index = navigationController!.viewControllers.count - 2
//            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해 멤버를 추가
//            vc.memberListManager.makeNewMember(newMember)
            
            // 2) 델리게이트 방식으로 구현 ⭐️
            delegate?.addNewMember(newMember)
            print("함수 실행끝")
         
        // [2] 멤버가 있다면( 멤버의 내용을 업데이트 하기 위한 설정)
        } else {
            // 이미지 뷰에 있는 것을 그대로 다시 멤버에 저장
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달(뷰컨트롤러 ==> 뷰)
            detailView.member = member
            
            // 2) 델리게이트 방식으로 구현 ⭐️
            delegate?.update(index: memberId, member!)
        }
        
        // (모든 일이 끝난뒤) 전 화면으로 돌아가
        self.navigationController?.popViewController(animated: true)
 
    }
}

extension DetailViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지 뷰에 표시
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 못불러움!!!!!")
        }
    }
    
    
}
