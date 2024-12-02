//
//  SingUpView.swift
//  MyApp
//
//  Created by Hyliard on 26/11/2024.
//

import SwiftUI

struct SignUpView: View {
    // Propiedades del estado
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Gaming Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 40)
                    .shadow(radius: 10)
                
                Text("Crear cuenta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 20)
                
                Group {
                    TextField("Correo electrónico", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.bottom, 10)
                    
                    SecureField("Contraseña", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.bottom, 10)
                    
                    SecureField("Confirmar Contraseña", text: $confirmPassword)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.bottom, 20)
                }
                
                Button(action: signUp) {
                    Text("Crear cuenta")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarHidden(true)
        }
    }
    
    // MARK: - Lógica de validación de contraseñas
    private func signUp() {
        // Validación de contraseñas
        if !isPasswordValid(password) {
            alertMessage = "La contraseña debe tener al menos 8 caracteres, incluir una letra mayúscula, un número y un símbolo."
            showAlert = true
            return
        }
        
        if password != confirmPassword {
            alertMessage = "Las contraseñas no coinciden. Intente nuevamente."
            showAlert = true
            return
        }
        
        // Si todo es válido, puedes proceder con el registro
        print("Formulario de registro válido.")
        // Aquí puedes agregar el código para enviar los datos al servidor o hacer lo que sea necesario
    }
    
    // MARK: - Funciones de validación
    private func isPasswordValid(_ password: String) -> Bool {
        // Longitud mínima de 8 caracteres
        let hasValidLength = password.count >= 8
        
        // Al menos una letra mayúscula
        let hasUpperCase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        
        // Al menos un número
        let hasNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        
        // Al menos un símbolo
        let hasSymbol = password.rangeOfCharacter(from: CharacterSet.symbols) != nil
        
        return hasValidLength && hasUpperCase && hasNumber && hasSymbol
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
