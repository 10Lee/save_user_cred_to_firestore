# save_user_cred_to_firestore

Dependencies : 
- Getx
- Firebase auth, firebase storage, firebase firestore
- Image Picker


## What this app do?
- When user sign in using email and password, his email and password data is save in firebaseAuth, then data such as username, photo, bio and UID directly saved to firestore and the photo to firebase storage
- after sign in, the codes will automaticaly create 'users' collection if there is no any 'users' collection before, and add a document with UID that gets from firebaseAuth
- When user get authenticated either through sign up or login, we then bring to the home screen that show the username or email of that authenticated user use from sign in
- This simple authentication app run as Responsive for the web, so we have web view also besides mobile
- All things were done in GetX way
