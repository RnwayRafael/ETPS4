import SwiftUI

struct ContentView: View {
    enum ImageIdentifier: String, Identifiable {
        case promo, promo1, promo4, promo2

        var id: String { self.rawValue }
    }

    @State private var selectedImage: ImageIdentifier? = nil
    @State private var currentIndex: Int = 0
    @State private var currentFormulario: Formulario? = nil
    @State private var isLoading: Bool = true

    let carouselImages = ["carusel", "carusel2", "carusel3"]

    var body: some View {
        ZStack {
            // Imagen de carga
            if isLoading {
                Image("carga")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .frame(width: 300, height: 300)
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isLoading = false
                        }
                    }
            } else {
                // Contenido principal
                NavigationView {
                    VStack {
                        Spacer()

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                                ForEach([ImageIdentifier.promo, ImageIdentifier.promo1, ImageIdentifier.promo4, ImageIdentifier.promo2], id: \.self) { image in
                                    Button(action: {
                                        selectedImage = image
                                        // Cambiar el formulario actual según la imagen seleccionada
                                        switch image {
                                        case .promo:
                                            currentFormulario = .clicPromo
                                        case .promo1:
                                            currentFormulario = .hotelesEnLaPlaya
                                        case .promo4, .promo2:
                                            // Puedes agregar lógica específica si es necesario
                                            currentFormulario = .hotelesCiudad
                                        }
                                    }) {
                                        Image(image.rawValue)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 165, height: 150)
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.white, lineWidth: 1)
                                            )
                                    }
                                }
                            }
                            .padding()
                        }

                        TabView(selection: $currentIndex) {
                            ForEach(carouselImages.indices, id: \.self) { index in
                                Image(carouselImages[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 200)
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .padding(.vertical, 10)
                        .onAppear {
                            startAutoScroll()
                        }

                        Spacer()

                        // Barra blanca con iconos en la parte inferior
                        HStack {
                            Button(action: {
                                currentFormulario = .vistaHotel
                            }) {
                                Image("montana")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(Color.black)
                            }

                            Spacer()

                            Button(action: {
                                currentFormulario = .hotelesEnLaPlaya
                            }) {
                                Image("playa")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(Color.black)
                            }

                            Spacer()

                            Button(action: {
                                // Puedes agregar lógica específica si es necesario
                                currentFormulario = .hotelesCiudad
                            }) {
                                Image("hotel")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(Color.black)
                            }
                            
                            Spacer()

                            // Botón para abrir el formulario ClicPromo
                            Button(action: {
                                currentFormulario = .clicPromo
                            }) {
                                Image("promo")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                    .foregroundColor(Color.black)
                            }
                        }
                        .frame(height: 50)
                        .background(Color.white)
                        .edgesIgnoringSafeArea(.bottom)
                    }
                    .background(Color.black.ignoresSafeArea())
                    .navigationBarTitle("Shearchsvapp", displayMode: .inline)
                    .sheet(item: $currentFormulario) { formulario in
                        switch formulario {
                        case .vistaHotel:
                            VistaHotel()
                                .navigationBarTitle("Vista Hotel", displayMode: .inline)
                        case .hotelesEnLaPlaya:
                            Hotelesenlaplaya()
                                .navigationBarTitle("Hoteles en la playa", displayMode: .inline)
                        case .hotelesCiudad:
                            HotelesCiudad()
                                .navigationBarTitle("Hoteles en la ciudad", displayMode: .inline)
                        case .clicPromo:
                            ClicPromo()
                                .navigationBarTitle("Clic Promo", displayMode: .inline)
                        }
                    }
                }
            }
        }
    }

    private func startAutoScroll() {
        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % carouselImages.count
        }
        timer.fire()
    }
}

enum Formulario: Identifiable {
    case vistaHotel
    case hotelesEnLaPlaya
    case hotelesCiudad
    case clicPromo

    var id: Int {
        switch self {
        case .vistaHotel:
            return 0
        case .hotelesEnLaPlaya:
            return 1
        case .hotelesCiudad:
            return 2
        case .clicPromo:
            return 3
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VistaHotelContent: View {
    var body: some View {
        Text("Vista Hotel")
    }
}

struct HotelesenlaplayaContent: View {
    var body: some View {
        Text("Hoteles en la playa")
    }
}

struct HotelesCiudadContent: View {
    var body: some View {
        Text("Hoteles en la ciudad")
    }
}

struct ClicPromoContent: View {
    var body: some View {
        Text("Clic Promo")
    }
}

