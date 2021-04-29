//
//  ThemeEditor.swift
//  Memorize
//
//  Created by Rishi Ganeshan on 27/4/21.
//

import SwiftUI
struct ThemeEditor: View {
    @Binding var theme: Theme
    @Binding var isShowing: Bool
    
    @State private var themeName: String = ""
    @State private var emojisToAdd: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("Theme Editor").font(.headline).padding()
                HStack {
                    Spacer()
                    Button(action: {
                        self.isShowing = false
                    }, label: { Text("Done") }).padding()
                }
            }
            Divider()
            
            
            Form {
                Section {
                    TextField("Theme Name", text: $themeName, onEditingChanged: { began in
                        if !began {
                            self.theme.name = self.themeName
                        }
                    })
                    TextField("Add Emoji", text: $emojisToAdd, onEditingChanged: { began in
                        if !began {
                            print(emojisToAdd.map( { String($0) }))
                            self.theme.emojis += emojisToAdd.map( { String($0) })
                            //self.theme.emojis.append(contentsOf: emojisToAdd.components(separatedBy: ""))
                            self.emojisToAdd = ""
                        }
                    })
                }
                Section(header: Text("Remove Emoji")) {
                    Grid(self.theme.emojis, id: \.self) { emoji in
                        Text(emoji).font(Font.system(size: self.fontSize))
                            .onTapGesture {
                                self.theme.emojis.remove(at: theme.emojis.firstIndex(of: emoji)!)
                        }
                    }
                    .frame(height: self.height)
                }
            }
        }
        .onAppear {
            print(theme)
            self.themeName = theme.name }
    }
    
    // MARK: - Drawing Constants
    
    var height: CGFloat {
        CGFloat((theme.emojis.count - 1) / 6) * 70 + 70
    }
    let fontSize: CGFloat = 40
}

