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

- [ ] User can create an account with their email, username, DOB, and password
- [X] User can sign in and store their session/cookie information for a persistent connection
- [ ] User can manage their profile by updating username, profile picture, bio, and interests
- [ ] User can follow their favorite anime(s) official/fanpage accounts and select notification frequency
- [ ] User can receive anime recommendations based on the genres they follow
- [ ] User can find popular series to read or watch
- [ ] User can make posts

### 2. Screen Archetypes

- [ ] **Login Screen**
  * User can login to their account(s)
  * User can sign up for an account
  * User can register
- [ ] **Stream**
  * User can scroll through their feed of posts from accounts they follow
  * User can like and comment on posts made by accounts they follow
- [ ] **Search**
  * User can search for accounts they would like to follow
- [ ] **Creation**
  * Users can create new posts
- [ ] **Profile**
  * Users can manage their profiles
- [ ] **Settings**
  * Users can decide to change their mode(s)
- [ ] **Main Page**
  * User can see the posts
  * User can search for series and accounts
  * User can view series recommendations and popular series

### 3. Navigation

**Tab Navigation** (Tab to Screen)

- [ ] Feed Page
- [ ] Popular Page
- [ ] Post Page 
- [ ] Recommendation Page 
- [ ] Profile Page 

**Flow Navigation** (Screen to Screen)

- [ ] **Login Screen**
  * Leads to **Feed Page** after successful login
- [ ] **Sign Up Screen**
  * Leads to **Feed Page** after successful account creation
- [ ] **Feed Page**
- [ ] **Popular page**
- [ ] **Recommendations page** 
- [ ] **Profile Page**
- [ ] **Post Page**
  * Leads to **Profile Page** after successful post

## Wireframes

![hand sketched wireframe](https://github.com/Remote-Control-Allegators/AnimeX/blob/main/wireframe.jpg)

## Schema 

[Add schema after we finish DB]

### Models

**User**
| Property   | Type   | Description                                      |
|------------|--------|--------------------------------------------------|
| id         | number | user_id                                          |
| username   | String | unique id for the user (default field)           |
| password   | String | user's password for login authentication         |
| email      | String | user's email address                             |
| createdAt  | Date   | date when the user account was created           |

**Post**
| Property   | Type     | Description                                    |
|------------|----------|------------------------------------------------|
| id         | number   | unique id for the user post (default field)    |
| user_id    | Number|fk| foreign key to user that made post             |
| image      | File     | image that user posts                          |
| caption    | String   | image caption by author                        |
| likesCount | Number   | number of likes for the post                   |
| createdAt  | Date     | date when post was created                     |

**Comment**
| Property   | Type     | Description                                    |
|------------|----------|------------------------------------------------|
| id         | number   | unique id for the comment (default field)      |
| user_id    | Number|fk| comment author                                 |
| post_id    | Number|fk| foreign key to post                            |
| text       | String   | content of the comment                         |
| createdAt  | Date     | date when comment was created                  |

**Follow**
| Property           | Type      | Description                           |
|--------------------|-----------|---------------------------------------|
| id                 | number    | follow_id                             |
| follower_user_id   | number|fk | user who is following                 |
| followed_user_id   | number|fk | user being followed                   |
| createdAt          | Date      | date when follow action occurred      |

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
