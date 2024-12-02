import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false  // Variable que controla la navegación
    
    var body: some View {
        NavigationStack {  // Usamos NavigationStack para la navegación
            VStack {
                Image("Gaming Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 40)
                    .shadow(radius: 10)
                
                Text("Iniciar sesión")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Correo electrónico", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Contraseña", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: login) {
                    Text("Iniciar sesión")
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                }
                
                NavigationLink("¿No tienes cuenta? Crear una cuenta", destination: SignUpView())
                    .foregroundColor(.blue)
                    .padding()
                
                Spacer()
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            )
            
            // Usamos NavigationLink solo cuando isLoggedIn sea verdadero
            .background(
                NavigationLink("", destination: dashboardView())
                    .opacity(isLoggedIn ? 1 : 0)  // Solo será visible cuando el usuario esté logueado
                    .disabled(!isLoggedIn)  // Deshabilitamos el enlace si no está logueado
            )
        }
    }
    
    func login() {
        // Lógica de inicio de sesión
        if email == "test@example.com" && password == "password123" {
            isLoggedIn = true
        } else {
            print("Credenciales incorrectas")
        }
    }
}
