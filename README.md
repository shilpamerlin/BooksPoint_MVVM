# iOS - BookPoint App
## An iOS app displays avaialble E-Books user can read and purchase the E-Books using Swift and Xcode 12.5
### Description:
This app is being developed using MVVM architecture pattern. This App contains two modules. First modules(BookList) which shows the lists of E-Books avaialable. Second module(BookDetail) display the detail of each selected book. Then the user have options to read the E-book by logging into Google account or can purchase it.
This project also uses Swift's Codable protocol for parsing the JSON response received from API.The swift class named URLSession used to download data to project from API.the business logic of the application goes into view model while view related logic goes into view.Also this project uses WKWebView object that displays interactive web content, such as for an in-app browser for reading books.
#### Main concepts implemented in this app:
1. MVVM architecture 
2. API calling using URLSession
3. JSON parsing using Codable protocol
4. Impmentation of Tableview and custom tableview cells
5. In-app browser using WKWebView

<img width="352" alt="1" src="https://user-images.githubusercontent.com/30163040/126702874-2befebba-b0ff-471a-b413-ac11acaca93a.png">  <img width="347" alt="2" src="https://user-images.githubusercontent.com/30163040/126702829-b573b658-038b-404b-b73b-e8842bd14e6d.png"><img width="351" alt="124826647-0f741200-df43-11eb-8086-b2b0fffae784" src="https://user-images.githubusercontent.com/30163040/126703906-132cdc52-e1bf-40d7-a2c9-69082d9e68ee.png">
<img width="353" alt="124826656-13079900-df43-11eb-89c9-11497f808b40" src="https://user-images.githubusercontent.com/30163040/126703949-ad10c64d-64c4-4d27-a0c4-cf64c6c655fb.png">
<img width="358" alt="124826664-16028980-df43-11eb-972d-3e52eedb46d5" src="https://user-images.githubusercontent.com/30163040/126703989-6a77a343-8059-416c-a922-ae6b8415cf32.png">



