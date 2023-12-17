import SwiftUI

struct VistaHotel: View {
    @State private var isExpandedHotel1 = false
    @State private var isExpandedHotel2 = false
    @State private var currentIndex: Int = 0
    private let carouselImages = ["hotelpital", "hotelpital2"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 5) {
                TabView(selection: $currentIndex) {
                    ForEach(carouselImages.indices, id: \.self) { index in
                        Button(action: {
                            withAnimation {
                                isExpandedHotel1.toggle()
                                isExpandedHotel2 = false
                            }
                        }) {
                            VStack {
                                Image(carouselImages[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                                    .padding()
                                HStack {
                                    Text("Hotel Pital Highland")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.purple)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .onAppear {
                    startAutoScroll()
                }

                if isExpandedHotel1 {
                    // Resto del contenido cuando está expandido
                    Text("Está ubicado en la montaña más alta de El Salvador y le espera para atenderlo con lo mejor de su cocina de montaña. Sus habitaciones y cabañas están equipadas con lo necesario para hacerlo sentir cómodo dentro de un ambiente rodeado de bosques y jardines.")
                        .foregroundColor(.purple)
                        .padding()

                    HStack {
                        // Botones adicionales
                        Button(action: {
                            UIApplication.shared.open(URL(string: "https://www.elpital.com.sv")!, options: [:], completionHandler: nil)
                        }) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 4)
                                Text("Reservar")
                                    .foregroundColor(.blue)
                            }
                        }

                        Spacer()

                        Button(action: {
                            UIApplication.shared.open(URL(string: "http://maps.apple.com/?ll=14.367445765283065,-89.12377597723454")!, options: [:], completionHandler: nil)
                        }) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 4)
                                Text("Ubicación")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding()
                }

                // Aquí puedes agregar el resto de tu contenido

                // Segundo botón
                Button(action: {
                    withAnimation {
                        isExpandedHotel2.toggle()
                        isExpandedHotel1 = false
                    }
                }) {
                    VStack {
                        Image("posadaelcielo")
                            .resizable()
                            .aspectRatio(contentMode: isExpandedHotel2 ? .fill : .fit)
                            .frame(maxHeight: isExpandedHotel2 ? .infinity : 200)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )

                        HStack {
                            Text("Hotel Posada el cielo")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .cornerRadius(10)
                        }
                    }
                }

                if isExpandedHotel2 {
                    // Resto del contenido cuando está expandido
                    Text("Hotel Posadas, en Posadas, ofrece alojamiento con restaurante y bar. Este hotel de 3 estrellas ofrece salón de uso común y tiene habitaciones con aire acondicionado, wifi gratis y baño privado..")
                        .foregroundColor(.purple)
                        .padding()

                    HStack {
                        // Botones adicionales
                        Button(action: {
                            UIApplication.shared.open(URL(string: "https://www.tripadvisor.es/Hotel_Review-g982649-d3855619-Reviews-La_Posada_del_Cielo-San_Ignacio_Chalatenango_Department.htm")!, options: [:], completionHandler: nil)
                        }) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 4)
                                Text("Reservar")
                                    .foregroundColor(.blue)
                            }
                        }

                        Spacer()

                        Button(action: {
                            UIApplication.shared.open(URL(string: "http://maps.apple.com/?ll=14.348418477575986,-89.12120803627572")!, options: [:], completionHandler: nil)
                        }) {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 4)
                                Text("Ubicación")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding()
                }

                Spacer()
            }
            .padding()
        }
    }

    private func startAutoScroll() {
        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % carouselImages.count
        }
        timer.fire()
    }
}

struct VistaHotel_Previews: PreviewProvider {
    static var previews: some View {
        VistaHotel()
    }
}

