import SwiftUI

struct HotelesCiudad: View {
    @State private var isExpanded = false
    @State private var isExpandedHotel2 = false

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                VStack {
                    Image("inter")
                        .resizable()
                        .aspectRatio(contentMode: isExpanded ? .fill : .fit)
                        .frame(maxHeight: isExpanded ? .infinity : 350)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        )

                    HStack {
                        Text("Hotel Intercontinental")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                    }
                }
            }

            if isExpanded {
                Text("Este lujoso hotel de San Salvador está ubicado en el corazón de la zona de entretenimiento y negocios de la ciudad junto al Metrocentro San Salvador, el centro comercial más grande de Centroamérica. Para garantizar su comodidad, todas nuestras habitaciones cuentan con ventanas a prueba de sonido y acceso a internet de alta velocidad. Disfrute de nuestra amplia selección de restaurantes y lounges, manténgase en forma en nuestro gimnasio y relájese en nuestro Spa InterContinental.")
                    .foregroundColor(.purple)
                    .padding()

                HStack {
                    Spacer()
                    Link(destination: URL(string: "https://www.elpital.com.sv")!) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                                .padding(.trailing, 4)
                            Text("Reservar")
                                .foregroundColor(.blue)
                        }
                    }
                    Spacer()

                    Link(destination: URL(string: "http://maps.apple.com/?ll=14.367445765283065,-89.12377597723454")!) {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.blue)
                                .padding(.trailing, 4)
                            Text("Ubicación")
                                .foregroundColor(.blue)
                        }
                    }
                    Spacer()
                }
            }

            Button(action: {
                withAnimation {
                    isExpandedHotel2.toggle()
                }
            }) {
                VStack {
                    Image("barcelo")
                        .resizable()
                        .aspectRatio(contentMode: isExpandedHotel2 ? .fill : .fit)
                        .frame(maxHeight: isExpandedHotel2 ? .infinity : 200)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                        )

                    HStack {
                        Text("Hotel Barcelo")
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
                Text("El Barcelo San Salvador, que cuenta con piscina al aire libre y centro de spa, está situado en la ciudad de San Salvador, en el departamento de San Salvador, a 1,8 km del parque del Bicentenario. El establecimiento dispone de bar Hay aparcamiento privado gratuito.")
                    .foregroundColor(.purple)
                    .padding()

                HStack {
                    // Botones adicionales
                    Button(action: {
                        // Acción para reservar en el Hotel Barcelo
                        print("Reservar en el Hotel Barcelo")
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
                        // Acción para la ubicación del Hotel Barcelo
                        if let url = URL(string: "http://maps.apple.com/?ll=14.123456,-89.123456") {
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
        }
        .padding()
    }
}

struct HotelesCiudad_Previews: PreviewProvider {
    static var previews: some View {
        HotelesCiudad()
    }
}
