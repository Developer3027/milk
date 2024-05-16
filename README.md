# MILK README

Welcome to MILK. This project includes several different project woven into one. Many of these are built to various extent using tech like React, NextJs, Node, Express, NestJs, MongoDb, PostgresQl. I used ORM like Prisma and TypeOrm. I used AWS, Azure, and FireBase. I have used Vercel, Netlify, Render, and Heroku. I have enjoyed playing with all of them, but nothing compares to the ease of use and joy I have using Rails and the Ruby language.

This project is still very fluid as redesigns happen daily for the design, layout, feel, and functionality . It was started toward the beginning of April, end of March, 2024. The start of 2024 had me diving into Ruby. Once I had a handle on that I moved to Rails and this project. Wrapping all my favorite past projects from the past years into one is a dream and a challenge.

MILK will have many sections, all should have the feel of separate sites and will have different functionality. Listed below is the technical info for the build and further down is info on the different sections. The current goal is to have at least the landings and aux sections complete by May 21, 2024.

This project will be free to review. It will encourage donations like code academy. So there will be:
* User - is not logged in. Visitor to site, general public.
* Member - holds account, can log in, has profile, can comment or create.
* Admin - has access to functionality of site CRUD actions.

Things you may want to know:

* Ruby version
    3.1.4
* Rails version
    7.1.3
* System dependencies

* Configuration - This app uses Figaro to handle env variables. You will find an example application.test.yml file in the config folder. Copy the contents and create a new application.yml file. Paste in the contents and change the username and password. Ensure the postgresql user has auth to create database.
[Learn more](https://rubyhero.dev/environment-variables#heading-figaro)

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

This is a bit confusing. I used the User model when I started this project and is handled through Devise. It should be noted that in this project, a user has general access to the app and does not need to be logged in. A member has a greater level of access to the app and can do things like write articles and comment on things. In the code, a member is called a user and a user is not referred to because they have no auth cred's. Sorry for that confusion. Just remember, a user is a member. User = no auth / Member = auth / Admin = total access.

### User
Different parts of the app will need different information from the member. A member will have a profile page and different parts of the app may require different information from the member. In the profile a member can set an avatar, have a short bio, provide social links and update auth cred's or delete the account.

### Admin
The admin section of this site should be able to deal with adding content to any part of it. Every section of the site has different functionality and the admin should be able to manage any part of it. Admin can only be added via the console.

Admin for blog:
* Create, Edit, Update or Delete a blog, whether or not they are the owner. 
* Manage and perform CRUD actions on comments for articles.
* Manage and perform CRUD actions on tags and categories.
* Show total number of articles
* Show total number of likes
* Top 5 articles
* Recent comments

## Blog

_Resources_

_org design_ : [dribble](https://dribbble.com/shots/21694155-Blog-home-page-Untitled-UI)

The blog has several purposes. 
* General purpose - this is where I can write articles for what ever suits my purpose, be them opinions or to help learn a subject. If I see a movie and want to give some thoughts or I need to get a hold on Javascript, I have this blog.
* Erudition Articles - Articles that have been written to better understand a subject with tech, will be used within Erudition.

Blog needs:
* Author - user name - include short description or bio for author
* Date Time: May 21, 2023 AM EDT with rail ago: 6 hours ago
* Category - List of categories ideas:
    * Tech
    * Cooking
    * Erudition
* Schedule system for articles
* Sort articles by category
* Tags - article may have many tags. Tag would be sub-categories? For example: Language would be category with Ruby, Javascript, Typescript tags.
* Cover Image - Main image for article
* Title - title of article
* Content - main section of article
    * Rich Text editor
    * Ability to include images, links, quotes, code snippets, etc
* Navigation at the bottom of article
* Recommended articles to read at bottom of article
* View counter for articles
* Rating system for articles - thumbs up or stars
* How long to read functionality
* Comment if member.
* Share article on socials

## Erudition

_Resources_

_org code_ : [repo](https://github.com/Developer3027/erudition-saa-c02/tree/master)

_org design_ : [dribble](https://dribbble.com/shots/16547710/attachments/11568724?mode=media)

_org site_ : [vercel](https://erudition-saa-c02.vercel.app/)

Online school/boot camp for users. 

## Hermit+

_Resources_

_live landing_ : [aws s3](https://www.hermitplus.com/)

_character concept_ : [org site](https://www.mason-roberts.dev/hermits)

_org design_ : [Figma](https://www.figma.com/file/1rA5nLglFEz6F1453wKwkG/Hermit-Plus?type=design&mode=design&t=1dy1b6GROUitv0zb-1)

## Salt & Tar

_Resources_

_live landing_ : [org site](https://www.mason-roberts.dev/salt-and-tar)

_org design_ : [Figma](https://www.figma.com/file/dCAzFHKupofhmKft0Anl5L/Salt-and-Tar?type=design&mode=design&t=1dy1b6GROUitv0zb-1)

This site is part of a bigger concept called Swabbie. Swabbie will be a collection of sailing content providers, each with the functionality of this starter. Salt and Tar is my favorite and I have always thought they could use more functionality. This site will also serve the videos content from you tube but will include a music section that includes the music Ruth uses in her videos. It will also have a e-com side where one can purchase the merchandise and products they have used in there set up. I would also like to include a part to purchase overnight stays, day sails, or tours.

## Jukebox

_Resources_

_design_ : [Andre Rio - Dribble](https://dribbble.com/shots/21768063-Filemer-Web-Design)

_landing design_ : [Figma](https://www.figma.com/file/PQJGzDMUfcqfTLCjiYm0So/Dev3027-Portfolio?type=design&node-id=0%3A1&mode=design&t=LPKwLezxe0ZpJdSs-1)

This part of the project is an app concept that allows for the play of one song at a time. Pick the song, play the song. It allows for one to focus on the music they love and listen to the song, feel and hear it. Like for the first time when they smiled, cried, or stopped dead in there tracks.

This part of the project is proving very difficult. I am having issues with the design as well as the functionality. There are so many ways to organize the vast amounts of data for a simple song.

## Car Wash

_Resources_

_design_ : [dribble](https://dribbble.com/shots/18892370--2-TrueDetail)
