# AnimeX

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

AnimeX is a social media app designed for anime and manga fans to connect, share their passion, and stay updated on the latest news and trends in the anime world. The app provides a platform for users to create accounts, follow their favorite anime official and fan accounts, and engage with the community through posts, likes, and comments.

### App Evaluation

- **Category:** Social
- **Mobile:** Currently only a mobile application with plans for future expansion
- **Story:** AnimeX allows anime and manga fans to connect, share their interests, and stay informed about the latest happenings in the anime world.
- **Market:** Target audience is people interested in all things anime, such as news for season renewals, groups, etc.
- **Habit:** Intended for daily use
- **Scope:** Narrow, targeting anime & manga fans

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create an account with their email, username, DOB, and password
* User can sign in and store their session/cookie information for a persistent connection
* User can manage their profile by updating username, profile picture, bio, and interests
* User can follow their favorite anime(s) official/fanpage accounts and select notification frequency
* User can receive anime recommendations based on the genres they follow
* User can find popular series to read or watch
* User can make posts

### 2. Screen Archetypes

- [x] **Login Screen**
  * User can login to their account(s)
  * User can sign up for an account
  * User can register
- [x] **Stream**
  * User can scroll through their feed of posts from accounts they follow
  * User can like and comment on posts made by accounts they follow
- [x] **Search**
  * User can search for accounts they would like to follow
- [x] **Creation**
  * Users can create new posts
- [x] **Profile**
  * Users can manage their profiles
- [x] **Settings**
  * Users can decide to change their mode(s)
- [x] **Main Page**
  * User can see the posts
  * User can search for series and accounts
  * User can view series recommendations and popular series

### 3. Navigation

**Tab Navigation** (Tab to Screen)

- [x] Feed Page
- [X] Popular Page
- [x] Post Page 
- [X] Recommendation Page 
- [x] Profile Page 

**Flow Navigation** (Screen to Screen)

- [x] **Login Screen**
  * Leads to **Feed Page** after successful login
- [x] **Sign Up Screen**
  * Leads to **Feed Page** after successful account creation
- [x] **Feed Page**
- [x] **Popular page**
- [x] **Recommendations page** 
- [x] **Profile Page**
- [x] **Post Page**
 * Leads to **Profile Page** after successful post

  
     
1.⁠ ⁠Log in (Zamin)
2.⁠ ⁠Create Account (Zamin)
4.⁠ ⁠Popular (Brenna)
5.⁠ ⁠Anime Recommendations (Alyssa)
6.⁠ ⁠Feed (Michael)
7.⁠ ⁠Post (Michael)
9.⁠ ⁠Profile (Eric)

## Wireframes

![hand sketched wireframe](https://github.com/Remote-Control-Allegators/AnimeX/blob/main/wireframe.jpg)

## Schema 

[Add schema after we finish DB]

### Models

[Add models after we finish DB]

**User**
| Property   | Type   | Description                                    |
|------------|--------|------------------------------------------------|
| username   | String | unique id for the user (default field)         |
| password   | String | user's password for login authentication       |
| email      | String | user's email address                           |
| dateOfBirth| Date   | user's date of birth                           |
| createdAt  | Date   | date when the user account was created         |

**Post**
| Property   | Type     | Description                                    |
|------------|----------|------------------------------------------------|
| objectId   | String   | unique id for the user post (default field)    |
| author     | Pointer to User| post author                              |
| image      | File     | image that user posts                          |
| caption    | String   | image caption by author                        |
| commentsCount| Number | number of comments on the post                 |
| likesCount | Number   | number of likes for the post                   |
| createdAt  | Date     | date when post was created                     |

**Comment**
| Property   | Type     | Description                                    |
|------------|----------|------------------------------------------------|
| objectId   | String   | unique id for the comment (default field)      |
| author     | Pointer to User| comment author                           |
| post       | Pointer to Post| post that the comment refers to           |
| text       | String   | content of the comment                         |
| createdAt  | Date     | date when comment was created                  |

**Follow**
| Property   | Type     | Description                                    |
|------------|----------|------------------------------------------------|
| objectId   | String   | unique id for the follow action (default field)|
| follower   | Pointer to User| user who is following                    |
| followee   | Pointer to User| user being followed                      |
| createdAt  | Date     | date when follow action occurred               |

### Networking

- Login Screen
  - `[POST] /login` - authenticate user and log them in
- Sign Up Screen
  - `[POST] /signup` - create a new user account
- Main Page
  - `[GET] /posts` - get all posts for the user's feed
  - `[GET] /userPosts` - get all the posts the logged-in user has made
  - `[GET] /recommendations` - get anime recommendations for the user
  - `[GET] /popular` - get popular anime series
- Profile Screen
  - `[GET] /user/profile` - get user profile information
  - `[PUT] /user/profile` - update user profile information
- Search Screen
  - `[GET] /search/users` - search for users by username or name
  - `[GET] /search/anime` - search for anime by title or genre
- Creation Screen
  - `[POST] /posts` - create a new post
- Post Details Screen
  - `[GET] /post/:id` - get details of a specific post
  - `[PUT] /post/:id/like` - like a post
  - `[PUT] /post/:id/unlike` - unlike a post
  - `[POST] /post/:id/comment` - add a comment to a post
- Settings Screen
  - `[PUT] /user/settings` - update user settings
