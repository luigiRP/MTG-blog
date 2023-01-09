# MTG-blog
An app to check the MTG cards from an API


https://user-images.githubusercontent.com/54480504/211408295-4799b2b2-9f60-4aa9-adf4-8bcbb0b1909c.mp4

https://user-images.githubusercontent.com/54480504/211408333-5a768e17-3fbc-4dfd-b1af-0598197d263d.mp4

https://user-images.githubusercontent.com/54480504/211409117-599b191c-cb82-44bc-9df9-f55edd401013.mp4


## App Overview
The user starts with a form where they have to put their name, surname, email, and datte. All of these fields are necesarry, so the user will get a verification error if he tries to go to the other page without inputting those fields first. Aditionally, the user must use a correct email format. If the user doesn't change the date, it will have by default the current date time.

Once completed this form and the button is pressed to go to the next page, the app will show a circular progress indicator and then the page where they will see the first page of the API request in the form of a card list, each with their respective name, type and image. If the ImageUrl is null, it will show the MTG Logo. The user can either go back (either by pressing the back arrow on the app bar or with the back button on their phone) to the form, where they will se the fields already filled with the information posted previously. If the user decides to click on a card tile, it will take them to the next page.

This next page will show a more detailed view of the card: The name, type, image and the description of it. Just as before, they can go back where they will load the cards again in case anything has changed in the API.

If at any time, the API returns an error, it will display an error message with a button that will take the user to the first form. This app is localized, meaning the user can change between spanish and english and it will update on the app automatically, without the need to restart the app. 

This app works on both Android and on IOS.

## Tools Used

* Bloc: This was used mostly for the "routing" of the app, error handling and to preserve the user information if they want to, at any point, return to the form. While I understand that this could've been done with simple routing, I wanted to show to my Bloc skills.
* Intl: This package was used to make internationalizations on the app, allowing the user to switch between english and spanish dynamically.
* Http: to make the api requests.
* Data Model: When the cards are recieved, they are transformed from their JSON objects to a unique object. This can be seen in the "models" folder.
* Theme and Text Styles: I added my own theme for the app to give it colors that are more adequate for Magic The Gathering, and also some text styles I can reuse. All on their respective files.
* Git: You can see this repository and check all the commits and branches I've worked on, this will remain a public repository.

### Things to do

These are things that could be added, they weren't made so I don't take too long giving a basic version of the app.

* Landscape Mode
* Testing
* Pagination
* Cache Images
* Cache Webservices
* More error handling for the different types of status codes.
* I've noticed that a lot of the cards are repeated without their ImageURL, there should be a feature that doesnt add cards to the list if they are repeated.
* A better solution for the HTTP Images.
