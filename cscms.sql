-- phpMyAdmin SQL Dump
-- version 4.0.0-beta1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 27, 2013 at 02:34 PM
-- Server version: 5.5.28a-MariaDB-a1~squeeze-log
-- PHP Version: 5.3.19-1~dotdeb.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cscms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cscms_article_cats`
--

DROP TABLE IF EXISTS `cscms_article_cats`;
CREATE TABLE IF NOT EXISTS `cscms_article_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `order` int(11) DEFAULT NULL,
  `perms` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `locked` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cscms_article_cats`
--

INSERT INTO `cscms_article_cats` (`id`, `name`, `order`, `perms`, `count`, `locked`) VALUES
(1, 'CMS Snippets', 1, 0, 0, 0),
(2, 'How-To Articles', 2, 0, 0, 0),
(3, 'User Contributed Articles', 5, 0, 0, 0),
(4, 'Plugin Building', 4, 0, 0, 0),
(5, 'Module Building', 3, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_article_content`
--

DROP TABLE IF EXISTS `cscms_article_content`;
CREATE TABLE IF NOT EXISTS `cscms_article_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `post` text,
  `posted` int(11) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0',
  `approved_by` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cscms_article_content`
--

INSERT INTO `cscms_article_content` (`id`, `uid`, `cat_id`, `title`, `description`, `post`, `posted`, `approved`, `approved_by`, `views`) VALUES
(1, 1, 1, 'Testing category index', NULL, '[h3]Page1[/h3]\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Age sane, inquam. Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt; Quod ea non occurrentia fingunt, vincunt Aristonem; Duo Reges: constructio interrete. Memini me adesse P. Est autem etiam actio quaedam corporis, quae motus et status naturae congruentis tenet;\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page2[/h3]\r\n\r\nDempta enim aeternitate nihilo beatior Iuppiter quam Epicurus; Erat enim res aperta. Non quam nostram quidem, inquit Pomponius iocans; Si enim ita est, vide ne facinus facias, cum mori suadeas. Sed tu istuc dixti bene Latine, parum plane. Illa argumenta propria videamus, cur omnia sint paria peccata. Quam ob rem tandem, inquit, non satisfacit? Esse enim quam vellet iniquus iustus poterat inpune. Cui Tubuli nomen odio non est?\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page3[/h3]\r\n\r\nEarum etiam rerum, quas terra gignit, educatio quaedam et perfectio est non dissimilis animantium. Amicitiam autem adhibendam esse censent, quia sit ex eo genere, quae prosunt. Ut scias me intellegere, primum idem esse dico voluptatem, quod ille don. Neque solum ea communia, verum etiam paria esse dixerunt.\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page4[/h3]\r\n\r\nInde sermone vario sex illa a Dipylo stadia confecimus. Est enim effectrix multarum et magnarum voluptatum. Tria genera bonorum; Quo modo autem philosophus loquitur? At certe gravius. Non igitur potestis voluptate omnia dirigentes aut tueri aut retinere virtutem.\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page5[/h3]\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Summum ením bonum exposuit vacuitatem doloris; Est enim effectrix multarum et magnarum voluptatum. Apud ceteros autem philosophos, qui quaesivit aliquid, tacet; Duo Reges: constructio interrete. Cur deinde Metrodori liberos commendas? Qui autem esse poteris, nisi te amor ipse ceperit? Cui Tubuli nomen odio non est? Portenta haec esse dicit, neque ea ratione ullo modo posse vivi; Quis suae urbis conservatorem Codrum, quis Erechthei filias non maxime laudat? Quid est igitur, cur ita semper deum appellet Epicurus beatum et aeternum? \r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page6[/h3]\r\n\r\nPhilosophi autem in suis lectulis plerumque moriuntur. Mihi, inquam, qui te id ipsum rogavi? Polemoni et iam ante Aristoteli ea prima visa sunt, quae paulo ante dixi. Summus dolor plures dies manere non potest? Si longus, levis. Quae autem natura suae primae institutionis oblita est? Easdemne res? Si quicquam extra virtutem habeatur in bonis. Ergo in gubernando nihil, in officio plurimum interest, quo in genere peccetur. Est enim tanti philosophi tamque nobilis audacter sua decreta defendere. \r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page7[/h3]\r\n\r\nQuantum Aristoxeni ingenium consumptum videmus in musicis? Sed utrum hortandus es nobis, Luci, inquit, an etiam tua sponte propensus es? At, si voluptas esset bonum, desideraret. Quorum altera prosunt, nocent altera. Fatebuntur Stoici haec omnia dicta esse praeclare, neque eam causam Zenoni desciscendi fuisse. Quae si potest singula consolando levare, universa quo modo sustinebit? Apparet statim, quae sint officia, quae actiones. Tubulum fuisse, qua illum, cuius is condemnatus est rogatione, P. \r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page8[/h3]\r\n\r\nEquidem e Cn. Hoc ipsum elegantius poni meliusque potuit. Aperiendum est igitur, quid sit voluptas; Quis non odit sordidos, vanos, leves, futtiles? \r\n[h3]Page1[/h3]\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Age sane, inquam. Verum tamen cum de rebus grandioribus dicas, ipsae res verba rapiunt; Quod ea non occurrentia fingunt, vincunt Aristonem; Duo Reges: constructio interrete. Memini me adesse P. Est autem etiam actio quaedam corporis, quae motus et status naturae congruentis tenet;\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page2[/h3]\r\n\r\nDempta enim aeternitate nihilo beatior Iuppiter quam Epicurus; Erat enim res aperta. Non quam nostram quidem, inquit Pomponius iocans; Si enim ita est, vide ne facinus facias, cum mori suadeas. Sed tu istuc dixti bene Latine, parum plane. Illa argumenta propria videamus, cur omnia sint paria peccata. Quam ob rem tandem, inquit, non satisfacit? Esse enim quam vellet iniquus iustus poterat inpune. Cui Tubuli nomen odio non est?\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page3[/h3]\r\n\r\nEarum etiam rerum, quas terra gignit, educatio quaedam et perfectio est non dissimilis animantium. Amicitiam autem adhibendam esse censent, quia sit ex eo genere, quae prosunt. Ut scias me intellegere, primum idem esse dico voluptatem, quod ille don. Neque solum ea communia, verum etiam paria esse dixerunt.\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page4[/h3]\r\n\r\nInde sermone vario sex illa a Dipylo stadia confecimus. Est enim effectrix multarum et magnarum voluptatum. Tria genera bonorum; Quo modo autem philosophus loquitur? At certe gravius. Non igitur potestis voluptate omnia dirigentes aut tueri aut retinere virtutem.\r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page5[/h3]\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Summum ením bonum exposuit vacuitatem doloris; Est enim effectrix multarum et magnarum voluptatum. Apud ceteros autem philosophos, qui quaesivit aliquid, tacet; Duo Reges: constructio interrete. Cur deinde Metrodori liberos commendas? Qui autem esse poteris, nisi te amor ipse ceperit? Cui Tubuli nomen odio non est? Portenta haec esse dicit, neque ea ratione ullo modo posse vivi; Quis suae urbis conservatorem Codrum, quis Erechthei filias non maxime laudat? Quid est igitur, cur ita semper deum appellet Epicurus beatum et aeternum? \r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page6[/h3]\r\n\r\nPhilosophi autem in suis lectulis plerumque moriuntur. Mihi, inquam, qui te id ipsum rogavi? Polemoni et iam ante Aristoteli ea prima visa sunt, quae paulo ante dixi. Summus dolor plures dies manere non potest? Si longus, levis. Quae autem natura suae primae institutionis oblita est? Easdemne res? Si quicquam extra virtutem habeatur in bonis. Ergo in gubernando nihil, in officio plurimum interest, quo in genere peccetur. Est enim tanti philosophi tamque nobilis audacter sua decreta defendere. \r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page7[/h3]\r\n\r\nQuantum Aristoxeni ingenium consumptum videmus in musicis? Sed utrum hortandus es nobis, Luci, inquit, an etiam tua sponte propensus es? At, si voluptas esset bonum, desideraret. Quorum altera prosunt, nocent altera. Fatebuntur Stoici haec omnia dicta esse praeclare, neque eam causam Zenoni desciscendi fuisse. Quae si potest singula consolando levare, universa quo modo sustinebit? Apparet statim, quae sint officia, quae actiones. Tubulum fuisse, qua illum, cuius is condemnatus est rogatione, P. \r\n\r\n[PAGE_SPLITTER]\r\n[h3]Page8[/h3]\r\n\r\nEquidem e Cn. Hoc ipsum elegantius poni meliusque potuit. Aperiendum est igitur, quid sit voluptas; Quis non odit sordidos, vanos, leves, futtiles? \r\n', 1363490365, 1, 1, 29),
(10, 1, 2, 'Plugins', 'something about plugins here', '# Writing Hooks into your code\nThe CSCMS Plugin system works on a very basic principle:\n> As a Developer, I want to give other developers access to specific parts of my code to alter it\n\n## Building a Hook\nNow, We do that by giving developers a method of providing access to specific points using hooks.\nA hook is initiated using the following:\n\n`$objPlugin->hook(''CMS_HOOK_NAME'', $params);`\n\n### Reference Passing\nThis gives us the ability to pass arguments to the functions hooking here. \n\nYou can give direct access to variables you pass in like so:\n\n~~~php\n<?php\n    $params = array( &$var1, &$var2, &$var3 );\n    $objPlugin->hook(''CMS_HOOK_NAME'', $params);\n?>\n~~~\n\n### Values by return\nHooks will also return anything that has been returned in the functions that have hooked there.\n\n~~~php\n<?php\n    $moreTPL = Core_Classes_coreObj::getPlugins()->hook(''CMS_PAGE_TPL_GLOBALS'');\n    if( is_array($moreTPL) && count($moreTPL) > 1 ){\n        foreach($moreTPL as $vars){\n            $tplGlobals = array_merge($tplGlobals, $vars);\n        }\n    }\n?>\n~~~\n\nIn the above instance, we are getting any return values of any plugin that ran and merging them with our `$tplGlobals` variable to processing.\n\n## Accessing existing hooks\nTo access a hook that resides in a module / elsewhere in the CMS, You create a folder in `./plugins/{AUTHOR_NAME}/{PLUGIN_NAME}.php`.\n\nWithin this file, I write a simple function to be executed by the plugin system.\n\n~~~php\n<?php\n    function recache(){\n        if(isset($_GET[''_recache''])){\n            $objCache = coreObj::getCache();\n\n            $objCache->remove(''stores'');\n        }\n    }\n\n    $this->addHook(''CMS_START'', ''recache'');\n?>\n~~~\n\nAbove is an example of a hook that, when ''_recache'' appears in the url, the cache''s are cleared from the system.', 1365896585, 1, 1, 16),
(11, 1, 2, 'test article', 'desc for richie', '# Header 1\r\n\r\n> Hai richie! ;)\r\n\r\n\r\n[PAGE_SPLITTER]\r\n\r\nlallala ', 1366231040, 1, 1, 1),
(12, 1, 3, 'test', 'test', '<?php\r\n\r\n\r\n/**\r\n  //\r\n  // cscms_groups\r\n  //\r\n**/\r\n\r\n|----------------|-------------|\r\n|      Name      |   Datatype  |\r\n|----------------|-------------|\r\n| id             | int(11)     |\r\n| type           | tinyint(1)  |\r\n| name           | varchar(30) |\r\n| description    | text        |\r\n| moderator      | int(11)     |\r\n| personal_group | tinyint(1)  |\r\n| color          | varchar(20) |\r\n| order          | tinyint(3)  |\r\n|----------------|-------------|\r\n\r\n/**\r\n  //\r\n  // cscms_groups_subs\r\n  //\r\n**/\r\n\r\n|---------|------------|\r\n|   Name  |  Datatype  |\r\n|---------|------------|\r\n| uid     | int(11)    |\r\n| gid     | int(11)    |\r\n| pending | tinyint(1) |\r\n|---------|------------|\r\n\r\n/**\r\n  //\r\n  // cscms_permissions\r\n  //\r\n**/\r\n\r\n|---------|------------|\r\n|   Name  |  Datatype  |\r\n|---------|------------|\r\n|     |\r\n|---------|------------|\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 1366565211, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_blocks`
--

DROP TABLE IF EXISTS `cscms_blocks`;
CREATE TABLE IF NOT EXISTS `cscms_blocks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniqueid` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `order` int(10) NOT NULL,
  `enabled` enum('0','1') NOT NULL DEFAULT '0',
  `file_location` varchar(255) NOT NULL,
  `extra` varchar(255) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cscms_blocks`
--

INSERT INTO `cscms_blocks` (`id`, `uniqueid`, `title`, `name`, `location`, `order`, `enabled`, `file_location`, `extra`) VALUES
(1, 'fs8fdsf', 'Login Block', '', '_CMSBLOCK.LEFT_MENU', 1, '0', '', '{"module":"Module_core", "method":"login_block"}');

-- --------------------------------------------------------

--
-- Table structure for table `cscms_blocks_routes`
--

DROP TABLE IF EXISTS `cscms_blocks_routes`;
CREATE TABLE IF NOT EXISTS `cscms_blocks_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockID` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cscms_config`
--

DROP TABLE IF EXISTS `cscms_config`;
CREATE TABLE IF NOT EXISTS `cscms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `var` varchar(50) NOT NULL,
  `value` text,
  `default` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `cscms_config`
--

INSERT INTO `cscms_config` (`id`, `key`, `var`, `value`, `default`) VALUES
(1, 'session', 'cookie_domain', NULL, NULL),
(2, 'session', 'cookie_path', NULL, NULL),
(3, 'cms', 'name', 'Cybershade CMS', 'Cybershade CMS'),
(4, 'site', 'title', 'CSDev', 'Cybershade CMS'),
(5, 'site', 'slogan', 'dev', NULL),
(6, 'site', 'theme', 'cybershade', NULL),
(7, 'site', 'language', 'en-gb', 'en-gb'),
(8, 'site', 'keywords', 'dev', NULL),
(9, 'site', 'description', 'dev', NULL),
(10, 'site', 'admin_email', 'xlink@cybershade.org', NULL),
(11, 'site', 'google_analytics', NULL, NULL),
(12, 'login', 'max_login_tries', '5', '5'),
(13, 'login', 'remember_me', '1', '1'),
(14, 'time', 'timezone', '0', '0'),
(15, 'session', 'timeout', '1', '1'),
(16, 'site', 'theme_override', 'false', 'false'),
(17, 'site', 'change_username', 'false', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `cscms_forum_cats`
--

DROP TABLE IF EXISTS `cscms_forum_cats`;
CREATE TABLE IF NOT EXISTS `cscms_forum_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `desc` text,
  `order` int(11) NOT NULL DEFAULT '0',
  `last_post_id` int(11) NOT NULL DEFAULT '0',
  `postcounts` int(11) NOT NULL DEFAULT '0',
  `auth_view` int(1) NOT NULL DEFAULT '0',
  `auth_read` int(1) NOT NULL DEFAULT '0',
  `auth_post` int(1) NOT NULL DEFAULT '0',
  `auth_reply` int(1) NOT NULL DEFAULT '0',
  `auth_edit` int(1) NOT NULL DEFAULT '0',
  `auth_del` int(1) NOT NULL DEFAULT '0',
  `auth_move` int(1) NOT NULL DEFAULT '0',
  `auth_special` int(1) NOT NULL DEFAULT '0',
  `auth_mod` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cscms_forum_posts`
--

DROP TABLE IF EXISTS `cscms_forum_posts`;
CREATE TABLE IF NOT EXISTS `cscms_forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(2) NOT NULL DEFAULT '0',
  `author` int(15) DEFAULT '0',
  `post` text,
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `poster_ip` varchar(15) NOT NULL DEFAULT '',
  `edited` int(5) NOT NULL DEFAULT '0',
  `edited_by` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`),
  KEY `thread_id_2` (`thread_id`),
  KEY `thread_id_3` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cscms_forum_threads`
--

DROP TABLE IF EXISTS `cscms_forum_threads`;
CREATE TABLE IF NOT EXISTS `cscms_forum_threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `author` int(15) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `first_post_id` int(11) NOT NULL DEFAULT '0',
  `last_uid` int(15) NOT NULL DEFAULT '0',
  `locked` int(1) NOT NULL DEFAULT '0',
  `mode` int(1) NOT NULL DEFAULT '0',
  `views` int(1) NOT NULL DEFAULT '0',
  `old_cat_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cscms_forum_watch`
--

DROP TABLE IF EXISTS `cscms_forum_watch`;
CREATE TABLE IF NOT EXISTS `cscms_forum_watch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_id` int(11) NOT NULL DEFAULT '0',
  `seen` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cscms_groups`
--

DROP TABLE IF EXISTS `cscms_groups`;
CREATE TABLE IF NOT EXISTS `cscms_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `moderator` int(11) unsigned NOT NULL DEFAULT '0',
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cscms_groups`
--

INSERT INTO `cscms_groups` (`id`, `status`, `name`, `description`, `moderator`, `color`, `order`) VALUES
(1, 1, 'Admin', 'Site Administrator', 1, '#ff0000', 1),
(2, 1, 'Mods', 'Site Moderator', 1, '#146eca', 3),
(3, 0, 'Users', 'Registered User', 1, '#b7b7b7', 10),
(4, 1, 'Guests', 'Guest Users', 1, '#000000', 255);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_groups_perms`
--

DROP TABLE IF EXISTS `cscms_groups_perms`;
CREATE TABLE IF NOT EXISTS `cscms_groups_perms` (
  `permission_key` varchar(50) NOT NULL DEFAULT '',
  `permission_value` tinyint(1) NOT NULL DEFAULT '0',
  `content_id` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_key`,`content_id`,`group_id`),
  KEY `permission_key` (`permission_key`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cscms_groups_perms`
--

INSERT INTO `cscms_groups_perms` (`permission_key`, `permission_value`, `content_id`, `group_id`) VALUES
('CS.ACP.LOGIN', 0, 0, 4),
('CS.ACP.VIEW', 0, 0, 4),
('CS.ARTICLES.CATEGORY.CREATE', 0, 0, 4),
('CS.ARTICLES.COMMENT', 1, 0, 3),
('CS.ARTICLES.COMMENT', 0, 0, 4),
('CS.ARTICLES.CREATE', 1, 0, 3),
('CS.ARTICLES.CREATE', 0, 0, 4),
('CS.ARTICLES.DELETE', 0, 0, 4),
('CS.ARTICLES.EDIT', 0, 0, 4),
('CS.ARTICLES.READ', 1, 0, 3),
('CS.ARTICLES.READ', 1, 0, 4),
('CS.ARTICLES.VIEW', 1, 0, 3),
('CS.ARTICLES.VIEW', 1, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_groups_subs`
--

DROP TABLE IF EXISTS `cscms_groups_subs`;
CREATE TABLE IF NOT EXISTS `cscms_groups_subs` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `pending` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  KEY `gid` (`group_id`),
  KEY `uid` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cscms_groups_subs`
--

INSERT INTO `cscms_groups_subs` (`user_id`, `group_id`, `pending`) VALUES
(1, 4, '0'),
(2, 3, '0'),
(2, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `cscms_menus`
--

DROP TABLE IF EXISTS `cscms_menus`;
CREATE TABLE IF NOT EXISTS `cscms_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) DEFAULT NULL,
  `link_url` text,
  `link_title` varchar(50) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `perms` int(1) NOT NULL DEFAULT '0',
  `external` int(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `cscms_menus`
--

INSERT INTO `cscms_menus` (`id`, `menu_name`, `link_url`, `link_title`, `order`, `perms`, `external`, `parent_id`) VALUES
(1, 'menu_mm', '/', 'Site Home', 1, 0, 0, 0),
(2, 'menu_mm', '/admin/', 'Admin Panel', 6, 3, 0, 0),
(3, 'menu_mm', '/forum/', 'Forum', 2, 0, 0, 0),
(5, 'menu_mm', '/messages/', 'Private Messages', 3, 1, 0, 0),
(6, 'menu_mm', '/user/', 'User Control Panel', 4, 1, 0, 0),
(7, 'menu_mm', '/mod/', 'Moderator Panel', 5, 3, 0, 0),
(8, 'main_nav', '/', 'Site Home', 1, 0, 0, 0),
(9, 'main_nav', '/profile/', 'Profile', 2, 1, 0, 0),
(10, 'main_nav', '/forum/', 'Forum', 3, 0, 0, 0),
(11, 'main_nav', '/articles/', 'Articles', 4, 0, 0, 0),
(12, 'main_nav', '/codebase/', 'Codebase', 5, 0, 0, 0),
(13, 'main_nav', '/pastebin/', 'PasteBin', 6, 0, 0, 0),
(15, 'admin_menu', '/{CP_ROOT}', 'Dashboard', 1, 1, 0, 0),
(16, 'admin_menu', '#', 'System', 2, 0, 0, 0),
(17, 'admin_menu', '/{CP_ROOT}core/siteconfig/', 'Site Configuration', 1, 0, 0, 16),
(18, 'admin_menu', '/{CP_ROOT}core/menus/edit', 'Edit a Menu', 2, 0, 0, 24),
(19, 'admin_menu', '#', 'Users', 5, 1, 0, 0),
(20, 'admin_menu', '/{CP_ROOT}core/users/search', 'Search', 1, 1, 0, 19),
(21, 'admin_menu', '/{CP_ROOT}core/users/manage', 'Manage User ', 2, 1, 0, 19),
(22, 'admin_menu', '/{CP_ROOT}core/users/add', 'Add new User', 3, 1, 0, 19),
(23, 'admin_menu', '/{CP_ROOT}core/systeminfo/', 'System Info', 5, 1, 0, 16),
(24, 'admin_menu', '#', 'Menus', 3, 0, 0, 0),
(26, 'admin_menu', '/{CP_ROOT}core/menus/newlink', 'New Link', 1, 0, 0, 24),
(31, 'admin_menu', '/{CP_ROOT}core/themes/', 'Themes', 3, 0, 0, 16),
(32, 'admin_menu', '/{CP_ROOT}articles/', 'Article Manager', 6, 0, 0, 0),
(33, 'admin_menu', '/{CP_ROOT}core/cache/', 'Cache Control', 2, 0, 0, 16),
(34, 'admin_menu', '/{CP_ROOT}core/modules/', 'Module Manager', 4, 0, 0, 16),
(35, 'admin_menu', '#', 'Content', 4, 0, 0, 0),
(36, 'admin_menu', '/{CP_ROOT}pages/create', 'Add Page', 1, 0, 0, 35),
(37, 'admin_menu', '/{CP_ROOT}pages/listPages', 'List Pages', 2, 0, 0, 35),
(38, 'user_menu', '/{CP_ROOT}dashboard', 'Dashboard', 1000, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_modules`
--

DROP TABLE IF EXISTS `cscms_modules`;
CREATE TABLE IF NOT EXISTS `cscms_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `version` varchar(10) NOT NULL,
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cscms_permissions`
--

DROP TABLE IF EXISTS `cscms_permissions`;
CREATE TABLE IF NOT EXISTS `cscms_permissions` (
  `key` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  UNIQUE KEY `key_2` (`key`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cscms_permissions`
--

INSERT INTO `cscms_permissions` (`key`, `name`, `description`) VALUES
('CS.ACP.VIEW', 'View Admin Panel', 'View ACP'),
('CS.ACP.LOGIN', 'Able to Login to ACP', 'Can login to ACP'),
('CS.ARTICLES.READ', 'Read Articles', 'Can read articles in a category'),
('CS.ARTICLES.CREATE', 'Create Articles', 'Can post new articles to a category'),
('CS.ARTICLES.EDIT', 'Edit Articles', 'Can edit articles in a category'),
('CS.ARTICLES.DELETE', 'Delete Articles', 'Can delete articles from a category'),
('CS.ARTICLES.COMMENT', 'Comment on Articles', 'Can comment on articles in a category'),
('CS.ARTICLES.VIEW', 'View Category Contents', 'Can view the existance of a category'),
('CS.ARTICLES.CATEGORY.CREATE', 'Create Categories', 'Can create categories');

-- --------------------------------------------------------

--
-- Table structure for table `cscms_plugins`
--

DROP TABLE IF EXISTS `cscms_plugins`;
CREATE TABLE IF NOT EXISTS `cscms_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `priority` enum('1','2','3') NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cscms_plugins`
--

INSERT INTO `cscms_plugins` (`id`, `name`, `path`, `priority`, `enabled`) VALUES
(1, 'Recache stuff', './plugins/core/recache.php', '1', 1),
(2, 'Automatic Editor on Textarea', './modules/editor/plugins.editor.php', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_routes`
--

DROP TABLE IF EXISTS `cscms_routes`;
CREATE TABLE IF NOT EXISTS `cscms_routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `method` enum('ANY','HEAD','PUT','GET','OPTIONS','POST','DELETE','TRACE','CONNECT','PATCH') NOT NULL DEFAULT 'ANY',
  `pattern` varchar(255) NOT NULL,
  `arguments` text NOT NULL,
  `requirements` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `redirect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `cscms_routes`
--

INSERT INTO `cscms_routes` (`id`, `module`, `label`, `method`, `pattern`, `arguments`, `requirements`, `status`, `redirect`) VALUES
(1, 'a74ad8dfacd4f985eb3977517615ce25', 'core_loginForm', 'GET', '/login', '{"module":"Modules_core","method":"loginForm"}', '[]', 1, NULL),
(2, 'a74ad8dfacd4f985eb3977517615ce25', 'core_loginForm_process', 'POST', '/login', '{"module":"Modules_core","method":"loginForm_process"}', '[]', 1, NULL),
(3, 'a74ad8dfacd4f985eb3977517615ce25', 'core_viewIndex', 'ANY', '/', '{"module":"Modules_core","mehod":"viewIndex"}', '[]', 1, NULL),
(4, 'a74ad8dfacd4f985eb3977517615ce25', 'core_logout', 'GET', '/logout', '{"module":"Modules_core","method":"logout"}', '[]', 1, NULL),
(5, 'dba5d91846ce1a5e63734dfcbcb481cb', 'articles_listCategories', 'ANY', '/articles', '{"module":"Modules_articles","method":"listCategories"}', '[]', 1, NULL),
(6, 'dba5d91846ce1a5e63734dfcbcb481cb', 'articles_viewCategory', 'ANY', '/articles/:cat-:catid', '{"module":"Modules_articles","method":"viewCategory"}', '{"catid":"\\\\d+"}', 1, NULL),
(7, 'dba5d91846ce1a5e63734dfcbcb481cb', 'articles_viewArticle', 'ANY', '/articles/:cat-:catid/:title-:id.html', '{"module":"Modules_articles","method":"viewArticle"}', '{"catid":"\\\\d+","id":"\\\\d+"}', 1, NULL),
(8, 'dba5d91846ce1a5e63734dfcbcb481cb', 'articles_submitArticle', 'GET', '/articles/:cat-:catid/submit', '{"module":"Modules_articles","method":"submitArticle_form"}', '{"catid":"\\\\d+"}', 1, NULL),
(9, 'dba5d91846ce1a5e63734dfcbcb481cb', 'articles_submitArticle_process', 'POST', '/articles/:cat-:catid/submit', '{"module":"Modules_articles","method":"submitArticle_process"}', '{"catid":"\\\\d+"}', 1, NULL),
(10, 'a74ad8dfacd4f985eb3977517615ce25', 'core_registerForm', 'GET', '/register', '{"module":"Modules_core", "method":"registerUser"}', '[]', 1, NULL),
(11, 'a74ad8dfacd4f985eb3977517615ce25', 'core_registerForm_process', 'POST', '/register', '{"module":"Modules_core", "method":"registerUser"}', '[]', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_sessions`
--

DROP TABLE IF EXISTS `cscms_sessions`;
CREATE TABLE IF NOT EXISTS `cscms_sessions` (
  `uid` int(11) NOT NULL,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `hostname` varchar(128) DEFAULT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `useragent` varchar(255) NOT NULL,
  `mode` enum('active','kill','ban','update') NOT NULL DEFAULT 'active',
  `admin` int(1) NOT NULL DEFAULT '0',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `login_attempts` int(2) NOT NULL DEFAULT '0',
  `store` longblob,
  PRIMARY KEY (`sid`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cscms_sessions`
--

INSERT INTO `cscms_sessions` (`uid`, `sid`, `hostname`, `timestamp`, `useragent`, `mode`, `admin`, `login_time`, `login_attempts`, `store`) VALUES
(0, '0dddaeda75b28d161bfbfc43282d251f', '178.79.143.66', 1366969955, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; he; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3', 'active', 0, 0, 0, 0x613a303a7b7d),
(1, '267eb8e2c1eb6ac17418346ff4dfa58d', '77.98.122.22', 1366974344, 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0; Touch; ASU2JS)', 'active', 0, 0, 0, 0x613a303a7b7d),
(0, '6792c7a6675f615ea111675f1a341d2d', '77.98.122.22', 1366987013, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:20.0) Gecko/20100101 Firefox/20.0', 'active', 0, 0, 0, 0x613a303a7b7d),
(0, '7f807067face5700759005f124b6ef71', '178.79.143.66', 1366969955, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; he; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3', 'active', 0, 0, 0, 0x613a313a7b733a343a2275736572223b613a313a7b733a393a2274696d657374616d70223b693a313336363632323136333b7d7d),
(1, '8ff4c5874aaf2400c66d3173053e53d1', '85.167.48.189', 1366970663, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31', 'active', 0, 0, 0, 0x613a303a7b7d),
(0, '974f8c32e61da0ca22685f39dbddeeda', '178.79.143.66', 1366969955, 'Mozilla/5.0 (Windows; U; Windows NT 6.1; he; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3', 'active', 0, 0, 0, 0x613a303a7b7d),
(1, 'b9eb982ee7881f8d845700cd77d4bda4', '77.98.122.22', 1366976849, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:20.0) Gecko/20100101 Firefox/20.0', 'active', 0, 0, 0, 0x613a303a7b7d),
(1, 'da85dcab4fc918734493eebc38d5a1c0', '80.194.73.98', 1366970073, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:20.0) Gecko/20100101 Firefox/20.0', 'active', 0, 0, 0, 0x613a313a7b733a343a2275736572223b613a313a7b733a393a2274696d657374616d70223b693a313336363838363634333b7d7d),
(1, 'e18fae12843cfb21c086d6ef377d4e5e', '10.54.129.222', 1366992682, 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-gb; HTC One X Build/JZO54K; CyanogenMod-10.0.0) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', 'active', 0, 0, 0, 0x613a303a7b7d),
(1, 'ea572180bf0eff34a205321ea3ea4441', '94.228.45.50', 1366969982, 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31', 'active', 0, 0, 0, 0x613a303a7b7d),
(0, 'eb46ed7a9998205ca1cef18198ae2fc2', '86.29.111.233', 1367072728, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:20.0) Gecko/20100101 Firefox/20.0', 'active', 0, 0, 0, 0x613a333a7b733a343a2275736572223b613a313a7b733a393a2274696d657374616d70223b693a313336373032313436353b7d733a343a2273697465223b613a313a7b733a31333a226c6f67696e5f72656665726572223b733a33343a22687474703a2f2f786c696e6b2e637962657273686164652e6f72672f6373636d732f223b7d733a353a22746f6b656e223b733a33323a223661393930666562643236323836373536646235613063346261313337363561223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_uploads`
--

DROP TABLE IF EXISTS `cscms_uploads`;
CREATE TABLE IF NOT EXISTS `cscms_uploads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(12) NOT NULL,
  `authorized` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `public` enum('1','0') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cscms_userkeys`
--

DROP TABLE IF EXISTS `cscms_userkeys`;
CREATE TABLE IF NOT EXISTS `cscms_userkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uData` varchar(11) NOT NULL DEFAULT '0',
  `uAgent` text NOT NULL,
  `uIP` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `cscms_userkeys`
--

INSERT INTO `cscms_userkeys` (`id`, `uData`, `uAgent`, `uIP`) VALUES
(1, '00429:1', 'a08aaaebc93b57e69beb7ce74f6c6d86', '127.0.0.1'),
(2, 'c49c3:1', 'a08aaaebc93b57e69beb7ce74f6c6d86', '127.0.0.1'),
(3, '2bd67:1', 'a08aaaebc93b57e69beb7ce74f6c6d86', '127.0.0.1'),
(4, '28297:1', 'a08aaaebc93b57e69beb7ce74f6c6d86', '127.0.0.1'),
(5, 'e9122:1', 'a08aaaebc93b57e69beb7ce74f6c6d86', '127.0.0.1'),
(6, 'da853:1', 'a08aaaebc93b57e69beb7ce74f6c6d86', '127.0.0.1'),
(7, 'c9254:1', 'a08aaaebc93b57e69beb7ce74f6c6d86', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `cscms_users`
--

DROP TABLE IF EXISTS `cscms_users`;
CREATE TABLE IF NOT EXISTS `cscms_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` char(34) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pin` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `register_date` int(11) NOT NULL DEFAULT '0',
  `last_active` int(11) NOT NULL DEFAULT '0',
  `usercode` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en-gb',
  `timezone` decimal(5,1) NOT NULL DEFAULT '0.0',
  `theme` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `userlevel` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `primary_group` int(5) NOT NULL DEFAULT '0',
  `login_attempts` int(3) NOT NULL DEFAULT '0',
  `pin_attempts` int(3) NOT NULL DEFAULT '0',
  `autologin` tinyint(1) NOT NULL DEFAULT '0',
  `reffered_by` int(11) unsigned NOT NULL DEFAULT '0',
  `password_update` tinyint(1) NOT NULL DEFAULT '0',
  `whitelist` tinyint(1) NOT NULL DEFAULT '0',
  `whitelisted_ips` text COLLATE utf8_unicode_ci,
  `warnings` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `usercode` (`usercode`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cscms_users`
--

INSERT INTO `cscms_users` (`id`, `username`, `password`, `pin`, `register_date`, `last_active`, `usercode`, `email`, `show_email`, `avatar`, `title`, `language`, `timezone`, `theme`, `hidden`, `active`, `userlevel`, `banned`, `primary_group`, `login_attempts`, `pin_attempts`, `autologin`, `reffered_by`, `password_update`, `whitelist`, `whitelisted_ips`, `warnings`) VALUES
(1, 'Guest', NULL, NULL, 1366666369, 1366666369, '123456', '', 0, NULL, NULL, 'en-gb', '0.0', 'default', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(2, 'xLink', '$J$BEEgzRTdNwdrKAkHPv0/GeAMGuJCv//', NULL, 1339676795, 1339676795, 'g6dtwt', '', 0, NULL, NULL, 'en-gb', '0.0', 'default', 0, 1, 2, 0, 0, 1, 0, 0, 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_users_extras`
--

DROP TABLE IF EXISTS `cscms_users_extras`;
CREATE TABLE IF NOT EXISTS `cscms_users_extras` (
  `uid` int(11) unsigned NOT NULL,
  `birthday` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00/00/0000',
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `contact_info` text COLLATE utf8_unicode_ci,
  `about` text COLLATE utf8_unicode_ci,
  `interests` text COLLATE utf8_unicode_ci,
  `signature` text COLLATE utf8_unicode_ci,
  `usernotes` text COLLATE utf8_unicode_ci NOT NULL,
  `ajax_settings` text COLLATE utf8_unicode_ci,
  `notification_settings` text COLLATE utf8_unicode_ci,
  `forum_show_sigs` tinyint(1) NOT NULL DEFAULT '0',
  `forum_autowatch` tinyint(1) NOT NULL DEFAULT '0',
  `forum_quickreply` tinyint(1) NOT NULL DEFAULT '0',
  `forum_cat_order` text COLLATE utf8_unicode_ci,
  `forum_tracker` text COLLATE utf8_unicode_ci,
  `pagination_style` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid_2` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cscms_users_extras`
--

INSERT INTO `cscms_users_extras` (`uid`, `birthday`, `sex`, `contact_info`, `about`, `interests`, `signature`, `usernotes`, `ajax_settings`, `notification_settings`, `forum_show_sigs`, `forum_autowatch`, `forum_quickreply`, `forum_cat_order`, `forum_tracker`, `pagination_style`) VALUES
(1, '00/00/0000', 0, NULL, NULL, NULL, NULL, '', NULL, NULL, 0, 0, 0, NULL, NULL, 1),
(2, '21/12/1990', 1, NULL, NULL, NULL, NULL, '', NULL, NULL, 0, 0, 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cscms_users_perms`
--

DROP TABLE IF EXISTS `cscms_users_perms`;
CREATE TABLE IF NOT EXISTS `cscms_users_perms` (
  `permission_key` varchar(50) NOT NULL DEFAULT '',
  `permission_value` tinyint(1) NOT NULL DEFAULT '0',
  `content_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_key`,`content_id`,`user_id`),
  KEY `permission_key` (`permission_key`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cscms_article_content`
--
ALTER TABLE `cscms_article_content`
  ADD CONSTRAINT `cscms_article_content_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `cscms_article_cats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_forum_cats`
--
ALTER TABLE `cscms_forum_cats`
  ADD CONSTRAINT `cscms_forum_cats_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `cscms_forum_cats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_forum_posts`
--
ALTER TABLE `cscms_forum_posts`
  ADD CONSTRAINT `cscms_forum_posts_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `cscms_forum_threads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_forum_threads`
--
ALTER TABLE `cscms_forum_threads`
  ADD CONSTRAINT `cscms_forum_threads_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `cscms_forum_cats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_forum_watch`
--
ALTER TABLE `cscms_forum_watch`
  ADD CONSTRAINT `cscms_forum_watch_ibfk_1` FOREIGN KEY (`thread_id`) REFERENCES `cscms_forum_threads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_groups_perms`
--
ALTER TABLE `cscms_groups_perms`
  ADD CONSTRAINT `cscms_groups_perms_ibfk_1` FOREIGN KEY (`permission_key`) REFERENCES `cscms_permissions` (`key`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cscms_groups_perms_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `cscms_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_groups_subs`
--
ALTER TABLE `cscms_groups_subs`
  ADD CONSTRAINT `cscms_groups_subs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `cscms_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cscms_groups_subs_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `cscms_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_users_extras`
--
ALTER TABLE `cscms_users_extras`
  ADD CONSTRAINT `cscms_users_extras_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `cscms_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cscms_users_perms`
--
ALTER TABLE `cscms_users_perms`
  ADD CONSTRAINT `cscms_users_perms_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `cscms_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cscms_users_perms_ibfk_1` FOREIGN KEY (`permission_key`) REFERENCES `cscms_permissions` (`key`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
