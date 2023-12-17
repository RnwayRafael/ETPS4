import SwiftUI

struct ClicPromo: View {
    let promoImages = ["promo", "promo1", "promo2", "promo3", "promo4"]
    @State private var currentIndex: Int = 0

    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(promoImages.indices, id: \.self) { index in
                    Image(promoImages[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .padding(.vertical, 10)

            Spacer()

           
        }
        .padding()
    }
}
