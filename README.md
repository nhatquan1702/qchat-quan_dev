# QChat - Flutter App

## I. Introduction
QChat App for Android and iOS, a mobile application that connects people together, real
time chat, media chat, call (Provider, Riverpod, FireBase, animation, dark-light theme)

## II. Directory Structure
```
lib
│
├── constant
│   ├── color.dart
│   ├── strings.dart
│   ├── text_style.dart
│   ├── fake_data.dart
│   └── theme.dart
├── data
│   ├── model
│   └── repository
├── route
├── view
│   ├── component
│   └── screen
└── main.dart

```

## III. Screenshoot
#### 3.1. Loading
###### 3.1.1. Loading Light Screen
```
![Screenshot_2023-02-04-14-36-17-89_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216758441-18258b7b-f7d0-4b87-81c7-111e46456627.jpg)
```

###### 3.1.2. Loading Dark Screen
![Screenshot_2023-02-04-14-36-41-22_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216758448-7db39360-5d3b-4ff1-b509-d880637387a7.jpg)

#### 3.2. Login and Register

###### 3.2.1. Login Screen
![Screenshot_2023-02-04-15-04-50-03_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759632-5bbb24d5-7e58-4f3f-9237-7007164d182b.jpg)
![Screenshot_2023-02-04-15-05-20-59_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759638-70def8b5-2ffd-4ed7-b3b6-aaa790d5f525.jpg)

###### 3.2.2. Register Screen
![Screenshot_2023-02-04-15-02-14-40_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759684-19132dd4-6b97-4401-b5a4-f56e5684392f.jpg)

###### 3.2.3. Verifi number phone Screen
![Screenshot_2023-02-04-15-02-43-89_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759719-b2563dc3-983b-4ab3-99c7-646f34e8a3a2.jpg)

###### 3.2.3. Update infomation Screen
![Screenshot_2023-02-04-15-03-00-79_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759754-ae006f85-6002-4201-a115-0f72988638d4.jpg)


#### 3.3. Home
###### 3.3.1. Messgage Screen
![Screenshot_2023-02-04-14-36-49-06_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759837-c6897a14-9779-4072-89b1-d8a2b8633ed5.jpg)

###### 3.3.2. Friend Screen
![Screenshot_2023-02-04-14-37-05-28_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759841-6c113ae2-aa3b-44d8-ab2d-6d7aef1ac0c2.jpg)

###### 3.3.3. Contact Screen
![Screenshot_2023-02-04-14-37-12-00_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759876-20ed16f3-0362-4248-999a-1f83f4b52152.jpg)

###### 3.3.4. Account Screen
![Screenshot_2023-02-04-14-37-18-96_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759880-36ada654-5af9-4357-9c7f-7cdae813924f.jpg)

#### 3.4. Chat
###### 3.4.1. Chat Screen
![Screenshot_2023-02-04-14-37-39-75_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759958-8983f664-174b-43ee-9fe6-42b0b4fc99e5.jpg)

###### 3.4.2. Media Chat Screen

|  |  |  |
| :---:  | :---:  | :---:  |
| ![Screenshot_2023-02-04-14-37-50-25_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216759997-871305d9-76fc-4b1c-a386-6c7db305a31d.jpg) | ![Screenshot_2023-02-04-14-38-01-39_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760002-00a1904a-fbb7-44e7-9dcd-c34e839a7ceb.jpg) | ![Screenshot_2023-02-04-14-38-12-30_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760003-c296476a-ef2c-4b1e-b89e-dbf519181a41.jpg) 
| ![Screenshot_2023-02-04-14-38-42-18_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760004-c13020ab-2141-47f9-a930-890d85fff9c4.jpg)

###### 3.4.3. Voice call Screen
![Screenshot_2023-02-04-14-38-50-89_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760029-6c76735b-abf2-483a-858f-bb4ebeea5937.jpg)

###### 3.4.4. Video call Screen
![Screenshot_2023-02-04-14-39-27-10_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760053-2f1dcd45-5c12-421c-a8f1-5c9ef9297722.jpg)

#### 3.5. Profile
###### 3.5.1. Profile Screen
![Screenshot_2023-02-04-14-41-03-51_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760141-d2e462a0-1706-4bea-b4d2-86680acac8f7.jpg)

###### 3.5.2. Edit profile Screen
|  |  |  |
| :---:  | :---:  | :---:  |
|![Screenshot_2023-02-04-14-41-09-02_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760146-93c86027-319e-47d1-bc00-ce1374faafed.jpg)|![Screenshot_2023-02-04-14-41-13-11_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760148-0d85d493-22ed-411a-9dd5-0f5f6fde6c6a.jpg)|![Screenshot_2023-02-04-16-40-41-87_8c918bf06c4e14a3c6d2957a72894835](https://user-images.githubusercontent.com/64344509/216760397-a01e7b79-9959-4591-91fb-dc6ce59ffd5b.jpg)|


## IV. Plugins
  - auto_route
  - flutter_keyboard_visibility
  - provider
  - intl_phone_number_input
  - animate_do
  - flutter_verification_code
  - firebase_auth
  - firebase_core
  - cloud_firestore
  - firebase_storage
  - flutter_riverpod
  - shared_preferences
  - pinput
  - image_picker
  - photo_view
  - avatar_glow
  - awesome_snackbar_content
  - simple_animations
  - flutter_contacts
  - uuid
  - flutter_sound
  - path_provider
  - swipe_to
  - giphy_picker
  - enough_giphy_flutter
  - audioplayers
  - cached_network_image
  - cached_video_player
  - agora_uikit


## Support
- If you wanna get updates in next version, please give me a ⭐ to the repo.
- If you love my work and want to support, (https://www.facebook.com/nhatquan99). Thank you so much.
