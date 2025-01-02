import Foundation

class Api1 {
    
    var rockets1: [WelcomeElement1] = []
    
    public func getData(completion: @escaping ([WelcomeElement1]) -> Void) {
        let session = URLSession.shared

        guard let url = URL(string: "https://api.spacexdata.com/v4/launches") else { return }

        session.dataTask(with: url) { data, response, error in
            if error == nil, let parsData = data {
                let decoder = JSONDecoder()
                do {
                    let decodeData = try decoder.decode([WelcomeElement1].self, from: parsData)

                    // Передаем данные через completion
                    DispatchQueue.main.async {
                        self.rockets1 = decodeData
                        completion(decodeData) // Возвращаем данные
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
