//
//  dashboardView.swift
//  MyApp
//
//  Created by Hyliard on 29/11/2024.
//

import SwiftUI

struct dashboardView: View {
    var body: some View {
        // Utilizamos NavigationView (compatible con Xcode 14.2)
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Título
                    Text("Dashboard")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    // Tarjetas de información
                    HStack(spacing: 20) {
                        InfoCard(title: "Ventas", value: "$12,000", icon: "cart.fill")
                        InfoCard(title: "Usuarios", value: "3,450", icon: "person.fill")
                    }
                    
                    // Gráfico
                    SalesChart()
                        .frame(height: 200)
                        .padding(.top, 20)
                    
                    // Otra tarjeta de información
                    InfoCard(title: "Ingresos", value: "$5,600", icon: "dollarsign.circle.fill")
                    
                    // Botón de acción
                    Button(action: {
                        print("Acción ejecutada")
                    }) {
                        Text("Ver detalles")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true) // Ocultar la barra de navegación
        }
    }
}

struct InfoCard: View {
    var title: String
    var value: String
    var icon: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(value)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
        }
    }
}

struct SalesChart: View {
    @State private var animateBars = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue.opacity(0.2))
                .cornerRadius(10)
            
            HStack(spacing: 10) {
                BarView(value: animateBars ? 0.5 : 0)
                BarView(value: animateBars ? 0.7 : 0)
                BarView(value: animateBars ? 0.3 : 0)
                BarView(value: animateBars ? 0.9 : 0)
            }
            .padding()
            .onAppear {
                withAnimation(.easeIn(duration: 1)) {
                    animateBars = true
                }
            }
        }
    }
}

struct BarView: View {
    var value: CGFloat
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .fill(Color.blue)
                .frame(width: 30, height: value * 100)
                .cornerRadius(5)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        dashboardView()
    }
}
