import SwiftUI

struct Hotelesenlaplaya: View {
    @State private var isExpandedHotel1 = false
    @State private var isExpandedHotel2 = false
    @State private var currentIndex: Int = 0
    private let carouselImages = ["bocaolas1", "bocaolas2", "bocaolas3", "bocaolas4"]

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
                                    Text("Hotel Boca Olas")
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
                    Text("Boca Olas Resort Villas Este hotel de 4 estrellas cuenta con conexión WiFi gratuita, restaurante y bar. El alojamiento cuenta con servicio de habitaciones, servicio de conserjería y organización de excursiones para los huéspedes..")
                        .foregroundColor(.purple)
                        .padding()

                    HStack {
                        // Botones adicionales
                        Button(action: {
                            if let url = URL(string: "https://www.booking.com/hotel/sv/boca-olas-resort-villas.en-gb.html?aid=2378099&label=hg-default%3ACjwKCAiAvdCrBhBREiwAX6-6Ugdizc_bSiOPzAH_FTqlfjGl58MGjOfY_K69b8DXX2PgMCEVS1AovxoC6NQQAvD_BwE&sid=3687884713a690c2e7d5e744f1b0efcc&all_sr_blocks=135042517_203719105_2_1_0;checkin=2023-12-16;checkout=2023-12-17;dest_id=-1146283;dest_type=city;dist=0;group_adults=2;group_children=0;hapos=1;highlighted_blocks=135042517_203719105_2_1_0;hpos=1;matching_block_id=135042517_203719105_2_1_0;no_rooms=1;req_adults=2;req_children=0;room1=A%2CA;sb_price_type=total;sr_order=popularity;sr_pri_blocks=135042517_203719105_2_1_0__18172;srepoch=1702165307;srpvid=f462a698318d0163;type=total;ucfs=1&#hotelTmpl") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            } else {
                                print("La URL no es válida")
                            }
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
                            // Abrir Apple Maps con las coordenadas especificadas
                            if let url = URL(string: "http://maps.apple.com/?ll=13.493886307896265,-89.38013433432334") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            } else {
                                print("La URL no es válida")
                            }
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
                        Image("farallon")
                            .resizable()
                            .aspectRatio(contentMode: isExpandedHotel2 ? .fill : .fit)
                            .frame(maxHeight: isExpandedHotel2 ? .infinity : 200)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )

                        HStack {
                            Text("Hotel Los Farallones")
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
                    Text("El Hotel Los Farallones, situado frente a la playa en una playa privada de La Libertad, ofrece jardines tropicales, una piscina infinita privada y un solárium con hamacas y vistas al mar.")
                        .foregroundColor(.purple)
                        .padding()

                    HStack {
                        // Botones adicionales
                        Button(action: {
                            if let url = URL(string: "https://www.booking.com/hotel/sv/los-farallones.en-gb.html?aid=2378099&label=hg-default%3ACjwKCAiAvdCrBhBREiwAX6-6Ugdizc_bSiOPzAH_FTqlfjGl58MGjOfY_K69b8DXX2PgMCEVS1AovxoC6NQQAvD_BwE&sid=3687884713a690c2e7d5e744f1b0efcc&all_sr_blocks=38153401_380565166_2_0_0&checkin=2023-12-16&checkout=2023-12-17&dest_id=-1146283&dest_type=city&dist=0&group_adults=2&group_children=0&hapos=2&highlighted_blocks=38153401_380565166_2_0_0&hpos=2&matching_block_id=38153401_380565166_2_0_0&no_rooms=1&req_adults=2&req_children=0&room1=A%2CA&sb_price_type=total&sr_order=popularity&sr_pri_blocks=38153401_380565166_2_0_0__24640&srepoch=1702165917&srpvid=f462a698318d0163&type=total&ucfs=1&activeTab=main") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            } else {
                                print("La URL no es válida")
                            }
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
                            // Abrir Apple Maps con las coordenadas especificadas
                            if let url = URL(string: "http://maps.apple.com/?ll=13.492326988958313,-89.37548911094288") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            } else {
                                print("La URL no es válida")
                            }
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

struct hotelesenlaplaya_Previews: PreviewProvider {
    static var previews: some View {
        VistaHotel()
    }
}
