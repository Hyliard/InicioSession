//
//  SplashViewController.swift
//  MyApp
//
//  Created by Hyliard on 29/11/2024.
//

import Foundation

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configura el fondo de la pantalla (opcional)
        view.backgroundColor = .white

        // Agregar una imagen o logo (opcional)
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.center = view.center
        view.addSubview(logoImageView)

        // Hacer que la pantalla de bienvenida dure unos segundos y luego navegar a la pantalla principal
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // 2 segundos de duración
            self.navigateToMainScreen()
        }
    }

    // Función para navegar a la pantalla principal
    func navigateToMainScreen() {
        // Aquí puedes cambiar el `UIViewController` al que quieres ir después
        let mainViewController = MainViewController() // Cambia a tu ViewController principal
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.modalTransitionStyle = .flipHorizontal // Transición de la pantalla (opcional)
        present(navigationController, animated: true, completion: nil)
    }
}
