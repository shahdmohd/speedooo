import SwiftUI

struct FavoritesListView: View {
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 32) {
                    VStack(spacing: 8) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 50, height: 4)
                            .background(Color(red: 0.24, green: 0.23, blue: 0.22))
                            .cornerRadius(2.50)
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .frame(maxWidth: .infinity, minHeight: 21, maxHeight: 21)

                    VStack(alignment: .leading, spacing: 32) {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(spacing: 16) {
                                HStack(spacing: 8) {
                                    HStack(spacing: 0) {
                                        // You can add custom icons or images here
                                    }
                                    .padding(EdgeInsets(top: 2.44, leading: 2.01, bottom: 2.43, trailing: 1.97))
                                    .frame(width: 24, height: 24)

                                    Text("Favourite List")
                                        .font(Font.custom("Inter", size: 20))
                                        .lineSpacing(30)
                                        .foregroundColor(Color(red: 0.53, green: 0.12, blue: 0.21))
                                }
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .frame(maxWidth: .infinity)

                                VStack(spacing: 16) {
                                    favoriteItemView(name: "Asmaa Dosuky", account: "Account xxxx7890")
                                    favoriteItemView(name: "Asmaa Dosuky", account: "Account xxxx7890")
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color(red: 0.95, green: 0.91, blue: 0.92))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 1)
                                        .stroke(Color(red: 0.81, green: 0.64, blue: 0.67), lineWidth: 1)
                                )
                            }
                            .frame(maxWidth: .infinity, minHeight: 238, maxHeight: 238)
                        }
                        .frame(maxWidth: .infinity, minHeight: 238, maxHeight: 238)
                    }
                    .frame(maxWidth: .infinity, minHeight: 291, maxHeight: 291)

                    VStack(spacing: 8) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 134, height: 4)
                            .background(Color(red: 0.24, green: 0.23, blue: 0.22))
                            .cornerRadius(2.50)
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .frame(height: 20)
                }
                .padding(EdgeInsets(top: 24, leading: 0, bottom: 8, trailing: 0))
                .frame(width: 375, height: 515)
                .background(.white)
                .cornerRadius(50)
            }
            .frame(width: 375, height: 515)
            .shadow(color: Color(red: 0.42, green: 0.46, blue: 0.53, opacity: 0.10), radius: 20, y: 4)
        }
    }
    
    private func favoriteItemView(name: String, account: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                ZStack {
                    Ellipse()
                        .foregroundColor(.clear)
                        .frame(width: 48, height: 48)
                        .background(Color(red: 0.89, green: 0.89, blue: 0.89))
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(name)
                        .font(Font.custom("Inter", size: 16).weight(.medium))
                        .lineSpacing(24)
                        .foregroundColor(Color(red: 0.14, green: 0.13, blue: 0.12))
                    Text(account)
                        .font(Font.custom("Inter", size: 16))
                        .lineSpacing(24)
                        .foregroundColor(Color(red: 0.54, green: 0.53, blue: 0.53))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
