//
//  ContentView.swift
//  swift_ui_first_program
//
//  Created by Abhishek Baniya on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var counter: Int = 0;
    @State var userName: String = ""
    @State var userPassword: String = ""
    @State private var loginSuccess: Bool = false
    
    var alertSuccess: Alert {
              Alert(
                  title: Text("Login Success"),
                  message: Text("Your username \(userName) and password \(userPassword)."),
                  dismissButton: .default(Text("OK"))
              )
       }
    
    var body: some View {
            VStack() {
                Text("Login").fontWeight(.heavy).colorScheme(.dark).foregroundColor(.gray).multilineTextAlignment(.center).font(.system(size: 24)).italic().padding(.all).multilineTextAlignment(.leading).frame(width: 380, height: 45, alignment: Alignment.leading)
                TextField("User Name", text: $userName).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.all)
                SecureField("Password", text: $userPassword).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.all)
                Button(action: {
                    self.login()
                }) {
                    Text("SignIn").fontWeight(.bold).colorScheme(.dark).foregroundColor(.red).multilineTextAlignment(.center).font(.system(size: 24)).italic().frame(alignment: Alignment.center).padding(.all).frame(width: 200, height: 45)

                    
                }
                
            }.alert(isPresented: $loginSuccess) {
                alertSuccess
            }

    }
    
    func login() {
        
        if userName.isEmpty || userPassword.isEmpty {
            print("Entered Credentials Cannot be Empty")
            // Perform login logic here
            loginSuccess = false // Replace with actual login logic
            
        } else if userName == "Abhishek" && userPassword == "12345" {
            print("Login Successful")
           
            loginSuccess = true
            
        } else {
            print("Please enter valid credentials")
            // Perform login logic here
            loginSuccess = false // Replace with actual login logic
        }
        
    }
}

#Preview {
    ContentView()
}
