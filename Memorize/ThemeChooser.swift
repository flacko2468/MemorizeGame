//
//  EmojiArtDocumentChooser.swift
//  EmojiArt
//
//  Created by CS193p Instructor on 5/6/20.
//  Copyright © 2020 Stanford University. All rights reserved.
//

import SwiftUI

struct ThemeChooser: View {
    
//    @ObservedObject var store: ThemeStore
//
//    @State private var editMode: EditMode = .inactive
//    @State private var showThemeEditor = false
//    //@Binding var chosenTheme: EmojiMemoryGame.Theme
//    @Binding var themes: [EmojiMemoryGame.Theme]
    
    // EADC
    //@EnvironmentObject var store: EmojiArtDocumentStore
    @EnvironmentObject var store: ThemeStore
    
    @State private var editMode: EditMode = .inactive
    @State private var showThemeEditor = false
    @State var chosenTheme: Theme? = nil
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) { theme in
                    NavigationLink(destination: EmojiMemoryGameView(theme: theme)
                                    .navigationBarTitle(theme.name)
                    )
                    {
                        HStack {
                            HStack {
                                if editMode.isEditing {
                                        
                                        Image(systemName: "square.and.pencil").imageScale(.large)
                                            .foregroundColor(Color(theme.color))
                                            .onTapGesture {
                                                self.chosenTheme = theme
                                                self.showThemeEditor = true
                                                print(theme.name)
                                            }
                                }
                            }
                            
                            VStack(alignment: HorizontalAlignment.leading) {
                                Text("\(theme.name)")
                                    .foregroundColor(Color(theme.color))
                                    .font(Font.system(size: 30))
                                    //.frame(alignment: Alignment.leading)
                                if !(theme.emojis.count == 0) {
                                    Text("\(theme.numberOfPairs) pairs from \(theme.emojis.joined(separator: " "))")
                                        .lineLimit(1)
                                }
                                else {
                                    Text("Press edit to add emojis")
                                }
                            }
                            // TODO: - Text not moving smoothly upon edit button being pressed
                        }
                    }
//                    {
//                        EditableText(theme.emojis.joined(separator:"") , isEditing: self.editMode.isEditing) { name in
//                            self.store.themes[self.store.themes.firstIndex(matching: theme)!].emojis = name.components(separatedBy: "")
//                        }
//                    }
                    // TODO: - This is where we customize how we show themes (add more to the list)
                }
                // TODO: - Need to remember which themes were deleted upon reopening of app
                .onDelete { indexSet in
                    indexSet.map { self.store.themes[$0] }.forEach { theme in
                        self.store.themes.remove(at: self.store.themes.firstIndex(matching: theme)!)
                    }
                }
            }
            .navigationBarTitle("Themes")
            .navigationBarItems(
                leading: Button(action: {
                    self.store.themes.append(Theme(name: "Untitled", emojis: [], color: UIColor.black.rgb))
                }, label: {
                    Image(systemName: "plus").imageScale(.large)
                }),
                trailing: EditButton()
            )
            .environment(\.editMode, $editMode)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showThemeEditor) {
            ThemeEditor(isShowing: self.$showThemeEditor)
                .environmentObject(chosenTheme!)
                .frame(minWidth: 300, minHeight: 500)
        }
//        .onAppear {
//            self.themes = self.store.themes
//        }
    }

}

//struct EmojiArtDocumentChooser_Previews: PreviewProvider {
//    static var previews: some View {
//        ThemeChooser()
//    }
//}
