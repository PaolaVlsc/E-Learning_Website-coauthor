# E-Learning Platform 
A platform that provides educational content and resources online. Final uni project for the subject "E-Learning" at Informatics Computer Engineering.

## Table of Contents

- [About](#about)
- [Features](#features)
- [Website Development Tools and Technologies](#website-Development-tools-and-technologies)
- [Installation Guide](#installation-guide)

## About

### Project "E-Learning for greek school grade 5"

The subject of the selected project is the implementation of an "E-learning" website for Mathematics Grade 5 in the chapters: Addition and Subtraction, Multiplication in natural numbers, Divisibility criteria, and Division in natural numbers.

## Features

### Feature 1: Create Account and Log In/Out Session

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/ed840eb4-2bee-4a27-bbf2-4d36af19d999" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/22353fcf-bff2-4cd5-84ce-993a1b94f0bb" width="50%">
</div>

### Feature 2: Maths Chapters to Study

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/184eb1d8-187a-46ab-bdf2-444c9bded19d" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/5932aa5b-21fe-4790-b47a-53552642451d" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/4f14421d-3f49-4020-8b88-c2cbb9b37a2c" width="50%">
</div>

### Feature 3: Quiz Tests to Challenge Your Knowledge

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/25de3f2b-d89c-4e2d-be0c-4842cee77bfc" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/e2f0d1ee-3e89-4cc4-9362-a26e9d4fe1bd" width="50%">
</div>

### Feature 4: Statistics

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/3dd16dcd-f4ee-4f9d-b3bd-24ea93f9a5be" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/3125c60a-2314-45e5-962c-c2727e7d2e1c" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/131f913f-81fc-4a90-a4e8-a52c6c53f057" width="50%">
</div>

### Feature 5: Games

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_WebsitePlatform/assets/87998374/c19e6a3f-d3db-47be-9b1e-bd7774813a7f" width="50%">
</div>


## Website Development Tools and Technologies


### Development Tools

- **App**: Web Application
- **IDE**: IntelliJ JetBrains 2021.3.2
- **Application Server**: Glassfish 6.2.5
- **JDK**: 17 Open Oracle
- **Version**: Jakarta EE 9
- **GitHub Repository**: [ProjectEL](https://github.com/YourGitHubUsername/ProjectEL)
- **Database**: MariaDB 2.7.0

### Technologies Used

#### Front End

- HTML5
- CSS
- JavaScript

#### Back End

- MySQL
- phpMyAdmin
- Java Servlet

## Installation Guide

### Prerequisites

Before you get started with this project, please make sure you have the following prerequisites in place:

- **Web Development Tools**:
  - [Glassfish](https://javaee.github.io/glassfish/) (Version 6.2.5) as your application server.
  - [MariaDB](https://mariadb.org/) (Version 2.7.0) for the database. "ProjectEL.sql" is provided in the project. Make sure to import it on your database.

Make sure to install and configure these tools and technologies properly before proceeding with the project.

### Installation

- Clone this repository to your local development environment using `git clone`.

#### Step 1: Open your project in IntelliJ app
<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/8c3ba5fb-76c9-4aa1-a44e-68e26af8e981" width="50%">
</div>

#### Step 2: Configure Server in IntelliJ
- Add Configuration

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/e94f6226-a01f-4407-afd2-263e10c8f9bf" width="50%">
</div>

- Add new -> GlassFish Server -> Local

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/e8ead970-b40d-401f-a09c-e1dbf99ca062" width="50%">
</div>

- Configure and choose the folder glassfish

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/93781eca-72e6-4a8b-abce-708204cdc13a" width="50%">
</div>

- Set Server Domain: domain1

- To fix the problem, click on "Fix" and then "ProjectEL: war exploded"

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/13439423-d164-431e-9bba-a6914e014a26" width="50%">
</div>

#### Step 3: Configure database in IntelliJ
- file>project structure>libraries

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/1cc211be-4eec-459c-aef6-010936e469a0" width="50%">
</div>

- choose org.mariadb.jdbc:mariadb-java-client:2.7.0 and download

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/085c8e63-7510-498c-b503-02c44265871f" width="50%">
</div>

- go to "artifacts" and select the project name: "war exploded" and check if, on the right, under the "available elements," there is MariaDB. If it doesn't exist, the process ends. If it does exist, then right-click on it and choose "put into /WEB-IN."

<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/c0caec0b-dcbf-4618-b7f4-ba33085df83c" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/1397a746-f23b-487b-9c6a-ee69d47c45a8" width="50%">
</div>

#### Step 4: Run the project
<div align="center">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/79032f4f-aee9-47c1-b2e3-729127514b6d" width="50%">
  <img src="https://github.com/PaolaVlsc/E-Learning_Website-coauthor/assets/87998374/51075a7e-3761-4501-b844-af43230bcf2d" width="75%">
</div>

