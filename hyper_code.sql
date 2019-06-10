-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2019 at 01:56 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hyper_code`
--

-- --------------------------------------------------------

--
-- Table structure for table `achivment`
--

CREATE TABLE `achivment` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `achivment`
--

INSERT INTO `achivment` (`id`, `title`, `description`, `course_id`, `created_at`, `updated_at`) VALUES
(5, 'html certificate', 'this is html certificate', 2, '2019-05-25 21:52:33', '0000-00-00 00:00:00'),
(6, 'css certificate', 'this is css cretificate', 3, '2019-05-25 21:52:33', '0000-00-00 00:00:00'),
(7, 'javascript certificate', 'this is javascript certificate', 4, '2019-05-25 22:58:52', '0000-00-00 00:00:00'),
(8, 'php certificate', 'this is php certificate', 7, '2019-05-25 22:58:52', '0000-00-00 00:00:00'),
(9, 'jquery certificate', 'this is jquery certificate', 6, '2019-05-25 23:17:34', '0000-00-00 00:00:00'),
(10, 'bootstrap certificate', 'this is bootstrap certificate', 5, '2019-05-25 23:49:03', '0000-00-00 00:00:00'),
(11, 'mysql certificate', 'this is mysql certificate', 8, '2019-05-26 00:03:57', '0000-00-00 00:00:00'),
(12, 'laravel certificate', 'this is laravel certificate', 10, '2019-05-26 12:39:52', '0000-00-00 00:00:00'),
(13, 'vuejs certificate', 'this is vuejs certificate', 11, '2019-05-26 13:22:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(2555) NOT NULL,
  `body` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `track_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `body`, `user_id`, `track_id`, `created_at`, `updated_at`) VALUES
(1, 'title title title title', 'titletitletitle titletitletitle titletitletitle titletitletitle titletitletitle titletitletitle titletitletitle titletitletitle', 38, 1, '2019-06-09 08:27:57', '2019-06-09 08:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `attach`
--

CREATE TABLE `attach` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attach`
--

INSERT INTO `attach` (`id`, `name`, `description`, `url`, `created_at`, `updated_at`) VALUES
(3, 'html lesson1', 'this is attachment for html lesson1', 'http://html_lesson1', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(4, 'html lesson2', 'this is attachment for html lesson2', 'http://html_lesson2', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(5, 'html lesson3', 'this is attachment for html lesson3', 'http://html_lesson3', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(6, 'html lesson4', 'this is attachment for html lesson4', 'http://html_lesson4', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(7, 'html lesson5', 'this is attachment for html lesson5', 'http://html_lesson5', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(8, 'html lesson6', 'this is attachment for html lesson6', 'http://html_lesson6', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(9, 'html lesson7', 'this is attachment html lesson7', 'http://html_lesson7', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(10, 'html lesson8', 'this is attachment for html lesson8', 'http://html_lesson8', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(11, 'html lesson9', 'this is attachment for html lesson9', 'http://html_lesson9', '2018-12-15 09:15:50', '0000-00-00 00:00:00'),
(12, 'html lesson10', 'this is attachment for html lesson10', 'http://html_lesson10', '2018-12-15 09:15:50', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `no_lessons` int(11) NOT NULL,
  `level` varchar(255) NOT NULL,
  `sorting` int(11) NOT NULL,
  `course_img` varchar(255) DEFAULT 'pic.png',
  `url_image` text NOT NULL,
  `url_doc` text NOT NULL,
  `exam_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `description`, `no_lessons`, `level`, `sorting`, `course_img`, `url_image`, `url_doc`, `exam_id`, `created_at`, `updated_at`) VALUES
(2, 'html', 'HTML5 is one of the hot web technologies and is widely gaining acceptance across mobile and web. In our course you get a complete resource which can get you started on application development for HTML5. In our course you work on actual examples and go through important concepts required for through knowledge.\r\n\r\nIn our course you will start with basic HTML tags. You will learn how to create HTML websites and use CSS in your work before we start discussing HTML5. We do not assume any prior knowledge so we go through the concepts from the beginner\'s point of view. In our HTML5 lectures we start with new tags and forms. We then gradually move to advance topics like Drag and Drop and Multimedia. We follow it with difficult topics like Geolocation, WebStorage and Application cache. This course creates easy to grasp examples for each of the concepts and by the end of it you will be able to understand the complete picture rather than just bits and pieces of the technology.\r\n\r\nThis is the complete HTML5 course you will need to get you started with HTML5 application development.', 10, 'brginner', 1, 'html', '/image/course/html.png', 'https://www.youtube.com/?gl=EG', 1, '2019-06-02 13:44:27', '2018-10-29 11:34:46'),
(3, 'css', 'CSS - short for Cascading Style Sheets - is a \"programming language\" you use to turn your raw HTML pages into real beautiful websites.\r\n\r\nThis course covers it all - we start at the very basics (What is CSS? How does it work? How do you use it)? and gradually dive in deeper and deeper. And we do this by showing both practical examples as well as the theory behind it.\r\n\r\nGetting started with CSS might look easy but there actually is a lot of depth to CSS - hence this course provides different \"Tracks\" or \"Entry points\" to exactly meet your demands and reflect you current ', 10, 'beginner', 2, 'css', '/image/course/css.png', '', 2, '2019-06-02 13:41:08', '2018-10-31 12:31:07'),
(4, 'javascript', 'This is a truly complete JavaScript course, that goes beyond what other JavaScript courses out there teach you. \r\n\r\nI will take you from a complete JavaScript beginner to an advanced developer. You will not just learn the JavaScript language itself, you will also learn how to program. How to solve problems. How to structure and organize code using common JavaScript patterns.\r\n\r\nCome with me on a journey with the goal of truly understanding the JavaScript language. And I explain everything on the way with great detail!\r\n\r\nYou will learn \"why\" something works in JavaScript, not just \"how\". Because in the modern JavaScript world of today, you need more than just knowing how something works. You need to debug code, you need to understand code, you need to be able to think about code.\r\n\r\nTo achieve our goal together, the course contains coding sessions, coding challenges, theory lectures, real-world projects and a final course exam.\r\n\r\nThis course is different because it\'s not just about writing code, it\'s also about how and why code works the way it does. Because it\'s the perfect mix between theory and practice. Because it focuses not only on small coding examples, but also on real-world projects and use cases. \r\n\r\nSo, by the end of the course, you will be a capable JavaScript developer, able to write, understand and debug JavaScript code using all the powerful features the language offers to us.', 30, 'beginner', 3, 'javascript', '/image/course/javascript.png', '', 4, '2019-06-02 13:40:51', '2018-11-18 22:00:00'),
(5, 'bootstrap', 'This course will literally take you from knowing nothing about Bootstrap 3 or 4 to learning all of the utilities, components, widgets and grids and building real world themes and websites. You do NOT need to know Bootstrap 3 for this course. Even if you already know Bootstrap 4, skip the learning sections and head right for section 6 to create the simple boiler theme and start the projects. Everything is completely modular!\r\n\r\nCustom Bootstrap Sandbox\r\n\r\nI have created a completely custom HTML learning environment for the first few sections of this course. Each lecture has an html page associated with it and has a start state. As we move along through the lectures, you code along with me learning all that Bootstrap 4 offers including helpers/utilities, components, widgets, flexbox and more.\r\n\r\n5 Real Projects/Themes\r\n\r\nWe will create 5 real world themes including. These projects are completely open source and you are free to use them anywhere.', 30, 'intermediate', 4, 'bootstrap', '/image/course/bootstrap.png', '', 7, '2019-06-02 13:41:17', '2018-11-18 22:00:00'),
(6, 'jquery', 'This jQuery for beginner\'s tutorial or course will teach you what jQuery is and how to start using it to create animations and advance features for your websites or applications.\r\n\r\njQuery is all around us, everywhere you see a slider, photo gallery, navigation menu, special effects, pop up boxes with photos or videos with plugins like lightbox or prettyphoto or anywhere you see nice animations on any website, jQuery its there.\r\n\r\nDo you need jQuery? If you want to add the best awesome Javascript features and animations to sites or apps without the complicated code then YES.\r\n\r\nIf you are new to web development and don\'t know Javascript or have very little knowledge then this jQuery tutorial / course is for you.', 30, 'intermediate', 5, 'jquery', '/image/course/jquery.png', '', 5, '2019-06-02 13:40:41', '0000-00-00 00:00:00'),
(7, 'php', 'Are you new to PHP or need a refresher? Then this course will help you get all the fundamentals of Procedural PHP, Object Oriented PHP, MYSQLi and ending the course by building a CMS system similar to WordPress, Joomla or Drupal.\r\n\r\nKnowing PHP has allowed me to make enough money to stay home and make courses like this one for students all over the world. Being a PHP developer can allow anyone to make really good money online and offline, developing dynamic applications.\r\n\r\nKnowing PHP will allow you to build web applications, websites or Content Management systems, like WordPress, Facebook, Twitter or even Google.\r\n\r\nThere is no limit to what you can do with this knowledge. PHP is one of the most important web programming languages to learn, and knowing it, will give you SUPER POWERS in the web development world and job market place.\r\n\r\nWhy?\r\n\r\nBecause Millions of websites and applications (the majority) use PHP. You can find a job anywhere or even work on your own, online and in places like freelancer or Odesk. You can definitely make a substantial income once you learn it.', 60, 'beginner', 6, 'php\r\n', '/image/course/php.png', '', 3, '2019-06-02 13:39:42', '2018-11-18 22:00:00'),
(8, 'mysql', 'MySQL Database Being the Second most widely used Relational Database makes it one of the database to learn if you are looking forward to develop a database driven application.\r\n\r\nAre you a Web Developer? An Application Developer? or A Programmer? Then MySQL Database should be one of the Mandatory Database in your \"To Learn\" list. If you don\'t know MySQL yet or if you are new to any database then this is your go to course to learn SQL and also MySQL Database.\r\n\r\nIf you are learning or want to learn PHP, PYTHON, PEARL or RUBY then you should learn MySQL as well as this is the Database that is used by most of the developer who prefer the previously mentioned programming languages. If you are Web Developer and you don\'t know MySQL yet then most won\'t recommend you to call yourself as a Web Developer yet.\r\n\r\nMySQL is one of the most used and go to database for pretty much all the web developer who pick PHP, PEARL or Python without a second thought.', 50, 'beginner', 7, 'mysql\r\n', '/image/course/mysql.png', '', 6, '2019-06-02 13:40:05', '2018-11-18 22:00:00'),
(9, 'ajax', 'This AJAX for beginner\'s tutorial course will teach you what AJAX is and how to start using it with PHP to create excellent web applications.\r\n\r\n---------------------------------------------------------\r\n\r\nHands on project\r\n\r\nOn this course we will create a real AJAX application that will give you the skills you need to start implementing AJAX to your projects or start you on your web development journey.', 15, 'intermediate', 8, 'ajax\r\n', '/image/course/ajax.png', '', 9, '2019-06-02 13:41:26', '2018-11-18 22:00:00'),
(10, 'laravel', 'Laravel is a powerful MVC PHP framework, designed for developers who need a simple and elegant toolkit to create full-featured web applications. Laravel was created by Taylor Otwell. This is a brief tutorial that explains the basics of Laravel framework.This tutorial will guide the developers and students who want to learn how to develop a website using Laravel. This tutorial is particularly meant for all those developers who have no prior experience of using Laravel. ', 30, 'advanced', 9, 'laravel\r\n', '/image/course/larvael.png', '', 8, '2019-06-02 13:40:20', '2018-11-18 22:00:00'),
(11, 'vuejs', 'Vue JS 2 has quickly become incredibly popular, both due to how powerful the JavaScript framework is, but also how easy it is to learn. Vue is much easier to learn than other JavaScript frameworks such as Angular and React, meaning that you can start building your first Vue application in no time!\r\n\r\nIn this course, you will learn how to build reactive web applications at any scale with Vue. You will learn the theory that you need to know about Vue.js, and we will be building several example applications as we go along, demonstrating the explained concepts in practice. The course lectures include examples when going through new material, followed by exercises that you can optionally choose to solve - and we walk through the solutions together.\r\n\r\nWhether or not you have prior experience with VueJS, this course is an easy way for you to learn the framework! Perhaps you have struggled with large and complex frameworks such as Angular? Don\'t worry, Vue.js is much easier to learn! Getting up and running fast is at the heart of Vue, so no more long hours of configuration just to show \"Hello World!\" Or perhaps you have no experience with reactive JavaScript frameworks and come straight from using jQuery? No problem! Vue.js is an excellent choice for your first framework, and is one of the easiest one to start out with.\r\n\r\nDespite the fact that Vue JS is easy to learn, it is an incredibly powerful framework that can be used to build large web applications as well as small ones. Unlike many other frameworks, Vue.js does not try to take control of your application, and allows you to let the framework control only parts of your application - something that is perfect for migrating legacy applications to a more modern framework without doing a complete rewrite at once! Apart from learning how to build single page applications (SPAs), you will also learn how to manage state in large applications with Vuex.\r\n\r\nThis course starts from scratch with teaching you how to build a \"Hello World!\" application in Vue.js and moves towards building advanced applications step by step. By the end of this course, you will be able to build complex and large web applications with Vue.', 21, 'advanced', 10, 'vuejs', '/image/course/viewjs.png', '', 10, '2019-06-02 13:37:52', '2018-11-18 22:00:00'),
(12, 'express.js', 'Express is the most popular framework for Node.js. It allows you to spin up a web server in just about 3 lines of code. Express framework makes it easy to building web applications and api\'s for clients very fast. Even better when you can combine an entire application front to backend just using one single programming language \'Javascript\'.\r\n\r\nCompanies such as Uber, Accenture, IBM and so on, use express to drive their business through technology.', 26, 'intermediate', 11, 'express', '', '', 11, '2019-04-19 12:14:10', '0000-00-00 00:00:00'),
(13, 'angular.js', 'AngularJS is a powerful JavaScript framework that can be used to build Single Page Applications (SPAs) that run in the browser. By the time you\'re done with this course you\'ll understand how AngularJS can be used to build applications. This includes learning how to build custom controllers and re-useable services, how to bind data into views, how routing works, and also how custom animations can be used to add polish to your apps. The course even includes bonus sections on getting started building custom directives! This is a hands-on course that you can follow along with and learn by doing.', 50, 'intermediate', 12, 'angular', '', '', 12, '2019-04-19 12:16:00', '0000-00-00 00:00:00'),
(14, 'node.js', 'Node.js is probably THE most popular and modern server-side programming language you can dive into these days!\r\n\r\nNode.js developers are in high demand and the language is used for everything from traditional web apps with server-side rendered views over REST APIs all the way up to GraphQL APIs and real-time web services. Not to mention its applications in build workflows for projects of all sizes.\r\n\r\nThis course will teach you all of that! From scratch with zero prior knowledge assumed. Though if you do bring some knowledge, you\'ll of course be able to quickly jump into the course modules that are most interesting to you.', 45, 'advance', 13, 'node', '', '', 13, '2019-04-19 12:16:55', '0000-00-00 00:00:00'),
(15, 'react', 'Learn React or dive deeper into it. Learn the theory, solve assignments, practice in demo projects and build one big application which is improved throughout the course: The Burger Builder!\r\n\r\nMore details please!\r\n\r\nJavaScript is the major driver of modern web applications since it\'s the only programming language which runs in the browser and hence allows you to provide highly reactive apps. You\'ll be able to achieve mobile-app like user experiences in the web.\r\n\r\nBut using JavaScript can be challenging - it quickly becomes overwhelming to create a nice web app with vanilla JavaScript and jQuery only.', 35, 'advance', 14, 'react', '', '', 14, '2019-04-19 12:14:47', '0000-00-00 00:00:00'),
(16, 'mongodb', 'MongoDB is one of the most important databases you can work with these days. It\'s extremely popular and MongoDB developers are in high demand.\r\n\r\nNo matter if you\'re building web applications, mobile applications or any other kind of application or if you\'re a data scientist - you\'ll need to work with data. Storing data, querying it efficiently and minimizing complexities whilst optimizing performance are crucial tasks.', 60, 'advance', 15, 'mongodb', '', '', 15, '2019-04-19 12:16:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(10) UNSIGNED NOT NULL,
  `detail` varchar(255) NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `detail`, `course_id`) VALUES
(1, 'Understand HTML', 2),
(2, 'Code HTML\r\n', 2),
(3, 'Setting up the environment of the HTML', 2),
(4, 'By the end of the course you will be able to create full fledged HTML5 websites', 2),
(5, 'You will be able to use features like Drag and Drop, Geo location and Web Storage to create immersible user experience.', 2),
(6, 'You will be able to create web applications for mobile phones as well', 2),
(7, 'Tons of modern CSS techniques to create stunning designs and effects', 3),
(8, 'How CSS works behind the scenes: the cascade, specificity, inheritance, etc.', 3),
(9, 'Advanced CSS animations with @keyframes, animation and transition', 3),
(10, 'CSS Grid layouts: build a huge real-world project with CSS Grid', 3),
(11, 'Advanced responsive design: media queries, mobile-first vs desktop-first, em vs rem units, etc.', 3),
(12, 'SVG images and videos in HTML and CSS: build a background video effect', 3),
(13, 'Flexbox layouts: build a huge real-world project with flexbox\r\n', 3),
(14, 'Go from a total beginner to an advanced JavaScript developer', 4),
(15, 'JavaScript and programming fundamentals: variables, boolean logic, if/else, loops, functions, arrays, etc.', 4),
(16, 'Asynchronous JavaScript: The event loop, promises, async/await, AJAX and APIs', 4),
(17, 'A true understanding of how JavaScript works behind the scenes', 4),
(18, 'Code 3 beautiful real-world apps with both ES5 and ES6+ (no boring toy apps)', 4),
(19, 'Learn and create amazing high quality Bootstrap 4 themes and UIs from scratch', 5),
(20, 'Learn semantic HTML5 & modern CSS3 techniques', 5),
(21, 'Learn the Bootstrap 4 utilities, classes, components & JS widgets using a custom sandbox environment', 5),
(22, 'Learn to compile Sass in the easiest way possible using a GUI', 5),
(23, 'Add beautiful effects & animations to your sites', 5),
(24, 'Create dynamic websites that users enjoy', 6),
(25, 'Add fast feedback and validation for forms using jQuery', 6),
(26, 'Use AJAX to add content a the page dynamically from APIs like Flickr and TheMovieDB', 6),
(27, 'Handle arbitrary user events such as mouse clicks and keyboard presses', 6),
(28, 'Manipulate the appearance and content of any element on the page', 6),
(29, 'You will learn to create a (CMS) Content Management System like WordPress, Drupal or Joomla', 7),
(30, 'You will learn how to launch your application online', 7),
(31, 'Object Oriented Programming', 7),
(32, 'How to use forms to submit data to databases', 7),
(33, 'You will learn about sessions,Password hashing,Email sending', 7),
(34, 'You will learn to use an API to bring data from a database to a graphical interface', 7),
(35, 'You will learn to create clean URL\'s and remove the .php from files', 7),
(36, 'You will learn to debug (fix your code)', 7),
(37, 'Create a Well Structure Database', 8),
(38, 'Create a Database that can handle itself on most conditions', 8),
(39, 'Understand the errors as they occur and rectify them', 8),
(40, 'Create SQL Queries for Database Driven Applications', 8),
(41, 'Handle a Database with Pretty good efficiency', 8),
(42, 'Create MySQL Queries that are efficient and clear', 8),
(43, 'Indexing Tables for Better Performance', 8),
(44, 'Understand the basics of Ajax interactions', 9),
(45, 'To Understand and use the XMLHttpRequest() object in Javascript', 9),
(46, 'To Update the Browser Window\'s HTML content dynamically through the DOM', 9),
(47, 'To Dynamically Create and Send Parameterized Queries to a Server', 9),
(48, 'To Monitor Server Response for Process Completion', 9),
(49, 'To Display Server Response in Plain Text', 9),
(50, 'To Understand the Role of a Web Server in Ajax', 9),
(51, 'To Receive and Parse JSON Objects in the DOM', 9),
(52, 'Learn to build applications using laravel', 10),
(53, 'You will learn how use Laravel', 10),
(54, 'You will learn how to create and use Controllers and what they are', 10),
(55, 'You will learn to use the templating engine Blade', 10),
(56, 'How to create migrations and what they are', 10),
(57, 'You will learn how to use routes', 10),
(58, 'You will learn how to create Views an what they are', 10),
(59, 'How to connect and use Databases', 10),
(60, 'How to use Laravel Tinker - Command line program to play around with Laravel without persisting data', 10),
(61, 'Database: Eloquent', 10),
(62, 'How to build advanced Vue.js applications', 11),
(63, 'How to build single page applications (SPA)', 11),
(64, 'Understand the theory and how Vue works under the hood', 11),
(65, 'How to manage state in large applications with Vuex', 11),
(66, 'Communicating with servers with HTTP', 11),
(67, 'Use modern tools for developing and building applications (e.g. webpack)', 11),
(68, 'Work with one of the most in-demand web development programming languages', 14),
(69, 'Understand the NodeJS ecosystem and build server-side rendered apps, REST APIs and GraphQL APIs', 14),
(70, 'Build modern, fast and scalable server-side web applications with NodeJS, databases like SQL or MongoDB and more', 14),
(71, 'Use MongoDB to its full potential in future projects', 16),
(72, 'Use all features MongoDB offers you to work with data efficiently', 16),
(73, 'Write efficient and well-performing queries to fetch data in the format you need it', 16),
(74, 'ES6', 13),
(75, 'Angular 4 Framework', 13),
(76, 'Data Bindings', 13),
(77, 'Dependency Injection', 13),
(78, 'Form Validation', 13),
(79, 'Pipes (Filters)', 13),
(80, '\r\nBuild powerful, fast, user-friendly and reactive web apps', 15),
(81, 'Provide amazing user experiences by leveraging the power of JavaScript with ease', 15),
(82, 'Apply for high-paid jobs or work as a freelancer in one the most-demanded sectors you can find in web dev right now', 15),
(83, 'Learn React Hooks & Class-based Components', 15),
(84, 'Serve static content from server', 12),
(85, 'Build applications with Express', 12),
(86, 'Express Middleware', 12),
(87, 'Use Template engines', 12);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `result` int(11) NOT NULL,
  `passing` int(11) NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `result`, `passing`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 'html', 100, 50, 2, '2019-04-04 14:28:32', '2018-10-28 14:53:46'),
(2, 'css', 100, 50, 3, '2019-04-04 14:30:11', '2018-10-29 11:18:35'),
(3, 'php', 100, 50, 7, '2019-04-04 14:33:18', '2018-10-28 14:54:06'),
(4, 'javascript', 100, 50, 4, '2019-04-04 14:33:11', '2018-11-18 22:00:00'),
(5, 'jquery', 100, 50, 6, '2019-04-04 14:33:23', '2018-11-18 22:00:00'),
(6, 'mysql', 100, 50, 8, '2019-04-04 14:33:28', '2018-11-18 22:00:00'),
(7, 'bootstrap', 100, 50, 5, '2019-04-04 14:33:14', '2018-11-18 22:00:00'),
(8, 'laravel', 100, 50, 10, '2019-04-04 14:34:02', '2018-11-18 22:00:00'),
(9, 'ajax', 100, 50, 9, '2019-04-04 14:33:58', '2018-11-18 22:00:00'),
(10, 'vuejs', 100, 50, 11, '2019-04-04 14:34:09', '2018-11-18 22:00:00'),
(11, 'express.js', 60, 30, 12, '2019-04-04 14:34:14', '0000-00-00 00:00:00'),
(12, 'angular.js', 100, 50, 13, '2019-04-04 14:34:19', '2019-03-29 22:00:00'),
(13, 'node.js', 100, 50, 14, '2019-04-04 14:34:25', '2019-03-29 22:00:00'),
(14, 'react', 90, 45, 15, '2019-04-04 14:34:30', '2019-03-29 22:00:00'),
(15, 'mongodb', 100, 50, 16, '2019-04-04 14:34:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `example`
--

CREATE TABLE `example` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(500) NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `sorting` int(11) NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `video_id` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `name`, `description`, `url`, `duration`, `sorting`, `course_id`, `video_id`, `created_at`, `updated_at`) VALUES
(14, 'Learn Html In Arabic #01 - Introduction and What is Html?', 'Introduction about the html language and information about how it start and why to learn it', 'PYjyg0LNTfE', '6:27', 1, 2, 'PYjyg0LNTfE', '2019-06-02 13:52:12', '0000-00-00 00:00:00'),
(15, 'Learn Html In Arabic #02 - What I Need?', 'What I need to start learning Html plus some discussion about the language', 'YBAhrf7Bz6k', '6:11', 2, 2, 'YBAhrf7Bz6k', '2019-06-02 13:52:17', '0000-00-00 00:00:00'),
(16, 'Learn Html In Arabic #03 - Attributes\r\n', 'Explain everything about elements attributes and properties', 'BCh2JCgrMp8', '4:14', 3, 2, 'BCh2JCgrMp8', '2019-06-02 13:52:24', '0000-00-00 00:00:00'),
(17, 'Learn Html in Arabic #04 - Heading', 'Learn everything about Html Heading Elements and how to use it', 'Cc7ur4-7mJ8', '4:02', 4, 2, 'Cc7ur4-7mJ8', '2019-06-02 13:52:29', '0000-00-00 00:00:00'),
(18, 'Learn Html in Arabic #05 - Paragraph', 'Learn everything about paragraphs and how to deal with it', 'pjV6FyBV7Fk', '4:58', 5, 2, 'pjV6FyBV7Fk', '2019-06-02 13:52:34', '0000-00-00 00:00:00'),
(19, 'Learn Html in Arabic #06 - Image', 'Learn everything about html image and how to add images to your webiste\r\n\r\nWorking with Paths when adding images', 'k2IdoJ3wfTE', '11:00', 6, 2, 'k2IdoJ3wfTE', '2019-06-02 13:52:38', '0000-00-00 00:00:00'),
(20, 'Learn Html in Arabic #07 - Anchor Link [ a ]', 'Learn about the hypertext reference link, Anchor link [a]', 'gn9a14Nn-QU', '10:15', 7, 2, 'gn9a14Nn-QU', '2019-06-02 13:52:43', '0000-00-00 00:00:00'),
(21, 'Learn Html in Arabic #08 - Head', 'Learn every element inside the head tag\r\nmeta charset\r\nmeta description\r\ntitle\r\nlink\r\nstyle\r\nscript', 'sdpYT2HyhdQ', '20:05', 8, 2, 'sdpYT2HyhdQ', '2019-06-02 13:52:48', '0000-00-00 00:00:00'),
(22, 'Learn Html in Arabic #09 - Comments', 'Learn about comments in Html and how it can help you in your work and explain the comment system in html and how to make comment', 'oADG1SEXPxA', '8:38', 9, 2, 'oADG1SEXPxA', '2019-06-02 13:52:53', '0000-00-00 00:00:00'),
(23, 'Learn Html in Arabic #10 - Display: Block, Inline-Block, Inline', 'Explain everything about Block and Inline elements and whats the deference between Inline & Block although how to make div', '4WnOExZKr3g', '18:00', 10, 2, '4WnOExZKr3g', '2019-06-02 13:53:01', '0000-00-00 00:00:00'),
(24, 'Learn Css in Arabic #01 - Introduction', 'Learn about the css language and who you must learn it to design the web', 'Iu1T7j2FA4M', '\r\n4:22', 1, 3, 'Iu1T7j2FA4M', '2019-06-02 13:53:05', '0000-00-00 00:00:00'),
(25, 'Learn Css in Arabic #02 - Syntax and How to Write Css Code', 'Learn about Css Syntax and how to write the css code', 'RzPQgZWZcqw', '13:52', 2, 3, 'RzPQgZWZcqw', '2019-06-02 13:53:10', '0000-00-00 00:00:00'),
(26, 'Learn Css in Arabic #03 - Element Styling', 'Learn about class & id and how to style elements with it ', '-wU_iQ38DF0', '12:38', 3, 3, '-wU_iQ38DF0', '2019-06-02 13:53:14', '0000-00-00 00:00:00'),
(27, 'Learn Css in Arabic #04 - Element Background', 'Everything about Background property\r\nbackground-color\r\nbackground-image\r\nbackground-repeat\r\nbackground-attachment\r\nbackground-position', 'cmyVI_zqbQw', '35:47', 4, 3, 'cmyVI_zqbQw', '2019-06-02 13:53:20', '0000-00-00 00:00:00'),
(28, 'Learn Css in Arabic #05 - Text Part 1', 'Learn about text format and properties part 1\r\ncolor / direction / letter-spacing / line-height / text-align', 'dBrqhIsdAU8', '20:10', 5, 3, 'dBrqhIsdAU8', '2019-06-02 13:53:26', '0000-00-00 00:00:00'),
(29, 'Learn Css in Arabic #06 - Text Part 2', 'Learn about text format and properties part 2\r\ntext-decoration / text-indent / text-transform / white-space / word-spacing', 'fygWBZP6e3k', '20:59', 6, 3, 'fygWBZP6e3k', '2019-06-02 13:53:31', '0000-00-00 00:00:00'),
(30, 'Learn Css in Arabic #07 - Font Properties', 'Learn about font properties and how to use it \r\nfont-family / font-size / font-style / font-weight', 'n48ICr4QvnQ', '24:44', 7, 3, 'n48ICr4QvnQ', '2019-06-02 13:53:35', '0000-00-00 00:00:00'),
(31, 'Learn Css in Arabic #08 - Links', 'Learn about Links properties and how to deal with it\r\nanchor\r\n:hover\r\n:active', 'zOhK3__GWl8', '4:10', 8, 3, 'zOhK3__GWl8', '2019-06-02 13:53:42', '0000-00-00 00:00:00'),
(32, 'Learn Css in Arabic #09 - Lists Properties\r\n', 'Learn everything about Lists properties', 'oidOpFIlBOA', '8:42', 9, 3, 'oidOpFIlBOA', '2019-06-02 13:53:47', '0000-00-00 00:00:00'),
(33, 'Learn Css in Arabic #10 - Box Model Properties', 'Learn about Box Model properties and how to deal with elements', '_ohhEDk_DHs', '5:18', 10, 3, '_ohhEDk_DHs', '2019-06-02 13:53:52', '0000-00-00 00:00:00'),
(34, '[ Learn JavaScript In Arabic ] #01 - Introduction & What\'s JavaScript', 'مقدمة عن تاريخ لغة الجافا سكريبت و مبتكريها و بعض المعلومات عنها و لماذا نستخدمها', 'eKuNnpWhm7c', '5:41', 1, 4, 'eKuNnpWhm7c', '2019-06-02 13:53:57', '0000-00-00 00:00:00'),
(35, '[ Learn JavaScript In Arabic ] #02 - What I Need To Learn JavaScript', 'شرح ماذا احتاج لتعلم لغة الجافاسكريبت', 'yRAzlw4JM8o', '4:00', 2, 4, 'yRAzlw4JM8o', '2019-06-02 13:54:01', '0000-00-00 00:00:00'),
(36, '[ Learn JavaScript In Arabic ] #03 - How To Work With Chrome Console', 'شرح كيفية التعامل مع ال Console الخاص بجوجل كروم', 'XKYUEYPTBjo', '5:56', 3, 4, 'XKYUEYPTBjo', '2019-06-02 13:54:06', '0000-00-00 00:00:00'),
(37, '[ Learn JavaScript In Arabic ] #04 - Where To Put JavaScript Code', 'JavaScript Code', 'kdqhkfDPlXA', '17:23', 4, 4, 'kdqhkfDPlXA', '2019-06-02 13:54:10', '0000-00-00 00:00:00'),
(38, '[ Learn JavaScript In Arabic ] #05 - JavaScript Syntax', 'شرح البنية الخاصة بالكود وبعض المعايير الخاصة باللغة', 'S-MGBBtI-48', '14:31', 5, 4, 'S-MGBBtI-48', '2019-06-02 13:54:15', '0000-00-00 00:00:00'),
(39, '[ Learn JavaScript In Arabic ] #06 - JavaScript Comments', 'Comments In JavaScript', 'cKTfzARcdpw', '4:19', 6, 4, '', '2019-05-26 15:25:09', '0000-00-00 00:00:00'),
(40, '[ Learn JavaScript In Arabic ] #07 - Variables', 'شرح المتغيرات Variables و كيفية التعامل معها و فهمها بالتفصيل', 'vPwQKAZryP8', '26:54', 7, 4, '', '2019-05-26 15:25:09', '0000-00-00 00:00:00'),
(41, '[ Learn JavaScript In Arabic ] #08 - Data Type', 'شرح أنواع البيانات Data Types و التعرف عليها كاملة', '2pz2JlJUDMg', '24:21', 8, 4, '', '2019-05-26 15:25:09', '0000-00-00 00:00:00'),
(42, '[ Learn JavaScript In Arabic ] #09 - Concatenation', 'شرح ربط النصوص و المتغيرات Concatenation', 'hQWcdh2GdEU', '20:47', 9, 4, '', '2019-05-26 15:25:09', '0000-00-00 00:00:00'),
(43, '[ Learn JavaScript In Arabic ] #10 - Output', 'شرح المخرجات في الجافا سكريبت Output', 'DZTgVQhgJYM', '11:21', 10, 4, '', '2019-05-26 15:25:09', '0000-00-00 00:00:00'),
(44, '[ Learn JavaScript In Arabic ] #11 JavaScript Operators', 'شرح ال Operators بالتفصيل مع الأمثلة', 'acWPO_iQ--c', '15:27', 11, 4, '', '2019-05-26 15:31:25', '0000-00-00 00:00:00'),
(45, 'Learn JavaScript In Arabic #12 - If, Else If, Else Conditions', 'شرح الدوال الشرطية If, Else If , Else في الجافا سكريبت', 'cFjj7wW6wro', '17:30', 12, 4, '', '2019-05-26 15:31:25', '0000-00-00 00:00:00'),
(46, '[ Learn JavaScript In Arabic ] #13 Conditional Operators', 'شرح كل ما يخص ال Conditional Operators', 'LYCGqVF5nFA', '25:41', 13, 4, '', '2019-05-26 15:31:25', '0000-00-00 00:00:00'),
(47, '[ Learn JavaScript In Arabic ] #14 Logical Operators', 'شرح كل ما يخص ال Logical Operators\r\n\r\nAnd\r\n\r\nOr\r\n\r\nNot', 'gqDT45XqWq4', '26:05', 14, 4, '', '2019-05-26 15:31:25', '0000-00-00 00:00:00'),
(48, '[ Learn JavaScript In Arabic ] #15 Function - Basic', 'شرح معرفة أساسيات عمل Function بابسط الطرق', 'ciNxZcOJ55k', '11:32', 15, 4, '', '2019-05-26 15:31:25', '0000-00-00 00:00:00'),
(49, '[ Twitter Bootstrap 3 In Arabic ] #01 - Introduction', 'مقدمة عن البوتستراب و كل ما يخصه و ما يقدمه لك في التصميم و ما هي مميزاته و فوائده', 'auFVttzUoo8', '6:29', 1, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(50, '[ Twitter Bootstrap 3 In Arabic ] #02 - Include It', 'شرح كيفية استدعاء البوتستراب في تصميمك لبدء العمل عليه', 'tC3CfmdssQY', '14:28', 2, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(51, '[ Twitter Bootstrap 3 In Arabic ] #03 - Start Coding', 'شرح بدأ التصميم و استدعاء المكتبات المفيدة للتصميم و نبذة عنها و عن الكواد التي يحتاجها البوتستراب', 'u_63CUqQWaM', '11:27', 3, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(52, '[ Twitter Bootstrap 3 In Arabic ] #04 - Grid System Intro Part 1', 'شرح نظام الجريد الخاص بالبوتستراب المقدمة أول جزء', 'Pdb6IJt8fLc', '18:15', 4, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(53, '[ Twitter Bootstrap 3 In Arabic ] #05 - Grid System Intro Part 2', 'شرح نظام الجريد الخاص بالبوتستراب المقدمة ثاني جزء', 'sMY1L99z09w', '11:38', 5, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(54, '[ Twitter Bootstrap 3 In Arabic ] #06 - Grid System Hidden / Visible', 'شرح كلاسات الاظهار و الاخفاء', 'NTFCOu8V5dE', '12:20', 6, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(55, '[ Twitter Bootstrap 3 In Arabic ] #07 - Grid System Column Reset', 'شرح كيفية عمل Clear لل Float الخاص بأعمدة ال Grid', 'Pi4iES4seNU', '9:01', 7, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(56, '[ Twitter Bootstrap 3 In Arabic ] #08 - Grid System Column Offset', 'شرح عمل المسافات بين أعمدة الجريد في التصايميم المتجاوبة', '9GRjR2q_vWs', '14:27', 8, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(57, '[ Twitter Bootstrap 3 In Arabic ] #09 - Grid System Column Ordering', 'شرح كيفية ترتيب أعمدة الجريد في التصميم', 'gSiZvifdm6o', '14:08', 9, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(58, '[ Twitter Bootstrap 3 In Arabic ] #10 - Grid System Column Nesting', 'شرح كيفية عمل جريد فرعي من الجريد الرئيسي', 'rlYNTPbUX14', '9:40', 10, 5, '', '2019-05-26 15:44:49', '0000-00-00 00:00:00'),
(59, 'jQuery Crash Course [1] - Intro & Selectors', 'In this video we will cover jQuery selectors in depth. We can select elements by id, class, CSS3 pseudo selectors and the elements themselves. ', '3nrLc_JOF7k', '21:11', 1, 6, '', '2019-05-26 15:51:31', '0000-00-00 00:00:00'),
(60, 'jQuery Crash Course [2] - Events', 'In this video we will be working with jQuery events including mouse, form and input events', 'VlWsJHsVb-E', '24:18', 2, 6, '', '2019-05-26 15:51:31', '0000-00-00 00:00:00'),
(61, 'jQuery Crash Course [3] - DOM Manipulation', 'In this video Ill show you how to add, remove and change things in the DOM using jQuery. We will look at methods like append, prepend, html, and text\r\n', 'q4FWSdX55ls', '20:58', 3, 6, '', '2019-05-26 15:51:31', '0000-00-00 00:00:00'),
(62, 'jQuery Crash Course [4] - Effects and Animation', 'In this video we will look at the jQuery fade and slide methods/effects as well as the animate method', 'kVc_XfZY0vI', '15:03', 4, 6, '', '2019-05-26 15:51:31', '0000-00-00 00:00:00'),
(63, 'jQuery Crash Course [5] - Ajax', 'In this video we will work with the load, $.get, $.post and $.ajax methods in jQuery', 'eR3rcalj06Q', '20:14', 5, 6, '', '2019-05-26 15:51:31', '0000-00-00 00:00:00'),
(64, 'PHP Front To Back [Part 1] - Series Introduction', 'This is the start of an ongoing series that will teach you the entire language of PHP. This series will include:\r\n\r\nBasic principles of PHP\r\nPHP7 / Apache / MySQL Setup\r\nCode Syntax (vars, arrays, loops, conditionals, functions, etc)\r\nProcedural & OOP\r\nDynamic Pages \r\nForm Submission / Superglobals\r\nWorking With Databases\r\nMini Projects (Contact Form, User Login System, etc)', 'oJbfyzaA2QA', '9:12', 1, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(65, 'PHP Front To Back [Part 2] - PHP7 & Xammp Installation', 'In this video we will be installing Xammp which includes PHP 7, Apache and MySQL. This is in preparation for a big series on PHP', '6tCWiexc05U', '8:02', 2, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(66, 'PHP Front To Back [Part 3] - Variables, Constants & Data Types', 'In this video we will look at very basic PHP syntax including tags, comments, variables, constants and concatenation. ', '0Dp7Lt7iT3A', '15:23', 3, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(67, 'PHP Front To Back [Part 4] - Arrays', 'In this video we will look at PHP arrays. There are 3 types..\r\n\r\nIndexed Arrays\r\nAssociative Arrays\r\nMulti-Dimensional', '9p9siksrSoU', '13:07', 4, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(68, 'PHP Front To Back [Part 5] - Loops', 'In this video we will look at PHP loops. There are 4 types we will look at...\r\n\r\nFor Loop\r\nWhile Loop\r\nDo..While Loop\r\nForeach Loop', '5ggUfM6mvSk', '9:26', 5, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(69, 'PHP Front To Back [Part 6] - Functions', 'In this part we will look at user defined functions and some naming conventions. We are almost to the cool stuff :)', 'ApP1rgZ9OlY', '13:10', 6, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(70, 'PHP Front To Back [Part 7] - Conditionals & Comparison', 'In this video we will look at if statements as well as if...else and switches in PHP. This video is for PHP and programming beginners. There are more advanced topics to come', 'x6UDhaHVaeY', '10:59', 7, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(71, 'PHP Front To Back [Part 8] - Dates & Timestamps', 'In this video we will look at the PHP date() function as well as mktime() and strtotime() to create dates and timestamps from strings', 'EHfr-edosmA', '11:20', 8, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(72, 'PHP Front To Back [Part 9] - Include & Require', 'In this video I will show you how to include a PHP file with PHP or HTML into another file saving you a lot of time and code writing. We will look at include, require and require_once', 'faknU12cs7Y', '8:22', 9, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(73, 'PHP Front To Back [Part 10] - $_SERVER Superglobal', 'In this video we will create a simple webpage that displays the server, file and client info. We will use Twitter Bootstrap to make the page look nice and clean.', 'oVJ0anq8yLA', '16:56', 10, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(74, 'PHP Front To Back [Part 11] - Get & Post Tutorial', 'In this video we will take a look at the $_GET and $_POST superglobals as well as form processing. We will also look at the htmlentities() function for page security', 'cIFUH3Qnd6s', '13:20', 11, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(75, 'PHP Front To Back [Part 12] - Common String Functions', 'In this video we will go over some common and useful string functions such as \r\n\r\nsubstr()\r\nstrpos()\r\nstrtoupper()\r\nstrtolower()\r\nucwords()\r\ntrim()\r\nstr_replace()\r\ngzcompress()', 'z32BOHVWplU', '13:34', 12, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(76, 'PHP Front To Back - [Part 13] Ternary & Shorthand Syntax', 'In this video we will look at the PHP ternary operator and some alternative syntax for if statements as well as loops.', 'NUq0ZT54zvw', '10:05', 13, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(77, 'PHP Front To Back [Part 14] - Filters & Validation', 'In this video we will look at PHP filters and how to validate data types, emails, urls, etc. We will also be able to sanitize data. Functions will include\r\n\r\nfilter_has_var()\r\nfilter_input()\r\nfilter_var()\r\nfilter_input_array()\r\nfilter_var_array()', 'pfY9LwcsH3A', '21:19', 14, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(78, 'PHP Front To Back [Part 15] - PHP Contact Form', 'In this video we will create a PHP contact form from scratch. We will also include server side form validation and messaging', 'tJ5eUgOxITE', '19:56', 15, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(79, 'PHP Front To Back [Part 16] - Sessions Tutorial', 'In this video we will look at PHP sessions to carry information across multiple PHP pages. We will also look at redirecting with the header() function', 'W4rSS4-LdIE', '10:30', 16, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(80, 'PHP Front To Back [Part 17] - Cookies Tutorial', 'Sessions are recommended over cookies in most situations but it is good to understand how cookies work as well. In this video we will be using the setcookie() function to create cookies in PHP. We will also look at serializing data with serialize() and unserialize()', 'RzMjwICWKr4', '14:05', 17, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(81, 'PHP Front To Back [Part 18] - PHP & AJAX', 'In this video I will show you how we can use PHP and AJAX together to build a simple suggestion engine for a form input', 'nU0KDn-vLT4', '13:47', 18, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(82, 'PHP Front To Back [Part 19] - File System Functions', 'In this video we will look at some functions to work with files, folders and paths such as basename(), dirname(), file_get_contents(), fopen(), fread() and much more', 'sLLZU38Okgo', '18:47', 19, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(83, 'PHP Front To Back [Part 20] - OOP', 'In this video I will introduce object oriented programming in PHP using classes, properties and methods', 'FhbP6bF21Cs', '18:38', 20, 7, '', '2019-05-26 16:07:29', '0000-00-00 00:00:00'),
(84, 'PHP Front To Back [Part 21] - Fetching Data With MySQLi', 'In this video we will start to work with the MySQLi extension. We will create a MySQL database using phpMyAdmin as well as a posts table to interact with.', 'IYlDJ2K3MGk', '26:14', 21, 7, '', '2019-05-26 16:09:26', '0000-00-00 00:00:00'),
(85, 'PHP Front To Back [Part 22] - MySQLi Insert, Update & Delete', 'In this part we will be adding to the sample blog application and adding insert, update and delete functionality using the MySQLi extension.', '9t7AH7lOlL0', '23:26', 22, 7, '', '2019-05-26 16:09:26', '0000-00-00 00:00:00'),
(86, 'Lesson 1: Introduction to MySQL - UniversalClass MySQL Course', 'Webmasters, ecommerce startups, bloggers, and programmers can all benefit by understanding and learning MySQL administration.', 'FhbCS6lx2wg', '18:26', 1, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(87, 'Lesson 2: Installing MySQL - UniversalClass MySQL Course', '\r\nLearn how to properly install MySQL for your platform of choice.', 'pdNGcrtJdb8', '23:38', 2, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(88, 'Lesson 3: Designing Databases - UniversalClass MySQL Course', '\r\nRedesigning a database is not an option for most large businesses. You need to get it right the first time.', '5z4IUrCAv4A', '29:19', 3, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(89, 'Lesson 4: Basic SQL - UniversalClass MySQL Course', 'This lesson explains the basics of all four main SQL statements: UPDATE, INSERT, SELECT, and DELETE. As a database administrator or programmer, these four statements are what you\'ll work with in daily tasks.', 'zAUzK3yBCZc', '31:00', 4, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(90, 'Lesson 5: Database Structures - UniversalClass MySQL Course', '\r\nThis lesson discusses how to create databases, tables, and then altering those tables for future changes.', 'b85eTgUrnFw', '21:50', 5, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(91, 'Lesson 6: Doing Advanced Queries - MySQL Course', '\r\nAdvanced queries are typically used for reporting, joining multiple tables, nesting queries, and transaction locking. All of these concepts are covered in this lesson.', 'es_t9QXpXY4', '48:35', 6, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(92, 'Lesson 7: Advanced MySQL Concepts - UniversalClass MySQL Course', '\r\nAdvanced MySQL help new administrators with manipulating data either through inserting records from other queries or CSV files.', 'NPAaZ0GkSsI', '44:33', 7, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(93, 'Lesson 8: Managing Users and Privileges - UniversalClass MySQL Course', '\r\nBy managing users, you keep granular control over your data and protect it from unauthorized access.', 'i_RgtRfCkKU', '37:47', 8, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(94, 'Lesson 9: Backing Up and Restoring MySQL Databases - UniversalClass MySQL Course', '\r\nBackups should be a part of any good IT policy. Backups are included in disaster recovery plans, which are used when critical systems fail.', 'dYm_uzKhw2s', '39:40', 9, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(95, 'Lesson 10: MySQL Options File and Configuring and Tuning - UniversalClass MySQL Course', '\r\nThis lesson discusses performance tuning and configurations for your MySQL server and its databases.', '7PSArbazjBs', '36:14', 10, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(96, 'Lesson 11: Setting Up MySQL Replication - UniversalClass MySQL Course', '\r\nReplication configurations assume that you have two different MySQL servers set up. This lesson explains the benefits of replication and how to set up your MySQL environment.', 'APAmsHAYUiI', '32:38', 11, 8, '', '2019-05-26 18:19:44', '0000-00-00 00:00:00'),
(97, '1: How to Get Started With AJAX | AJAX Tutorial For Beginners | Learn AJAX | PHP | JavaScript', 'AJAX tutorial series for beginners - Learn AJAX programming. In this lesson we will learn about AJAX, and learn what we can use it for. AJAX which is written using jQuery or JavaScript, is often used together with back-end languages such as PHP, in order to load data from databases.', 'tNKD0kfel6o', '3:54', 1, 9, '', '2019-05-26 18:26:44', '0000-00-00 00:00:00'),
(98, '2: How to load in data from a server using AJAX - Learn AJAX programming', 'How to load in data from a server using AJAX - Learn AJAX programming. In this lesson we will learn how to get content from other files on our server, and insert it into our web page without needing to refresh the browser.', 'XhMGV8PzyOg', '12:04', 2, 9, '', '2019-05-26 18:26:44', '0000-00-00 00:00:00'),
(99, '3: Get data from a database without refreshing the browser using AJAX - Learn AJAX programming', 'Get data from a database without refreshing the browser using AJAX - Learn AJAX programming. In this lessons we will learn how to load more comments in a comment field using AJAX, PHP and a database.', 'ejN-oAw9vC0', '18:48', 3, 9, '', '2019-05-26 18:26:44', '0000-00-00 00:00:00'),
(100, '4: How to use get and post methods in jQuery AJAX - Learn AJAX programming', 'When to use AJAX get and post using jQuery - Learn AJAX programming. In this lesson we will learn about get and post functions within jQuery AJAX.', 'MG9itGX1hD0', '18:18', 4, 9, '', '2019-05-26 18:26:44', '0000-00-00 00:00:00'),
(101, '5: How to validate a form using AJAX - Learn AJAX programming', 'How to validate a form using AJAX - Learn AJAX programming. In this lesson I will teach how to validate HTML forms using jQuery and AJAX.', 'L7Sn-f36TGM', '35:26', 5, 9, '', '2019-05-26 18:26:44', '0000-00-00 00:00:00'),
(117, 'Laravel From Scratch [Part 1] - Series Introduction', 'In this video I will talk about what Laravel is and also give you a demo of what we will be building. Laravel is the most popular open source PHP framework and uses the MVC (Model View Controller) design pattern. We will be covering all of the fundamentals of Laravel 5.4 in this series including.... Routing Controllers Models & DB Migrations Blade Templates/Views Authentication & Access Control CRUD Functionality File Uploading Much More...', 'EU7PRmCpx-0', '17:15', 1, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(118, 'Laravel From Scratch [Part 2] - Environment Setup & Laravel Installation', 'In this video we will setup our environment. We will be using XAMPP which gives us an Apache server with PHP and MySQL. We will install Laravel with Composer and we will be using the Git Bash terminal and integrate it with Visual Studio Code', 'H3uRXvwXz1o', '19:44', 2, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(119, 'Laravel From Scratch [Part 3] - Basic Routing & Controllers', 'In this video we will create some routes and a controller for our pages. Ill show you how to load a view from a controller function', 'sLFNVXY0APk', '13:49', 3, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(120, 'Laravel From Scratch [Part 4] - Blade Templating & Compiling Assets', 'In this video I will talk about blade templating. We will look at passing in data, interpolation, adding logic to our views. I will also show you how to compile assets using Laravel Mix. We will compile Sass files to regular css.', 'bSG2YMqJJys', '20:47', 4, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(121, 'Laravel From Scratch [Part 5] - Models & Database Migrations', 'In this video we will start to work with models and database migrations. We will use MySQL as our data store. We will be creating a model and database table for our blog posts', 'neSHAWdE44c', '16:08', 5, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(122, 'Laravel From Scratch [Part 6] - Fetching Data With Eloquent', 'In this video I will show you how to start working with Eloquent which is an ORM (Object Relational Mapper) and it makes working with the database models VERY easy', 'emyIlJPxZr4', '19:29', 6, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(123, 'Laravel From Scratch [Part 7] - Forms & Saving Data', 'In this video we will be creating a form using Laravel Collective to submit blog posts to the database.', '-QapNzUE4V0', '18:53', 7, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(124, 'Laravel From Scratch [Part 8] - Edit & Delete Data', 'In this video we will create the post edit form using Laravel Collective. We will also add the delete functionality and look at method spoofing', 'PAP8IS_ak6w', '9:57', 8, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(125, 'Laravel From Scratch [Part 9] - User Authentication', 'In this video we will add user authentication. We also need to add a user_id column in the posts table in the database. We will implement full login and register functionality', 'ORus3-By4lk', '16:42', 9, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(126, 'Laravel From Scratch [Part 10] - Model Relationships', 'In this video we will create a relationship between users and blog posts. We will add the users posts to their dashboard and make it so when they insert a post the user id also gets put in the table.', '42l4nHl_aUM', '10:04', 10, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(127, 'Laravel From Scratch [Part 11] - Access Control', 'In this video we will implement access control so guests can not add posts and users can only edit and delete their own posts.', 'quiUytHXutM', '8:36', 11, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(128, 'Laravel From Scratch [Part 12] - File Uploading & Finishing Up', 'In this video we will wrap up our application and add file uploading for blog posts. I hope you guys enjoyed this Laravel series. I will look into deployment soon!', 'AL8PCThJ9c4', '24:07', 12, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(129, 'Deploy Laravel To Shared Hosting The Easy Way', 'In this video I will show you how to easily deploy a Laravel application to a shared hosting account with InMotion hosting. We will deploy without having to type in one command. Everything will be done via Cpanel and FTP.', '6g8G3YQtQt4', '13:40', 13, 10, '', '2019-05-26 18:46:09', '0000-00-00 00:00:00'),
(132, 'Vue.js 2.0 Fundamentals - Part 1 (Introduction)', 'The start of a brand new tutorial series about Vue.js 2.0! We will start learning the fundamentals and then move onto more advanced stuff. In this video I introduce the series and explain the organization of the next few videos.', 'vzSjlLzGB1A', '4:09', 1, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(133, 'Vue.js Project Setup - Vue.js 2.0 Fundamentals (Part 2)', 'Learn how to setup a Vue.js 2.0 project in this tutorial. It is actually incredibly simple! All we have to do is load the Vuejs script from a CDN (or locally), then initialize it with one line of code.', 'wr75fuDV9uc', '9:21', 2, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(134, 'Directives in Vue.js 2.0 - Vue.js Fundamentals (Part 3)', 'Tutorial covering Directives in Vue.js 2.0. Directives are like mini-functions that we add to html elements to “boost” them with extra functionality. These are common functions that we tend to find ourselves re-writing every time we make a new website. For example binding values of inputs to variables, tying events to html elements, hiding elements until they load and much more.', 'ZCweh0Q8tyE', '19:08', 3, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(135, 'Using V-Bind Directive - Vue.js 2.0 Fundamentals (Part 4)', 'This Vue.js tutorial covers the use of V-bind to attach data models to our view attributes. This is an easy and helpful way to take our Vue data models and attach them to attributes on html elements with the same power of binding that you see with everything else in Vue.', '7ZjNQ92Pl3c', '8:17', 4, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(136, 'Looping with V-For Directive - Vue.js 2.0 Fundamentals (Part 5)', 'Tutorial covering the v-for directive allowing us to create loops in our html elements. This is great for making lists, or looping through resources for a truly dynamic experience.', 'SnlJ-iXBTdM', '7:42', 5, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(137, '2-Way Binding in Vue with V-Model - Vue.js 2.0 Fundamentals (Part 6)', 'This Vue.js tutorial covers 2 way binding in Vue.js and what it means for our applications. Actually putting 2 way binding to use it very simple because it happens automatically, so we will spend the majority of this episode discussing why it is powerful and how you can use it.', 'nEdsu6heW9o', '8:35', 6, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(138, 'Event Handling in Vue - Vue.js 2.0 Fundamentals (Part 7)', 'Vue.js 2.0 Tutorial demonstrating how to use events in Vue. You might be familiar with events already if you come from any other javascript background or framework. Events are things like Hover or Click that happen when your application is running.', '4PXXQzME5no', '20:39', 7, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(139, 'Computed Properties in Vue - Vue.js 2.0 Fundamentals (Part 8)', 'This Vue.js tutorial covers computed properties in your Vue.js 2.0 application. Computed properties allows us to have reactive data models that are based off other data models. As any of the data models that it relies on change the computed property changes also.', '3nYlioo9Ta4', '20:29', 8, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(140, 'Getter & Setter Computed Properties - Vue.js 2.0 Fundamentals (Part 9)', 'This Vue.js tutorial covers computed property getter and setter methods in your Vue.js 2.0 application. If you want to learn about general computed properties then you might want to go back and watch the previous video (part 8) first and then this video which picks up where that one left off.', 'PuxdMnk-u5k', '21:12', 9, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(141, 'AJAX to External API - Vue.js 2.0 Fundamentals (Part 10)', 'This Vue.js Tutorial will cover using Ajax to call an external API and update it live to the user. This was inspired from a real life project I did this week which we will recreate for this video. If you are looking for the source code to follow along, download it from Github in the links below.', 'KT-yhTnIf_k', '37:44', 10, 11, '', '2019-05-26 18:54:21', '0000-00-00 00:00:00'),
(142, 'AngularJS Tutorial: [#1] Welcome! - Getting Started with AngularJS', 'Looking for Angular 2? Check out the same tutorial using Angular 2 at Angularcasts!', '8RThQD0-7fA', '0:46', 1, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(143, 'AngularJS Tutorial: [#2] Installation and Set Up - Getting Started with AngularJS', '', 'UzvyuYEAU8o', '9:53', 2, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(144, 'AngularJS Tutorial: [#3] Controllers and Views - Getting Started with AngularJS', '', '8_oJ9K2heMA', '11:31', 3, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(145, 'AngularJS Tutorial: [#4] Switching to Services - Getting Started with AngularJS', '', 'MVSZOw9rkD0', '5:47', 4, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(146, 'AngularJS Tutorial: [#5] HTTP - Getting Started with AngularJS', '', 'xce8j3g-T04', '5:08', 5, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(147, 'AngularJS Tutorial: [#6] Creating the User Interface - Getting Started with AngularJS', '', 'V9HxQK-6FPM', '11:12', 6, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(148, 'AngularJS Tutorial: [#7] Custom Filters - Getting Started with AngularJS', '', 'xboZkynQ-2w', '8:55', 7, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(149, 'AngularJS Tutorial: [#8] Creating New Data - Getting Started with AngularJS', '', 'z1HfiQihVcA', '10:55', 8, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(150, 'AngularJS Tutorial: [#9] Editing and Deleting Data - Getting Started with AngularJS', '', 'n0FL5XWk0M0', '10:28', 9, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(151, 'AngularJS Tutorial: [#10] Thanks for Watching! - Getting Started with AngularJS', '', 'tpywrnc6VjY', '0:57', 10, 13, '', '2019-05-26 19:05:38', '0000-00-00 00:00:00'),
(152, 'Inroduction node js tutorial for beginners zero to hero', '', '4bRwHnTVJj8', '1:22', 1, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(153, 'NodeJS - Install the NodeJS', '', 'vnE1WybFAvI', '2:25', 2, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(154, 'NodeJS - Learn to use the REPL and run the files', '', 'wrv1DaI5RUk', '5:03', 3, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(155, 'NodeJS - Asynchronous Pattern', '', 'E2NTGK-_vh0', '9:04', 4, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(156, 'NodeJS - Scope in Node', '', 'yYfiTP5q6XY', '5:01', 5, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(157, 'NodeJS - Learn the Modules', '', 'Ebk5Aylod94', '7:41', 6, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(158, 'NodeJS - The Event Emitter', '', '2z4bl-Q920c', '5:50', 7, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(159, 'NodeJS - The Utilities', '', 'rFCGVIo0AUU', '6:39', 8, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(160, 'NodeJS - Path Tools', '', 'LVDy9x4Ff2Y', '5:15', 9, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(161, 'The Streams', '', 'hnjWmbMPZ3c', '9:36', 10, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(162, 'NodeJS - Working With Local Files', '', 'ZkyMXk38q7Y', '4:28', 11, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(163, 'NodeJS - Input and Output', '', '3bqaMwYESCQ', '6:01', 12, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(164, 'NodeJS - Building the Web Servers', '', 'hWdq-aOHbjo', '4:17', 13, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(165, 'NodeJS - Other APIs', '', 'ToSQ4-AGjvY', '4:01', 14, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(166, 'NodeJS - NPM', '', 'mWtFCv312Lw', '7:56', 15, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(167, 'NodeJS - Third Party Modules', '', 'v3Kkmykgv8U', '5:50', 16, 14, '', '2019-05-26 19:15:23', '0000-00-00 00:00:00'),
(168, 'ReactJS Basics - #1 What is React?', 'This ReactJS Tutorial dives into the Question what ReactJS actually is and why you might want to use it.', 'JPT3bFIwJYA', '5:16', 1, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(169, 'ReactJS Basics - #2 Setup Workspace with Webpack', 'This ReactJS Tutorial shows how to set up a Workspace using Webpack.', 'uextYhQGP6k', '26:18', 2, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(170, 'ReactJS Basics - #2.5 Set up Git', 'Just a little in-between video, showing how to set up Git and .gitignore for the project.', 'LEu7FxUUr90', '1:43', 3, 14, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(171, 'ReactJS Basics - #3 First Component', 'Time to create the first ReactJS Component - that\'s what its all about, right? Also learn how to render it to the DOM.', 'G40iHC-h0c0', '9:59', 4, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(172, 'ReactJS Basics - #4 Multiple Components', 'One React Component is great, multiple Components are better. Let\'s add some and learn how to nest them.', '9wK4gHoOh1g', '6:19', 5, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(173, 'ReactJS Basics - #5 Outputting dynamic Data', 'Using ReactJS to only show static content probably isn\'t what you want. Time to learn which Syntax allows us to output dynamic Data in the render() function.', '1JZEmYwRGoU', '3:27', 6, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(174, 'ReactJS Basics - #6 Passing Data with Props', 'React Components should be able to interact. Props allow you to pass Data from a Parent Component to a Child Component.', 'GIU8ekYndKw', '16:15', 7, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(175, 'ReactJS Basics - #7 Events & ReactJS', 'User Input is extremely important, which is why we need to handle Events, too. ReactJS makes this very easy as this video shows.', 'OcM__8q6p4c', '7:46', 8, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(176, 'ReactJS Basics - #8 State of Components', 'Updating and re-rendering the DOM would be nice. ReactJS uses State to - well - track the State of a Component and decide if it needs to update the DOM.', 'e5n9j9n83OM', '5:26', 9, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(177, 'ReactJS Basics - #9 How does ReactJS update the DOM?', 'How does ReactJS update the DOM? This Tutorial explains how ReactJS finds out if and which parts need to be updated.', 'Iw2BLUjQo1E', '5:06', 10, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(178, 'ReactJS Basics - #10 Stateless Components', 'Some ReactJS Components don\'t need State. Just leave it out then - learn more about Stateless Components.', 'SEkfzqIgvTo', '3:50', 11, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(179, 'ReactJS Basics - #11 Communicating between Parent and Child Component', 'Parent-Child-Communication is an important thing - learn how ReactJS allows you to communicate between both.', '2teBTI0_eRw', '4:06', 12, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(180, 'ReactJS Basics - #12 Passing Data between Parent and Child Components', 'Parent-Child-Communication often times also requires the exchange of Data. Learn how to pass Data between Parent and Child Components.', '5Xew--ycx0o', '6:50', 13, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(181, 'ReactJS Basics - #13 Two-Way-Binding', 'When working with Forms, you sometimes want to use Two-Way-Binding. Learn more about it - in this video.', 'IK9k9hSuYeA', '8:47', 14, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(182, 'ReactJS Basics - #14 Component Lifecycle', 'ReactJS Components follow a specific Lifecycle - from Creation to Unmounting them. Learn more about in this video.', 'Oioo0IdoEls', '18:58', 15, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(183, 'ReactJS Basics - #15 React Router - Route Setup', 'For a SPA, you need a Router. ReactJS Router is a powerful Router which allows you to create & use Routes in your app!', 'eofpZPRUnP8', '19:33', 16, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(184, 'ReactJS Basics - #16 React Router - Navigation & Parameters', 'For a SPA, you need a Router. ReactJS Router is a powerful Router which allows you to create, manage and use Routes in your application. Time to use all the Routes, navigate between them and pass some parameters!', '5pt_igBTCsI', '9:49', 17, 15, '', '2019-05-26 19:30:21', '0000-00-00 00:00:00'),
(185, 'MongoDB Tutorial #1 - Introduction to MongoDB', ' Hey gang, in this MongoDB tutorial for beginners, I\'ll introduce you to what MongoDB is, and how we can use it to store and persist data in our web applications. MongoDB is a NoSQL database, making it perfect for working with Node.js applications and JavaScript.', '9OPP_1eAENg', '4:55', 1, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(186, 'MongoDB Tutorial #2 - Installing MongoDB Locally', 'Once we\'ve installed MongoDB, we\'ll also install Mongoose using npm.I\'ll show you how to install MongoDB locally to your computer (Windows). However, installing on OS X or Linux is also very easy (links provided):', 'wLNL2HTvcVw', '8:04', 2, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(187, 'wLNL2HTvcVw', ' I\'ll shows you how we can connect to MongoDB using \'mongodb.connect\'. To connect, we\'ll need to pass the method a connection string which matches up to the location of our database. ', 'oT2HOw3fWp4', '7:31', 3, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(188, 'MongoDB Tutorial #4 - Models and Collections', 'I\'ll explain what collections, schemas and models are - then put it into practise by creating a new model and schema for our project. ', 'gmlm7W1PZMA', '7:02', 4, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(189, 'MongoDB Tutorial #5 - Intro to Mocha Testing', 'we\'ll take a look at Mocha and how we can use it to set up a nice testing playground for the rest of our course. ', '6JUIxSOu4Q0', '8:26', 5, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(190, 'MongoDB Tutorial #6 - Saving Data to MongoDB', 'I\'ll be showing you how we can save data to the database using the save() method from mongoose. ', '2oYtk83FZCA', '9:40', 6, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(191, 'MongoDB Tutorial #7 - ES6 Promises', 'I\'ll show you how we can implement the ES6 promise library instead of using the Mongoose default one. I\'ll also introduce you to mocha hooks, which we can use to fire code before our tests begin.', 'fUT4z1eQ6kM', '5:02', 7, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(192, 'MongoDB Tutorial #8 - Robomongo', 'I\'ll introduce you to a tool called Robomongo (link below). Robomongo is a free tool which can give us a visual representation of our data in mongodb', 'aPd_4hHxm4A', '5:04', 8, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(193, 'MongoDB Tutorial #9 - Dropping a Collection', 'I\'ll show you how to drop a collection using one of mongoose\'s methods. ', '5dhoyoet0Fk', '6:18', 9, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(194, 'MongoDB Tutorial #10 - Finding Records', 'I want to show you how to search for and find records using Mongoose. We do this via a number of methods, but the ones we\'ll be looking at in this series are find() and findOne().', 'I-Kt3M8ljSE', '8:03', 10, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(195, 'MongoDB Tutorial #11 - Object ID', 'MongoDB Tutorial #11 - Object ID', 'nM9bA4NtoHY', '6:37', 11, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(196, 'nM9bA4NtoHY', 'I\'ll show you how we can delete records from the database. We can do this a number of ways, but we\'ll be looking at the findOneAndDelete() method in this tutorial.', 'ut8oZDiGSWc', '6:16', 12, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(197, 'MongoDB Tutorial #13 - Updating Records', ' we\'ll take a look how to update records already saved to the database using update() and findOneAndUpdate().', 'Hu3m6gBcrnA', '6:49', 13, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(198, 'MongoDB Tutorial #14 - Update Operators', 'I\'ll be showing you how we can use update operators to change our data. In particular, we\'ll take a look at the increment operator. Find a full list at:', 'DeAWKJJng30', '6:22', 14, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(199, 'MongoDB Tutorial #15 - Relational Data', 'I\'ll be showing you how we can store relational data, by nesting documents.', '9JZJsChpwKs', '6:36', 15, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00'),
(200, 'MongoDB Tutorial #16 - Nesting Sub Documents', 'I\'ll show you how we can nest sub-documents. ', '1ANDrQrP0uQ', '13:58', 16, 16, '', '2019-05-26 20:03:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_attach`
--

CREATE TABLE `lesson_attach` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `attach_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(14, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(15, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(16, '2016_06_01_000004_create_oauth_clients_table', 1),
(17, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(18, '2019_03_22_132029_create_social_facebook_accounts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mohamedaldomany60521@yahoo.com', '$2y$10$sEK09SZW.cLIkfyClkBgR.G1MJQPesBmOk/JJe4lVe5Q9W21o9PRK', '2018-10-23 15:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Browse', 'Browse the content of the Course that suits you with the possibility  of choosing more than one content..', '2019-06-03 20:30:56', '2018-10-27 12:37:50'),
(2, 'Academic', 'We pave the way for you to become developer from  scratch to Professionalism..', '2019-06-03 20:30:48', '2018-11-14 17:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `profile_track`
--

CREATE TABLE `profile_track` (
  `id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `track_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_no` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `choise1` varchar(255) NOT NULL,
  `choise2` varchar(255) NOT NULL,
  `choise3` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `exam_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question_no`, `question`, `choise1`, `choise2`, `choise3`, `answer`, `exam_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'what does html stand for', 'hyperlinks and text markup language', 'hyper text markup language', 'home tool markup language', 'hyper text markup language', 1, '2018-12-15 15:39:28', '0000-00-00 00:00:00'),
(2, 2, 'choose the correct html element for the largest heading ', '<h6>', '<h1>', '<head>', '<h1>', 1, '2018-12-15 15:39:28', '0000-00-00 00:00:00'),
(3, 3, 'what is the correct html for creating a hyperlink', '<a>http://www.hypercode.com</a>', '<a href=\"http://www.hypercode.com\"></a>', '<a url=\"http://www.hypercode.com\"></a>', '<a href=\"http://www.hypercode.com\"></a>', 1, '2019-06-04 00:07:58', '0000-00-00 00:00:00'),
(4, 4, 'which of these elements are all <table> elements', '<thead><body><tr>', '<table><tr><td>', '<table><tr><tt>', '<table><tr><td>', 1, '2019-06-04 00:08:01', '0000-00-00 00:00:00'),
(5, 5, 'how can you make a numbered list ', '<list>', '<ol>', '<ul>', '<ol>', 1, '2019-06-04 00:08:05', '0000-00-00 00:00:00'),
(6, 6, 'what is the correct html for making a text input field', '<input type=\"textfield\">', '<input type=\"text\">', '<textfield>', '<input type=\"text\">', 1, '2019-06-04 00:08:08', '0000-00-00 00:00:00'),
(7, 7, 'what is the correct html for making a drop-down list', '<list>', '<select>', '<input type=\"list\">', '<select>', 1, '2019-06-04 00:08:10', '0000-00-00 00:00:00'),
(8, 8, 'what is the correct html for inserting an image', '<img href=\"img.gif\" alt=\"myimg\">', '<img src=\"img.gif\" alt=\"myimg\">', '<image src=\"img.gif\" alt=\"myimg\">', '<img src=\"img.gif\" alt=\"myimg\">', 1, '2019-06-04 00:08:14', '0000-00-00 00:00:00'),
(9, 9, 'An <iframe> is used to display a web page within a web page.', 'false', 'true', 'There is no such thing as an <iframe>\r\n', 'true', 1, '2019-06-04 00:08:18', '0000-00-00 00:00:00'),
(10, 10, 'What is the correct HTML element for playing video files', '<media>', '<video>', '<movie>', '<video>', 1, '2019-06-04 00:08:20', '0000-00-00 00:00:00'),
(11, 1, 'What does CSS stand for?', 'Creative Style Sheets', 'Colorful Style Sheets', 'Cascading Style Sheets', 'Cascading Style Sheets', 2, '2019-05-25 22:33:39', '0000-00-00 00:00:00'),
(12, 2, 'What is the correct HTML for referring to an external style sheet?', '<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyle.css\">', '<stylesheet>mystyle.css</stylesheet>', '<style src=\"mystyle.css\">', '<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyle.css\">', 2, '2019-05-25 22:33:42', '0000-00-00 00:00:00'),
(13, 3, 'Where in an HTML document is the correct place to refer to an external style sheet?', 'at the end of the document', 'in the <body> section', 'in the <head> section', 'in the <head> section', 2, '2019-05-25 22:33:45', '0000-00-00 00:00:00'),
(14, 4, 'Which HTML attribute is used to define inline styles?', 'class', 'style', 'styles', 'style', 2, '2019-05-25 22:33:48', '0000-00-00 00:00:00'),
(15, 5, 'Which is the correct CSS syntax?', 'body:color=black;', 'body{color:black;}', '{body:color=black;}', 'body{color:black;}', 2, '2019-05-25 22:33:53', '0000-00-00 00:00:00'),
(16, 6, 'Which property is used to change the background color?', 'color', 'bgcolor', 'background-color', 'background-color', 2, '2019-05-25 22:33:56', '0000-00-00 00:00:00'),
(17, 7, 'How do you add a background color for all <h1> elements?', 'h1{background-color:#fff}', 'all.h1{background-color:#fff}', 'h1.all{background-color:#fff}', 'h1{background-color:#fff}', 2, '2019-05-25 22:33:59', '0000-00-00 00:00:00'),
(18, 8, 'Which CSS property controls the text size?', 'font-size', 'text-size', 'text-style', 'font-size', 2, '2019-05-25 22:34:05', '0000-00-00 00:00:00'),
(19, 9, 'How do you display hyperlinks without an underline?', 'a{decoration:no-underline}', 'a{text-decoration:no-underline}', 'a{decoration:none}', 'a{text-decoration:no-underline}', 2, '2019-05-25 22:34:08', '0000-00-00 00:00:00'),
(20, 10, 'When using the padding property; are you allowed to use negative values?', 'yes', 'no', 'none of the above', 'yes', 2, '2019-05-25 22:34:12', '0000-00-00 00:00:00'),
(21, 1, 'Inside which HTML element do we put the JavaScript?', '<js>', '<scripting>', '<script>', '<script>', 4, '2019-05-25 23:01:21', '0000-00-00 00:00:00'),
(22, 2, 'Choose the correct JavaScript syntax to change the content of the following HTML code.\r\n\r\n<p id=\"hyper\">HyperCodingZone</p>', 'document.getElement(“hyper”).innerHTML=”I am a Hyper”;', 'document.getElementById(“hyper”).innerHTML=”I am a Hyper”;', 'document.getId(“hyper”)=”I am a Hyper”;', 'document.getElementById(“hyper”).innerHTML=”I am a Hyper”;', 4, '2019-05-25 23:01:40', '0000-00-00 00:00:00'),
(23, 3, 'Which of the following is the correct syntax to display “HyperCodingZone” in an alert box using JavaScript?', 'alertbox(“HyperCodingZone”);', 'msg(“HyperCodingZone”);', 'alert(“HyperCodingZone”);', 'alert(“HyperCodingZone”);', 4, '2019-05-25 23:01:43', '0000-00-00 00:00:00'),
(24, 4, 'What is the correct syntax for referring to an external script called “hyper.js”?', '<script src=”hyper.js”>', '<script href=”hyper.js”>', '<script ref=”hyper.js”>', '<script src=”hyper.js”>', 4, '2019-05-25 23:01:50', '0000-00-00 00:00:00'),
(25, 5, 'The external JavaScript file must contain <script> tag. True or False?', 'true.', 'false.', 'not necessary.', 'not necessary.', 4, '2019-05-25 23:01:53', '0000-00-00 00:00:00'),
(26, 6, 'Predict the output of the following JavaScript code.\r\n\r\n<script type=\"text/javascript\"> \r\na = 8 + \"8\"; \r\ndocument.write(a); \r\n</script>', '16', '88', 'compilation error', '88', 4, '2019-05-25 23:01:56', '0000-00-00 00:00:00'),
(27, 7, 'Predict the output of the following JavaScript code.\r\n\r\n<script type=\"text/javascript\"> \r\nvar a=\"HyperCodingZoneHHH\"; \r\nvar x=a.lastIndexOf(\"H\"); \r\ndocument.write(x); \r\n</script> ', '18', '0', '9', '18', 4, '2019-05-25 23:02:00', '0000-00-00 00:00:00'),
(28, 8, 'Which of the following is not a reserved word in JavaScript?', 'interface', 'throws', 'program', 'program', 4, '2019-05-25 23:02:04', '0000-00-00 00:00:00'),
(29, 9, 'Predict the output of the following JavaScript code.\r\n\r\n<script type=\"text/javascript\" language=\"javascript\"> \r\n\r\nvar x=5; \r\nvar y=6; \r\nvar res=eval(\"x*y\"); \r\ndocument.write(res); \r\n\r\n</script> ', '30', '\"30\"', '5*6', '30', 4, '2019-05-25 23:02:07', '0000-00-00 00:00:00'),
(30, 10, 'Predict the output of the following JavaScript code.\r\n\r\n<script type=\"text/javascript\" language=\"javascript\"> \r\n\r\nvar a = \"HyperCodingZone\"; \r\nvar result = a.substring(4, 5); \r\ndocument.write(result); \r\n\r\n</script> ', 'r', 'er', 'rC', 'r', 4, '2019-05-25 23:02:12', '0000-00-00 00:00:00'),
(31, 1, 'What does PHP stand for?', 'Personal Hypertext Processor', 'Private Home Page', 'PHP:Hypertext Preprocessor', 'Personal Hypertext Processor', 3, '2019-05-25 23:00:46', '0000-00-00 00:00:00'),
(32, 2, 'PHP server scripts are surrounded by delimiters, which?', '<script></script>', '<?php............?>', '<?php></?>', '<?php............?>', 3, '2019-05-25 23:00:49', '0000-00-00 00:00:00'),
(33, 3, 'How do you write \"Hello World\" in PHP', 'Document.write(\"Hello World\");', 'echo \"Hello World\";', '\"Hello World\";', 'echo \"Hello World\";', 3, '2019-05-25 23:00:52', '0000-00-00 00:00:00'),
(34, 4, 'All variables in PHP start with which symbol?', '&', '$', '!', '$', 3, '2019-05-25 23:00:56', '0000-00-00 00:00:00'),
(35, 5, 'How do you get information from a form that is submitted using the \"get\" method?', '$_GET[];', 'Request.Form;', 'Request.QueryString;', '$_GET[];', 3, '2019-05-25 23:01:00', '0000-00-00 00:00:00'),
(36, 6, 'What is the correct way to include the file \"time.inc\" ?', '<?php include:\"time.inc\"; ?>', '<?php include file=\"time.inc\"; ?>', '<?php include \"time.inc\"; ?>', '<?php include \"time.inc\"; ?>', 3, '2019-05-25 23:01:02', '0000-00-00 00:00:00'),
(37, 7, 'How do you create a cookie in PHP?', 'makecookie();', 'setcookie();', 'createcookie();', 'setcookie();', 3, '2019-05-25 23:01:05', '0000-00-00 00:00:00'),
(38, 8, 'How do you create an array in PHP?', '$cars = array[\"volvo\",\"bmw\",\"toyota\"];', '$cars = array[(\"volvo\",\"bmw\",\"toyota\")];', '$cars = array(\"volvo\",\"bmw\",\"toyota\");', '$cars = array(\"volvo\",\"bmw\",\"toyota\");', 3, '2019-05-25 23:01:07', '0000-00-00 00:00:00'),
(39, 9, 'The die() and exit() functions do the exact same thing.', 'False', 'True', 'none of the above', 'False', 3, '2019-05-25 23:01:12', '0000-00-00 00:00:00'),
(40, 10, 'When using the POST method, variables are displayed in the URL:', 'False', 'True', 'none of the above', 'False', 3, '2019-05-25 23:01:16', '0000-00-00 00:00:00'),
(41, 1, 'How can you get the total number of arguments passed to a function?', 'Using args.length property', 'Using arguments.length property', 'Both of the above.', 'Using arguments.length property', 5, '2019-05-25 23:14:16', '0000-00-00 00:00:00'),
(42, 2, 'Which built-in method returns the length of the string?', 'length()', 'size()', 'index()', 'length()', 5, '2019-05-25 23:14:21', '0000-00-00 00:00:00'),
(43, 3, 'Which built-in method returns the characters in a string beginning at the specified location?', 'substr()', 'getSubstring()', 'slice()', 'substr()', 5, '2019-05-25 23:14:26', '0000-00-00 00:00:00'),
(44, 4, 'Which of the following jQuery method adds the specified class if it is not present, remove the specified class if it is present?', 'toggleStyleClass( class )', 'toggleClass( class )', 'toggleCSSClass( class )', 'toggleClass( class )', 5, '2019-05-25 23:14:29', '0000-00-00 00:00:00'),
(45, 5, 'Which of the following jQuery method removes elements matching the specified selector from the set of matched elements?', 'getNotEquals( selector )', 'isNotEquals( selector )', 'not(selector)', 'not(selector)', 5, '2019-05-25 23:14:32', '0000-00-00 00:00:00'),
(46, 6, 'Which of the following jQuery method finds all sibling elements after the current element?', 'locateNextAll( selector )', 'getNextAll( selector)', 'nextAll( selector )', 'nextAll( selector )', 5, '2019-05-25 23:14:35', '0000-00-00 00:00:00'),
(47, 7, 'Which of the following jQuery method sets the height property of an element?', 'setCSSHeight( value )', 'setHeight( value)', 'height( value )', 'height( value )', 5, '2019-05-25 23:14:38', '0000-00-00 00:00:00'),
(48, 8, 'Which of the following jQuery method checks if event.preventDefault() was ever called on this event object?', 'isDefaultPrevented( )', 'isPropagationStopped( )', 'isImmediatePropagationStopped( )', 'isDefaultPrevented( )', 5, '2019-05-25 23:14:41', '0000-00-00 00:00:00'),
(49, 9, 'Which of the following jQuery method stops the rest of the event handlers from being executed?', 'preventDefault( )', 'stopPropagation( )', 'stopImmediatePropagation( )', 'stopImmediatePropagation( )', 5, '2019-05-25 23:14:45', '0000-00-00 00:00:00'),
(50, 10, 'Which of the following jQuery method can be used to attach a function to be executed whenever an AJAX request is sent?', 'ajaxStart( callback )', 'ajaxComplete( callback )', 'ajaxSend( callback )', 'ajaxSend( callback )', 5, '2019-05-25 23:14:48', '0000-00-00 00:00:00'),
(51, 1, 'Which of the following is correct about Bootstrap Mobile First Strategy?', 'You need to add the viewport meta tag to the element, to ensure proper rendering and touch zooming on mobile devices.', 'width property controls the width of the device. Setting it to device-width will make sure that it is rendered across various devices (mobiles,desktops,tablets...) properly.', 'All of the choises.', 'All of the choises.', 7, '2019-05-25 23:46:44', '0000-00-00 00:00:00'),
(52, 2, 'Which of the following class styles a table with borders surrounding every element and rounded corners around the entire table?', '.table', '.table-striped', '.table-bordered', '.table-bordered', 7, '2019-05-25 23:46:47', '0000-00-00 00:00:00'),
(53, 3, 'Which of the following bootstrap style of button deemphasize a button by making it look like a link while maintaining button behavior?', '.btn-warning', '.btn-link', '.btn-danger', '.btn-link', 7, '2019-05-25 23:46:51', '0000-00-00 00:00:00'),
(65, 4, 'Which of the following bootstrap style of button makes the button size small?', '.btn-sm', '.btn-lg', '.btn-xs', '.btn-sm', 7, '2019-05-25 23:46:28', '0000-00-00 00:00:00'),
(66, 5, 'Which of the following bootstrap style is used to add button to .navbar?', '.navbar-.btn', '.form-.btn', 'None of the above.', '.navbar-.btn', 7, '2019-05-25 23:46:28', '0000-00-00 00:00:00'),
(67, 6, 'Which of the following bootstrap style can be used to customize .pagination links?', '.pagination-active, .pagination-disabled', '.menu-active, .menu-disabled', '.disabled, .active', '.disabled, .active', 7, '2019-05-25 23:46:28', '0000-00-00 00:00:00'),
(68, 7, 'Which of the following bootstrap styles can be used to create a striped progress bar?', '.progress-bar-success, .progress-bar-info, .progress-bar-warning, .progress-bar-danger', '.success, .info, .warning, .danger', '.progress-striped.', '.progress-striped.', 7, '2019-05-25 23:46:28', '0000-00-00 00:00:00'),
(69, 8, 'Which of the following is correct about Modal Plugin?', 'You can toggle the modal plugin\'s hidden content via data attributes.', 'You can toggle the modal plugin\'s hidden content via javascript.', 'Both of the choises.', 'Both of the choises.', 7, '2019-05-25 23:46:28', '0000-00-00 00:00:00'),
(70, 9, 'Which of the following is correct about Tab Plugin?', 'You can toggle the Tab plugin\'s hidden content via data attributes.', 'You can toggle the Tab plugin\'s hidden content via javascript.', 'Both of the choises.', 'Both of the choises.', 7, '2019-05-25 23:46:28', '0000-00-00 00:00:00'),
(71, 10, 'Which of the following is correct about data-selector Data attribute of Popover Plugin?', 'Applies a CSS fade transition to the popover.', 'Specifies how to position the popover (i.e., top|bottom|left|right|auto).', 'Delegates to the specified targets.', 'Delegates to the specified targets.', 7, '2019-05-25 23:46:28', '0000-00-00 00:00:00'),
(72, 1, 'STUDENTS(student_code, first_name, last_name, email, \r\n         phone_no, date_of_birth, honours_subject, percentage_of_marks);\r\n\r\nWhich of the following query would display names of all students in descending order of percentage of marks?', 'select first_name, last name, percentage_of_marks from students order by percentage_of_marks;', 'select first_name, last name, percentage_of_marks order by percentage_of_marks desc from students;', 'select first_name, last name, percentage_of_marks from students order by percentage_of_marks desc;', 'select first_name, last name, percentage_of_marks from students order by percentage_of_marks desc;', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(73, 2, 'What is returned by TRUNC(789.8389, 2)?', '789.84', '789.83', '789.00', '789.83', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(74, 3, 'For some particular assignment, you need to compare two values, if both are equal, the result would be null, and if the values are not equal then the first value should be returned. Which function should you use?', 'NVL', 'NVL2', 'NULLIF', 'NULLIF', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(75, 4, 'Which of the following is true about a group function?', 'Group functions operate on sets of rows to produce multiple results per group.', 'DISTINCT keyword makes a group function consider duplicate values.', 'Group functions ignore null values.', 'Group functions ignore null values.', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(76, 5, 'STUDENTS(student_code, first_name, last_name, email, \r\n         phone_no, date_of_birth, honours_subject, percentage_of_marks);\r\n\r\nWhich of the following query will correctly display name of all the students who got more marks than the student ‘0215/15’?', 'select first_name, last_name from students \r\n\r\nwhere percent_of_marks > \r\n	(select percentage_of_marks from students\r\n		where student_code = ‘0215/15’);', 'select first_name, last_name from students \r\nhaving percent_of_marks > \r\n	(select percentage_of_marks from students\r\n		where student_code = ‘0215/15’);', 'select first_name, last_name from students \r\nusing percent_of_marks > \r\n	(select select percentage_of_marks from students\r\n		where student_code = ‘0215/15’);', 'select first_name, last_name from students \r\n\r\nwhere percent_of_marks > \r\n	(select percentage_of_marks from students\r\n		where student_code = ‘0215/15’);', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(77, 6, 'Which of the following is true about inserting news rows to a table?', 'You must list values in the default order of the columns in the table.', 'You can also list the columns in the INSERT clause.', 'All of the ans.', 'All of the ans.', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(78, 7, 'Which of the following is not true about the database objects?', 'Indexes improve performance of queries.', 'Sequences are numeric value generators.', 'Views give alternative names to objects.', 'Views give alternative names to objects.', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(79, 8, 'Which of the following code will remove all the rows from the table LOCATIONS?', 'DROP TABLE locations;', 'DELETE TABLE locations;', 'TRUNCATE TABLE locations;', 'TRUNCATE TABLE locations;', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(80, 9, 'Which of the following code will delete a view named all_marks_english?', 'delete view all_marks_english;', 'drop view all_marks_english;', 'delete all_marks_english;', 'drop view all_marks_english;', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(81, 10, 'Which of the following is a system privilege?', 'Creating new users', 'Removing users', 'All of the ans.', 'All of the ans.', 6, '2019-05-25 23:59:39', '0000-00-00 00:00:00'),
(82, 1, 'All of the configuration files for the Laravel framework are stored what directory?', 'vendors', 'app', 'config', 'config', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(83, 2, 'Models are placed in this directory by default', 'App', 'Models', 'Providers', 'App', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(84, 3, 'Laravel is based on which language?', 'Python', 'PHP', 'Java', 'PHP', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(85, 4, 'the command that used to migrate the tables to database?', 'php artisan migrate', 'php artisan make:migration tablename', 'php artisan tinker', 'php artisan migrate', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(86, 5, 'where is the database tables added?', 'in the migration folder', 'in the database folder', 'in the App folder', 'in the migration folder', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(87, 6, 'the command that used for make authentication system', 'php artisan make:auth', 'php artisan make:authentication', 'php artisan add:authentication', 'php artisan make:auth', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(88, 7, 'where is the php files added?', 'in the controller folder', 'in the public folder', 'in the config folder', 'in the controller folder', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(89, 8, 'the command that used for create new table', 'php artisan make:migration create_users_table', 'php artisan make:table create_users_table', 'php artisan make:migrate create_users_table', 'php artisan make:migration create_users_table', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(90, 9, 'the command that used for create new controller with models,factory', 'php artisan add:ControllerName -m', 'php artisan make:ControllerName -a', 'php artisan make:ControllerName -all', 'php artisan make:ControllerName -a', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(91, 10, 'To generate a seeder what is of this commands is true', 'php artisan make:seeder UsersTableSeeder', 'php artisan make:seed UsersTableSeeder', 'php artisan make:factory UsersTableSeeder', 'php artisan make:seeder UsersTableSeeder', 8, '2019-05-26 12:37:56', '0000-00-00 00:00:00'),
(92, 1, '$.ajax()', 'Performs an async AJAX request', 'Handle custom Ajax options or modify existing options before each request is sent and before they are processed by $.ajax()', 'Sets the default values for future AJAX requests', 'Performs an async AJAX request', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(93, 2, '$.getScript()', 'Loads (and executes) a JavaScript from a server using an AJAX HTTP GET request', 'Loads (and executes) a JavaScript from a server using an AJAX HTTP GET request', 'Specifies a function to run when the AJAX request completes', 'Loads (and executes) a JavaScript from a server using an AJAX HTTP GET request', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(94, 3, 'ajaxSend()', 'Specifies a function to run before the AJAX request is sent', 'Specifies a function to run when the first AJAX request begins', 'Specifies a function to run when an AJAX request completes successfully', 'Specifies a function to run before the AJAX request is sent', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(95, 4, 'serializeArray()', 'Encodes a set of form elements as a string for submission', 'Loads data from a server and puts the returned data into the selected element', 'Encodes a set of form elements as an array of names and values', 'Encodes a set of form elements as an array of names and values', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(96, 5, 'get()', 'Get the DOM elements matched by the selector', 'Attaches data to, or gets data from, selected elements', 'Execute a function for each matched element', 'Get the DOM elements matched by the selector', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(97, 6, 'removeData()', 'Removes a previously-stored piece of data', 'Get the DOM elements matched by the selector', 'Search for a given element from among the matched elements', 'Removes a previously-stored piece of data', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(98, 7, '$.noConflict()', 'Release jQuery\'s control of the $ variable', 'Attaches data to, or gets data from, selected elements', 'Execute a function for each matched element', 'Release jQuery\'s control of the $ variable', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(99, 8, '$.ajaxPrefilter()', 'Handle custom Ajax options or modify existing options before each request is sent and before they are processed by $.ajax()', 'Loads JSON-encoded data from a server using a HTTP GET request', 'Loads data from a server using an AJAX HTTP POST request', 'Handle custom Ajax options or modify existing options before each request is sent and before they are processed by $.ajax()', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(100, 9, '$.post()', 'Loads data from a server using an AJAX HTTP GET request', 'Loads data from a server using an AJAX HTTP POST request', 'Loads (and executes) a JavaScript from a server using an AJAX HTTP GET request', 'Loads data from a server using an AJAX HTTP POST request', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(101, 10, 'ajaxError()', 'Specifies a function to run when the AJAX request completes with an error', 'Specifies a function to run when all AJAX requests have completed', 'Loads data from a server and puts the returned data into the selected element', 'Specifies a function to run when the AJAX request completes with an error', 9, '2019-05-26 13:04:45', '0000-00-00 00:00:00'),
(102, 1, 'which keyword is used to create constant in vue.js?', 'define', 'const', 'constant', 'const', 10, '2019-05-26 13:23:25', '0000-00-00 00:00:00'),
(103, 2, 'What is the short form of v-bind?', ':', ';', 'bind', ':', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(104, 3, 'How to use for loop in vue js?', 'vFor', 'v-for', '*v-for', 'v-for', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(105, 4, 'Which of the following is not represent the non mutating methods ?', 'Reversr()', 'Filter', 'Slice()', 'Slice()', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(106, 5, 'What is the short form of v-on of following code?\r\n<a v-on:click=”perform-task”> click</a>', '<a @click=\"performtask\"> click</a>', '<a :click=\"performtask\"> click</a>', '<a v-click=\"performtask\"> click</a>', '<a @click=\"performtask\"> click</a>', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(107, 6, 'v-show doest not support the <template> element?', 'true', 'false', 'none', 'false', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(108, 7, 'v-show doest not support the <template> element?', 'v-model', 'v-bind', 'v-on', 'v-model', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(109, 8, 'The Following code represent the registered component.How we can call the custom component in my template\r\nVue.component(‘my-component’, {\r\ntemplate: ‘my own component!’\r\n})\r\nnew Vue({\r\nel: ‘#demo’\r\n})', '<my-component></my-component>', '@my-component', 'v-my-component', '<my-component></my-component>', 10, '2019-05-26 13:21:44', '0000-00-00 00:00:00'),
(110, 9, 'How to Install the vue cli globally?', 'npm install vue-cli', 'npm install vue-cli -global', 'npm install vue-cli -g', 'npm install vue-cli -g', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(111, 10, 'What is the full form of MVVM?', 'Module-View-ViewModel', 'Model-View-ViewModel', 'Model-Value-ValueModel', 'Model-View-ViewModel', 10, '2019-05-26 13:18:56', '0000-00-00 00:00:00'),
(112, 1, 'Which of the following is correct about TypeScript?', 'Angular 2 is based on TypeScript.', 'This is a superset of JavaScript.', 'All of the ans.', 'All of the ans.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(113, 2, 'Which of the following is true?', 'Angular 2 Services can be used to add more data to an Angular JS class.', 'Angular 2 Metadata can be used to add more data to an Angular JS class.', 'Angular 2 Components can be used to add more data to an Angular JS class.', 'Angular 2 Metadata can be used to add more data to an Angular JS class.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(114, 3, 'Which of the following is correct about Angular 2 Directive?', 'A directive is a custom HTML element that is used to extend the power of HTML.', 'A directive can be used to import the functionality from other Angular JS modules.', 'Angular 2 Components can be used to add more data to an Angular JS class.', 'A directive is a custom HTML element that is used to extend the power of HTML.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(115, 4, 'Which of the following is correct about Angular 2 Error Handling?', 'This is done by including the ReactJS catch library and then using the catch function.', 'The catch function contains a link to the Error Handler function.', 'Both of the ans.', 'Both of the ans.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(116, 5, 'Which of the following is correct about tsconfig.json?', 'The target for the compilation is generally es5 because most browsers can only understand ES5 typescript.', 'The sourceMap option is used to generate Map files, which are useful when debugging. Hence, during development it is good to keep this option as true.', 'All of the ans.', 'All of the ans.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(117, 6, 'Which of the following is correct about systemjs.config.json?', '\'npm:\': \'node_modules/\' tells the location in our project where all the npm modules are located.', 'The mapping of app: \'app\' tells the folder where all our applications files are loaded.', 'Both of the ans.', 'Both of the ans.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(118, 7, 'Which of the following filter is used to convert an input string to currency format.', 'currency', 'amount', 'current', 'currency', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(119, 8, 'Which of the following is correct about lifecycle hook - ngDoCheck.', 'When the value of a data bound property changes, then this method is called.', 'This is called whenever the initialization of the directive/component after Angular first displays the data-bound properties happens.', 'This is for the detection and to act on changes that Angular can\'t or won\'t detect on its own.', 'This is for the detection and to act on changes that Angular can\'t or won\'t detect on its own.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(120, 9, 'Which of the following is correct about lifecycle hook - ngAfterContentChecked.', 'This is called in response after Angular checks the content projected into the component.', 'This is called in response after Angular initializes the component\'s views and child views.\r\n', 'This is the cleanup phase just before Angular destroys the directive/component.', 'This is called in response after Angular checks the content projected into the component.', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(121, 10, 'the latest version of angular', 'v.1', 'v.2', 'v.3', 'v.3', 12, '2019-05-26 13:56:08', '0000-00-00 00:00:00'),
(122, 1, '1REPL stands for.', 'Research Eval Program Learn', 'Read Eval Print Loop', 'Read Earn Point Learn', 'Read Eval Print Loop', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(123, 2, 'Which of the following command will show version of npm?', '$ npm --version', '$ node --version', '$ npm getVersion', '$ npm --version', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(124, 3, 'Buffer class is a global class and can be accessed in application without importing buffer module.', 'true', 'false', 'none of ans', 'true', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(125, 4, 'Which method of fs module is used to read a file?', 'fs.open(path, flags[, mode], callback)', 'fs.openFile(path, flags[, mode], callback)', 'fs.read(fd, buffer, offset, length, position, callback)', 'fs.read(fd, buffer, offset, length, position, callback)', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(126, 5, 'Which method of fs module is used to truncate a file?', 'fs.delete(fd, len, callback)', 'fs.remove(fd, len, callback)', 'fs.ftruncate(fd, len, callback)', 'fs.ftruncate(fd, len, callback)', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(127, 6, 'Which of the following code prints process version?', 'console.log(\'Current version: \' + process.version());', 'console.log(\'Current version: \' + process.version);', 'console.log(\'Current version: \' + process.getVersion());', 'console.log(\'Current version: \' + process.version);', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(128, 7, 'Which of the following module is required for network specific operations?', 'os module', 'fs module', 'net module', 'net module', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(129, 8, 'Which of the following API creates a client?', 'net.createServer([options][, connectionListener])', 'net.connect(options[, connectionListener])', 'net.createConnection(port[, host][, connectListener])', 'net.createServer([options][, connectionListener])', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(130, 9, 'Which of the following is true about fork methd of child_process module.', 'The fork() method method is a special case of the spawn() to create Node processes.', 'The fork method returns object with a built-in communication channel in addition to having all the methods in a normal ChildProcess instance.', 'Both of the ans.', 'Both of the ans.', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(131, 10, 'Duplex stream can be used for both read and write operation.', 'true', 'false', 'none of ans.', 'true', 13, '2019-05-26 14:17:00', '0000-00-00 00:00:00'),
(132, 1, 'Which of the following is correct about MongoDB?', 'MongoDB uses JSON format to represent documents', 'MongoDB supports collection joins', 'MongoDB supports geospatial indexes', 'MongoDB supports geospatial indexes', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(133, 2, 'Which is the default mode in which the explain() command runs?', 'queryPlanner', 'executionStats', 'allPlansExecution', 'queryPlanner', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(134, 3, 'By default, the MongoDB cursor in mongo shell is configured to return how many documents? To get the next set of documents, which command is used?', '20, it', '200, more', '50, it', '20, it', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(135, 4, 'Consider that the posts collection contains an array called ratings which contains ratings given to the post by various users in the following format:\r\n\r\n{\r\n         _id: 1,\r\n         post_text: �This is my first post�,\r\n         ratings: [5, 4, 2, 5],\r\n ', 'db.inventory.find( { ratings: { $elemMatch: { $gt: 3, $lt: 6 } } } )', 'db.inventory.find( { ratings: { ratings: { $gt: 5, $lt: 9 } } } )', 'db.inventory.find( { ratings: { ratings.$: { $gt: 5, $lt: 9 } } } )', 'db.inventory.find( { ratings: { $elemMatch: { $gt: 3, $lt: 6 } } } )', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(136, 5, 'If the value of totalKeysExamined is 30000 and the value of totalDocsExamined is 0, which of the following option is correct?', 'The query used an index to fetch the results', 'The query returned 30000 documents after scanning the documents', 'The query returned 0 documents', 'The query used an index to fetch the results', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(137, 6, 'As per the aggregation pipeline optimization concepts, if you have a $sort followed by a $match:', '$match moves before $sort', '$sort moves before $match', 'MongoDB does not do any movements by default and will use the order provided', '$match moves before $sort', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(138, 7, 'In a sharded replica set environment, the w Option provides ability for write concern and j Option provides ability for the data to be written on disk journal. Consider that we have a seven member replica set and we want to assure that the writes are comm', '0', '1', '3', '3', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(139, 8, 'Given a collection posts as shown below having a document array comments, which of the following command will create an index on the comment author descending?\r\n\r\n{\r\n		�_id�:1,\r\n		�post_text�:�This is a sample post�,\r\n		�author�:�Tom�,\r\n		�comments�:[\r\n		', 'db.posts.createIndex({�comments.$.author\":-1});', 'db.posts.createIndex({�comments.author\":-1});', 'db.posts.createIndex({�comments.$.author\": {�$desc�:1}});', 'db.posts.createIndex({�comments.author\":-1});', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(140, 9, 'The difference between $push and $addToSet is:', '$addToSet adds the item to the field only if the new item is of the same datatype', '$addToSet needs the fields to be already present while $push will work even if the field is not present', '$addToSet adds the item to the field only if it does not exist already; while $push pushes the item to the field irrespective of whether it was present or not', '$addToSet adds the item to the field only if it does not exist already; while $push pushes the item to the field irrespective of whether it was present or not', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00'),
(141, 10, 'If you have created a compound index on (A,B, C) which of the following access pattern will not be able to utilize the index?', 'A, B, C', 'A, B', 'B, C', 'B, C', 15, '2019-05-26 14:26:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suggest`
--

CREATE TABLE `suggest` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sorting` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `name`, `description`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Web Design', 'Web design is a Web development process for creating a website that focuses on aesthetic factors like layout, user interface and other visual imagery in order to make the website more visually appealing and easy to use.', 1, '2019-06-03 20:35:47', '2018-10-31 13:47:29'),
(2, 'Web Development', 'Web development broadly refers to the tasks associated with developing websites for hosting via intranet or internet. The web development process includes web design, web content development, client-side/server-side scripting and network security configuration, among other tasks.\r\n', 2, '2019-06-03 20:36:35', '2018-11-18 22:00:00'),
(3, 'Full Stack', 'A full stack developer is an engineer who can handle all the work of databases, servers, systems engineering, and clients. Depending on the project, what customers need may be a mobile stack, a Web stack, or a native application stack.', 3, '2019-06-03 20:36:13', '2018-11-18 22:00:00'),
(4, 'Mean Stack', 'MEAN is a free and open-source JavaScript software stack for building dynamic web sites and web applications.', 4, '2019-06-03 20:37:06', '2018-11-18 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `track_achivment`
--

CREATE TABLE `track_achivment` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `track_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `track_achivment`
--

INSERT INTO `track_achivment` (`id`, `title`, `body`, `track_id`, `created_at`, `updated_at`) VALUES
(1, 'web design certificate', 'this is web design certificate', 1, '2019-04-22 12:14:31', '0000-00-00 00:00:00'),
(2, 'web develope certificate', 'this is web develope certificate', 2, '2019-04-22 12:14:31', '0000-00-00 00:00:00'),
(3, 'fullstack cerificate', 'this is fullstack cerificate', 3, '2019-04-22 12:14:31', '0000-00-00 00:00:00'),
(4, 'mean stack certificate', 'this is mean stack certificate', 4, '2019-04-22 12:14:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `track_course`
--

CREATE TABLE `track_course` (
  `id` int(10) UNSIGNED NOT NULL,
  `track_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `track_course`
--

INSERT INTO `track_course` (`id`, `track_id`, `course_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6),
(6, 2, 7),
(7, 2, 8),
(8, 2, 9),
(9, 2, 10),
(10, 3, 2),
(11, 3, 3),
(12, 3, 4),
(13, 3, 5),
(14, 3, 6),
(15, 3, 7),
(16, 3, 8),
(17, 3, 9),
(18, 3, 10),
(19, 3, 11),
(20, 1, 11),
(21, 4, 12),
(22, 4, 13),
(23, 4, 15),
(24, 4, 14),
(25, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'profile.png',
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` tinyint(4) DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `firstname`, `lastname`, `picture`, `phone`, `group_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(38, 'mohamed74', 'mohamedaldomany60521@gmail.com', '2019-06-09 08:26:39', '$2y$10$ftYSFZjl7Ph9RPWmQKjATeJ0iLUXcdITpMTZOU3XpVtR6IcXGs0vC', NULL, NULL, 'profile.png', NULL, 0, 'oXmyEB6HOFQhYr9d97UTQSi48cWgbKsF6pnmVEHDZJdtIKx48uO8p5MPC4bv', '2019-06-09 08:26:04', '2019-06-09 08:26:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_achivment`
--

CREATE TABLE `user_achivment` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `achivment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_course`
--

CREATE TABLE `user_course` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED DEFAULT NULL,
  `track_id` int(10) UNSIGNED DEFAULT NULL,
  `latest_lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `course_progress` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_course`
--

INSERT INTO `user_course` (`id`, `user_id`, `course_id`, `profile_id`, `track_id`, `latest_lesson_id`, `course_progress`) VALUES
(1, 38, 2, 2, 1, 14, 14),
(2, 38, 5, 1, NULL, 49, 1),
(3, 38, 2, 1, NULL, 15, 2),
(4, 38, 4, 1, NULL, 34, 1),
(5, 38, 7, 2, 2, 64, 64);

-- --------------------------------------------------------

--
-- Table structure for table `user_exam`
--

CREATE TABLE `user_exam` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `exam_id` int(10) UNSIGNED NOT NULL,
  `score` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `profile_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_exam`
--

INSERT INTO `user_exam` (`id`, `user_id`, `exam_id`, `score`, `created_at`, `profile_id`) VALUES
(1, 38, 1, 0, '2019-06-09 10:28:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_lesson`
--

CREATE TABLE `user_lesson` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `track_id` int(10) UNSIGNED DEFAULT NULL,
  `profile_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_lesson`
--

INSERT INTO `user_lesson` (`id`, `user_id`, `lesson_id`, `course_id`, `track_id`, `profile_id`) VALUES
(1, 38, 14, 2, 1, 2),
(2, 38, 49, 5, NULL, 1),
(3, 38, 14, 2, NULL, 1),
(4, 38, 15, 2, NULL, 1),
(5, 38, 34, 4, NULL, 1),
(6, 38, 64, 7, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `user_id`, `profile_id`) VALUES
(1, 38, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_track`
--

CREATE TABLE `user_track` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `track_id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_track`
--

INSERT INTO `user_track` (`id`, `user_id`, `track_id`, `profile_id`) VALUES
(1, 38, 1, 2),
(2, 38, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_track_achivment`
--

CREATE TABLE `user_track_achivment` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `track_achivment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `watch_later`
--

CREATE TABLE `watch_later` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achivment`
--
ALTER TABLE `achivment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `attach`
--
ALTER TABLE `attach`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `example`
--
ALTER TABLE `example`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `lesson_attach`
--
ALTER TABLE `lesson_attach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `attach_id` (`attach_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_track`
--
ALTER TABLE `profile_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `suggest`
--
ALTER TABLE `suggest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_achivment`
--
ALTER TABLE `track_achivment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `track_course`
--
ALTER TABLE `track_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track_id` (`track_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_achivment`
--
ALTER TABLE `user_achivment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `achivment_id` (`achivment_id`);

--
-- Indexes for table `user_course`
--
ALTER TABLE `user_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `track_id` (`track_id`),
  ADD KEY `lesson_id` (`latest_lesson_id`);

--
-- Indexes for table `user_exam`
--
ALTER TABLE `user_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `user_lesson`
--
ALTER TABLE `user_lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `user_track`
--
ALTER TABLE `user_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `track_id` (`track_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `user_track_achivment`
--
ALTER TABLE `user_track_achivment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `track_achivment_id` (`track_achivment_id`);

--
-- Indexes for table `watch_later`
--
ALTER TABLE `watch_later`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lesson_id` (`lesson_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achivment`
--
ALTER TABLE `achivment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attach`
--
ALTER TABLE `attach`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `example`
--
ALTER TABLE `example`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `lesson_attach`
--
ALTER TABLE `lesson_attach`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profile_track`
--
ALTER TABLE `profile_track`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suggest`
--
ALTER TABLE `suggest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track_achivment`
--
ALTER TABLE `track_achivment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track_course`
--
ALTER TABLE `track_course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_achivment`
--
ALTER TABLE `user_achivment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_course`
--
ALTER TABLE `user_course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_exam`
--
ALTER TABLE `user_exam`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_lesson`
--
ALTER TABLE `user_lesson`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_track`
--
ALTER TABLE `user_track`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_track_achivment`
--
ALTER TABLE `user_track_achivment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watch_later`
--
ALTER TABLE `watch_later`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achivment`
--
ALTER TABLE `achivment`
  ADD CONSTRAINT `achivment_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `example`
--
ALTER TABLE `example`
  ADD CONSTRAINT `example_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lesson_attach`
--
ALTER TABLE `lesson_attach`
  ADD CONSTRAINT `lesson_attach_ibfk_1` FOREIGN KEY (`attach_id`) REFERENCES `attach` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lesson_attach_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_track`
--
ALTER TABLE `profile_track`
  ADD CONSTRAINT `profile_track_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `profile_track_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reply`
--
ALTER TABLE `reply`
  ADD CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suggest`
--
ALTER TABLE `suggest`
  ADD CONSTRAINT `suggest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `track_achivment`
--
ALTER TABLE `track_achivment`
  ADD CONSTRAINT `track_achivment_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_course`
--
ALTER TABLE `track_course`
  ADD CONSTRAINT `track_course_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `track_course_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_achivment`
--
ALTER TABLE `user_achivment`
  ADD CONSTRAINT `user_achivment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_achivment_ibfk_2` FOREIGN KEY (`achivment_id`) REFERENCES `achivment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_course`
--
ALTER TABLE `user_course`
  ADD CONSTRAINT `user_course_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_course_ibfk_3` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_course_ibfk_4` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_course_ibfk_5` FOREIGN KEY (`latest_lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_exam`
--
ALTER TABLE `user_exam`
  ADD CONSTRAINT `user_exam_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_exam_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_exam_ibfk_3` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_lesson`
--
ALTER TABLE `user_lesson`
  ADD CONSTRAINT `user_lesson_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_lesson_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_lesson_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_lesson_ibfk_4` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_lesson_ibfk_5` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_profile_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_track`
--
ALTER TABLE `user_track`
  ADD CONSTRAINT `user_track_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_track_ibfk_3` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_track_achivment`
--
ALTER TABLE `user_track_achivment`
  ADD CONSTRAINT `user_track_achivment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_track_achivment_ibfk_2` FOREIGN KEY (`track_achivment_id`) REFERENCES `track_achivment` (`id`);

--
-- Constraints for table `watch_later`
--
ALTER TABLE `watch_later`
  ADD CONSTRAINT `watch_later_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `watch_later_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `watch_later_ibfk_3` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
