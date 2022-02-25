//
//  AddListData.swift
//  recipe_book
//
//  Created by Brady Robshaw on 2/24/22.
//

import SwiftUI

struct AddListData: View {
    
    @Binding var list: [String]
    var title: String
    var placeHolderText: String
    @State private var item: String = ""
    
    var body: some View {
        
        VStack (alignment: .leading){
            HStack {
                Text("\(title): ")
                    .bold()
                TextField("\(placeHolderText)", text: $item)
                
                Button {
                    if item.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        list.append(item.trimmingCharacters(in: .whitespacesAndNewlines))
                        item = ""
                    }
                } label: {
                    Text("Add")
                }
            }
            
            ForEach(list, id: \.self) { item in
                Text(item)
            }
        }
    }
}

//struct AddListData_Previews: PreviewProvider {
//    static var previews: some View {
//        AddListData()
//    }
//}
