# iOS - BookPoint App
## An iOS app to show to read and purchase E-Books in Swift using Xcode 12.5
### Description:
This app is being developed using MVVM architecture pattern. This App contains two modules. First modules(BookList) which shows the lists of E-Books avaialable. Second module(BookDetail) display the detail of each selected book. Then the user have options to read the E-book by logging into Google account or can purchase it.
This project also uses Swift's Codable protocol for parsing the JSON response received from API.The swift class named URLSession used to download data to project from API.the business logic of the application goes into view model while view related logic goes into view.Also this project uses WKWebView object that displays interactive web content, such as for an in-app browser for reading books.
#### Main concepts implemented in this app:
1. MVVM architecture 
2. API calling using URLSession
3. JSON parsing using Codable protocol
4. Impmentation of Tableview and custom tableview cells
5. In-app browser using WKWebView

