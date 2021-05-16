//
//  ProfileChangeVC.swift
//  haniProject
//
//  Created by Hani on 2021/05/02.
//

import UIKit

class ProfileChangeVC: UIViewController {
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.image = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        return imageView
    }()
    
    private let nicknameField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 20.0)
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = . white
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
      
        addContentView()
        autoLayout()

    }
    
    private func addContentView(){
        
        view.addSubview(profileStackView)
        profileStackView.addSubview(profileImageView)
        profileStackView.addSubview(nicknameField)
    }

    private func autoLayout(){
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            nicknameField.heightAnchor.constraint(equalToConstant: 50),
            nicknameField.widthAnchor.constraint(equalToConstant: 200),
            profileStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    private func presentPhotoInputActionsheet() {
            let actionSheet = UIAlertController(title: "Attach Photo",
                                                message: "Where would you like to attach a photo from",
                                                preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in

                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                picker.allowsEditing = true
                self?.present(picker, animated: true)

            }))
            actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { [weak self] _ in

                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                picker.allowsEditing = true
                self?.present(picker, animated: true)

            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            present(actionSheet, animated: true)
        }
}


extension ProfileChangeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
/*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let messageId = createMessageId(),
            let conversationId = conversationId,
            let name = self.title,
            let selfSender = selfSender else {
                return
        }

        if let image = info[.editedImage] as? UIImage, let imageData =  image.pngData() {
            let fileName = "photo_message_" + messageId.replacingOccurrences(of: " ", with: "-") + ".png"

            // Upload image
            StorageManager.shared.uploadMessagePhoto(with: imageData, fileName: fileName, completion: { [weak self] result in
                guard let strongSelf = self else {
                    return
                }

                switch result {
                case .success(let urlString):
                    // Ready to send message
                    print("Uploaded Message Photo: \(urlString)")

                    guard let url = URL(string: urlString),
                        let placeholder = UIImage(systemName: "plus") else {
                            return
                    }

                    let media = Media(url: url,
                                      image: nil,
                                      placeholderImage: placeholder,
                                      size: .zero)

                    let message = Message(sender: selfSender,
                                          messageId: messageId,
                                          sentDate: Date(),
                                          kind: .photo(media))

                    DatabaseManager.shared.sendMessage(to: conversationId, otherUserEmail: strongSelf.otherUserEmail, name: name, newMessage: message, completion: { success in

                        if success {
                            print("sent photo message")
                        }
                        else {
                            print("failed to send photo message")
                        }

                    })

                case .failure(let error):
                    print("message photo upload error: \(error)")
                }
            })
        }
        else if let videoUrl = info[.mediaURL] as? URL {
            let fileName = "photo_message_" + messageId.replacingOccurrences(of: " ", with: "-") + ".mov"

            // Upload Video
            StorageManager.shared.uploadMessageVideo(with: videoUrl, fileName: fileName, completion: { [weak self] result in
                guard let strongSelf = self else {
                    return
                }

                switch result {
                case .success(let urlString):
                    // Ready to send message
                    print("Uploaded Message Video: \(urlString)")

                    guard let url = URL(string: urlString),
                        let placeholder = UIImage(systemName: "plus") else {
                            return
                    }

                    let media = Media(url: url,
                                      image: nil,
                                      placeholderImage: placeholder,
                                      size: .zero)

                    let message = Message(sender: selfSender,
                                          messageId: messageId,
                                          sentDate: Date(),
                                          kind: .video(media))

                    DatabaseManager.shared.sendMessage(to: conversationId, otherUserEmail: strongSelf.otherUserEmail, name: name, newMessage: message, completion: { success in

                        if success {
                            print("sent photo message")
                        }
                        else {
                            print("failed to send photo message")
                        }

                    })

                case .failure(let error):
                    print("message photo upload error: \(error)")
                }
            })
        }
    }
*/
}
