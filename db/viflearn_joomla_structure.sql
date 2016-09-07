-- MySQL dump 10.13  Distrib 5.7.11-4, for osx10.11 (x86_64)
--
-- Host: localhost    Database: joomla
-- ------------------------------------------------------
-- Server version	5.7.11-4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a_2016_roster_imports`
--

DROP TABLE IF EXISTS `a_2016_roster_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_2016_roster_imports` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT '$2y$10$aSw4i.O8o18zG0RDkmSxp.GbG8yjTlKfMx1dJI1sgiidryI.UPt/m',
  `block` int(11) DEFAULT '0',
  `sendEmail` int(11) DEFAULT '0',
  `registerDate` datetime DEFAULT '2016-03-01 01:00:00',
  `lastvisitDate` datetime DEFAULT '2001-01-01 01:00:00',
  `activation` int(11) DEFAULT '0',
  `params` varchar(50) DEFAULT '{}',
  `lastResetTime` datetime DEFAULT '0000-00-00 00:00:00',
  `resetCount` int(11) DEFAULT '0',
  `requireReset` int(11) DEFAULT '0',
  `otpKey` varchar(50) DEFAULT NULL,
  `otep` varchar(50) DEFAULT NULL,
  `contactrecordtype` varchar(50) DEFAULT NULL,
  `salesforceID` varchar(50) DEFAULT NULL,
  `accountID` varchar(50) DEFAULT NULL,
  `schoolID` varchar(50) DEFAULT NULL,
  `districtID` varchar(50) DEFAULT NULL,
  `lc_user_status` varchar(45) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `subscription_group_1` varchar(255) DEFAULT NULL,
  `new_joomla_userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `a_remove_year1`
--

DROP TABLE IF EXISTS `a_remove_year1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_remove_year1` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `lc_user_id` int(11) DEFAULT NULL,
  `year2_groupid` int(11) DEFAULT NULL,
  `con_user_group` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `badge_audit`
--

DROP TABLE IF EXISTS `badge_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_audit` (
  `EarnedBadgeID` int(11) NOT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `JoomlaEarnedBadgeID` int(11) DEFAULT NULL,
  `EarnedBadgeRecipient` int(11) DEFAULT NULL,
  `EarnedBadgeIssuedDate` datetime DEFAULT NULL,
  `EarnedBadgeEvidence` varchar(87) DEFAULT NULL,
  `BadgeType` varchar(50) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `BadgeName` varchar(100) DEFAULT NULL,
  `GradeLevel` varchar(11) DEFAULT NULL,
  `Year` varchar(100) DEFAULT NULL,
  `Module` varchar(100) DEFAULT NULL,
  `BadgeIssuer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historical_subscription_data`
--

DROP TABLE IF EXISTS `historical_subscription_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historical_subscription_data` (
  `SubscriptionMappingID` int(11) DEFAULT NULL,
  `PlanID` int(11) DEFAULT NULL,
  `EmailAddress` varchar(69) DEFAULT NULL,
  `SubscriptionName` varchar(66) DEFAULT NULL,
  `LCUserID` int(11) DEFAULT NULL,
  `SubscriptionStatus` int(11) DEFAULT NULL,
  `SubscriptionStartDate` varchar(50) DEFAULT NULL,
  `SubscriptionExpirationDate` datetime DEFAULT NULL,
  `LCLastModifiedDate` datetime DEFAULT NULL,
  `distinct_matching` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import_roster1`
--

DROP TABLE IF EXISTS `import_roster1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_roster1` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` text,
  `lastname` text,
  `name` text,
  `title` text,
  `grade` text,
  `subject` text,
  `email` text,
  `username` text,
  `lc_user_status` text,
  `districtID` text,
  `schoolID` text,
  `accountID` text,
  `contactrecordtype` text,
  `subscription_plan` text,
  `usergroup` int(11) DEFAULT NULL,
  `planid` int(11) DEFAULT NULL,
  `lc_userid` int(11) DEFAULT NULL,
  `concat` text,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jitterbit_sync_updates`
--

DROP TABLE IF EXISTS `jitterbit_sync_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jitterbit_sync_updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(45) DEFAULT NULL,
  `last_successful_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lc_lti_consumer`
--

DROP TABLE IF EXISTS `lc_lti_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lc_lti_consumer` (
  `consumer_key` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `lti_version` varchar(12) DEFAULT NULL,
  `consumer_name` varchar(255) DEFAULT NULL,
  `consumer_version` varchar(255) DEFAULT NULL,
  `consumer_guid` varchar(255) DEFAULT NULL,
  `css_path` varchar(255) DEFAULT NULL,
  `protected` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enable_from` datetime DEFAULT NULL,
  `enable_until` datetime DEFAULT NULL,
  `last_access` date DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lc_lti_context`
--

DROP TABLE IF EXISTS `lc_lti_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lc_lti_context` (
  `consumer_key` varchar(255) NOT NULL,
  `context_id` varchar(255) NOT NULL,
  `lti_context_id` varchar(255) DEFAULT NULL,
  `lti_resource_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `settings` text,
  `primary_consumer_key` varchar(255) DEFAULT NULL,
  `primary_context_id` varchar(255) DEFAULT NULL,
  `share_approved` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`,`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lc_lti_nonce`
--

DROP TABLE IF EXISTS `lc_lti_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lc_lti_nonce` (
  `consumer_key` varchar(255) NOT NULL,
  `value` varchar(32) NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lc_lti_share_key`
--

DROP TABLE IF EXISTS `lc_lti_share_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lc_lti_share_key` (
  `share_key_id` varchar(32) NOT NULL,
  `primary_consumer_key` varchar(255) NOT NULL,
  `primary_context_id` varchar(255) NOT NULL,
  `auto_approve` tinyint(1) NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`share_key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lc_lti_user`
--

DROP TABLE IF EXISTS `lc_lti_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lc_lti_user` (
  `consumer_key` varchar(255) NOT NULL,
  `context_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `lti_result_sourcedid` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`,`context_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lc_user_status`
--

DROP TABLE IF EXISTS `lc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lc_user_status` (
  `user_id` int(11) DEFAULT NULL,
  `username` text,
  `lc_user_status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lead_audit`
--

DROP TABLE IF EXISTS `lead_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_audit` (
  `LC_User_Id__c` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `LC_Username__c` varchar(150) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  `LC_Member_Start_Date__c` datetime NOT NULL,
  `LC_Last_Visited_Date__c` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pd_cat_alias`
--

DROP TABLE IF EXISTS `pd_cat_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pd_cat_alias` (
  `id` int(11) DEFAULT NULL,
  `cat_name` text,
  `alias` text,
  `old_alias` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restore_enterprise2`
--

DROP TABLE IF EXISTS `restore_enterprise2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restore_enterprise2` (
  `plan_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `concatenate_userid_groupid` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_audit`
--

DROP TABLE IF EXISTS `subscription_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_audit` (
  `SubscriptionMappingID` int(11) DEFAULT NULL,
  `PlanID` int(11) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `SubscriptionName` varchar(255) DEFAULT NULL,
  `LCUserID` int(11) DEFAULT NULL,
  `SubscriptionStatus` varchar(11) DEFAULT NULL,
  `SubscriptionStartDate` datetime DEFAULT NULL,
  `SubscriptionExpirationDate` datetime DEFAULT NULL,
  `LCLastModifiedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_audit_archive`
--

DROP TABLE IF EXISTS `subscription_audit_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_audit_archive` (
  `SubscriptionMappingID` int(11) NOT NULL,
  `PlanID` int(11) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `SubscriptionName` varchar(255) NOT NULL,
  `LCUserID` int(11) NOT NULL,
  `SubscriptionStatus` varchar(11) NOT NULL,
  `SubscriptionStartDate` datetime NOT NULL,
  `SubscriptionExpirationDate` datetime NOT NULL,
  `LCLastModifiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_audit_new`
--

DROP TABLE IF EXISTS `subscription_audit_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_audit_new` (
  `SubscriptionMappingID` int(11) NOT NULL,
  `PlanID` int(11) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `SubscriptionName` varchar(255) NOT NULL,
  `LCUserID` int(11) NOT NULL,
  `SubscriptionStatus` varchar(11) NOT NULL,
  `SubscriptionStartDate` datetime NOT NULL,
  `SubscriptionExpirationDate` datetime NOT NULL,
  `LCLastModifiedDate` datetime NOT NULL,
  `distinct_matching` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_acl`
--

DROP TABLE IF EXISTS `wlje4_admintools_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_acl` (
  `user_id` bigint(20) unsigned NOT NULL,
  `permissions` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_adminiplist`
--

DROP TABLE IF EXISTS `wlje4_admintools_adminiplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_adminiplist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_badwords`
--

DROP TABLE IF EXISTS `wlje4_admintools_badwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_badwords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_cookies`
--

DROP TABLE IF EXISTS `wlje4_admintools_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_cookies` (
  `series` varchar(255) NOT NULL,
  `client_hash` varchar(255) NOT NULL,
  `valid_to` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_customperms`
--

DROP TABLE IF EXISTS `wlje4_admintools_customperms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_customperms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `perms` varchar(4) DEFAULT '0644',
  UNIQUE KEY `id` (`id`),
  KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_filescache`
--

DROP TABLE IF EXISTS `wlje4_admintools_filescache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_filescache` (
  `admintools_filescache_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(2048) NOT NULL,
  `filedate` int(11) NOT NULL DEFAULT '0',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `data` blob,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`admintools_filescache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_ipautoban`
--

DROP TABLE IF EXISTS `wlje4_admintools_ipautoban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_ipautoban` (
  `ip` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT 'other',
  `until` datetime DEFAULT NULL,
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_ipautobanhistory`
--

DROP TABLE IF EXISTS `wlje4_admintools_ipautobanhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_ipautobanhistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT 'other',
  `until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_ipblock`
--

DROP TABLE IF EXISTS `wlje4_admintools_ipblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_ipblock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_log`
--

DROP TABLE IF EXISTS `wlje4_admintools_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logdate` datetime NOT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `reason` enum('other','adminpw','ipwl','ipbl','sqlishield','antispam','wafblacklist','tpone','tmpl','template','muashield','csrfshield','badbehaviour','geoblocking','rfishield','dfishield','uploadshield','xssshield','httpbl','loginfailure','securitycode','external','awayschedule','admindir') DEFAULT NULL,
  `extradata` mediumtext,
  UNIQUE KEY `id` (`id`),
  KEY `idx_admintools_log_logdate_reason` (`logdate`,`reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_profiles`
--

DROP TABLE IF EXISTS `wlje4_admintools_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_redirects`
--

DROP TABLE IF EXISTS `wlje4_admintools_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_redirects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL,
  `ordering` bigint(20) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `keepurlparams` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_scanalerts`
--

DROP TABLE IF EXISTS `wlje4_admintools_scanalerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_scanalerts` (
  `admintools_scanalert_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(2048) NOT NULL,
  `scan_id` bigint(20) NOT NULL DEFAULT '0',
  `diff` mediumtext,
  `threat_score` int(11) NOT NULL DEFAULT '0',
  `acknowledged` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admintools_scanalert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_scans`
--

DROP TABLE IF EXISTS `wlje4_admintools_scans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_scans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') NOT NULL DEFAULT 'run',
  `origin` varchar(30) NOT NULL DEFAULT 'backend',
  `type` varchar(30) NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `backupid` varchar(255) DEFAULT NULL,
  `filesexist` tinyint(3) NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) DEFAULT NULL,
  `total_size` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fullstatus` (`filesexist`,`status`),
  KEY `idx_stale` (`status`,`origin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_storage`
--

DROP TABLE IF EXISTS `wlje4_admintools_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_storage` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_wafblacklists`
--

DROP TABLE IF EXISTS `wlje4_admintools_wafblacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_wafblacklists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `task` varchar(255) NOT NULL,
  `query` varchar(255) NOT NULL,
  `query_type` varchar(1) NOT NULL,
  `query_content` varchar(255) NOT NULL,
  `verb` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_wafexceptions`
--

DROP TABLE IF EXISTS `wlje4_admintools_wafexceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_wafexceptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `query` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admintools_waftemplates`
--

DROP TABLE IF EXISTS `wlje4_admintools_waftemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admintools_waftemplates` (
  `admintools_waftemplate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT '*',
  `subject` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `email_num` tinyint(3) unsigned NOT NULL,
  `email_numfreq` tinyint(3) unsigned NOT NULL,
  `email_freq` enum('','second','minute','hour','day') NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admintools_waftemplate_id`),
  UNIQUE KEY `admintools_waftemplate_keylang` (`reason`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admissions_document_checklist_applicant_items`
--

DROP TABLE IF EXISTS `wlje4_admissions_document_checklist_applicant_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admissions_document_checklist_applicant_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_userid` int(11) DEFAULT NULL,
  `checklist_itemid` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
<<<<<<< HEAD
  `thumbnail` varchar(255) DEFAULT 'https://www.greenprintmedia.org/images/main/icons/offline_doc.png',
  `filetitle` varchar(255) DEFAULT '{title is blank}',
  `link` varchar(255) DEFAULT 'https://www.greenprintmedia.org/index.php/offline-file-confirmation',
=======
  `thumbnail` varchar(255) DEFAULT 'https://www.viflearn.com/images/main/icons/offline_doc.png',
  `filetitle` varchar(255) DEFAULT '{title is blank}',
  `link` varchar(255) DEFAULT 'https://www.viflearn.com/index.php/offline-file-confirmation',
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  `requirement_type` varchar(255) DEFAULT NULL,
  `submissions_status` varchar(255) DEFAULT 'Submitted online',
  `acceptance_status` varchar(255) DEFAULT 'Not Reviewed',
  `salesforce_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueSFid` (`salesforce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123433 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_admissions_document_checklist_comments`
--

DROP TABLE IF EXISTS `wlje4_admissions_document_checklist_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_admissions_document_checklist_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `itemid` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `salesforceID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salesforceID_UNIQUE` (`salesforceID`)
) ENGINE=InnoDB AUTO_INCREMENT=7318 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_akeeba_common`
--

DROP TABLE IF EXISTS `wlje4_akeeba_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_akeeba_common` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_all_districts_directory`
--

DROP TABLE IF EXISTS `wlje4_all_districts_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_all_districts_directory` (
  `district_id` varchar(255) NOT NULL,
  `district_name` varchar(255) DEFAULT NULL,
  `physical_city` varchar(255) DEFAULT NULL,
  `mailing_city` varchar(255) DEFAULT NULL,
  `physical_state_province` varchar(255) DEFAULT NULL,
  `mailing_state_province` varchar(255) DEFAULT NULL,
  `passport _cohort` bit(1) DEFAULT NULL,
  `passport_single_team` bit(1) DEFAULT NULL,
  `passport_whole_school` bit(1) DEFAULT NULL,
  `splash_mandarin` bit(1) DEFAULT NULL,
  `splash_spanish` bit(1) DEFAULT NULL,
  `cet` bit(1) DEFAULT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_all_school_district_map`
--

DROP TABLE IF EXISTS `wlje4_all_school_district_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_all_school_district_map` (
  `school_id` varchar(255) NOT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `district_id` varchar(255) DEFAULT NULL,
  `district_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_all_schools_directory`
--

DROP TABLE IF EXISTS `wlje4_all_schools_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_all_schools_directory` (
  `school_id` varchar(255) NOT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `passport_cohort` bit(1) DEFAULT NULL,
  `passport_single_team` bit(1) DEFAULT NULL,
  `passport_whole_school` bit(1) DEFAULT NULL,
  `splash_mandarin` bit(1) DEFAULT NULL,
  `splash_spanish` bit(1) DEFAULT NULL,
  `cet` bit(1) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_assets`
--

DROP TABLE IF EXISTS `wlje4_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_associations`
--

DROP TABLE IF EXISTS `wlje4_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_badge_assertions`
--

DROP TABLE IF EXISTS `wlje4_badge_assertions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_badge_assertions` (
  `assertion_id` int(11) NOT NULL AUTO_INCREMENT,
  `badge_id` int(11) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `badge_url` varchar(81) DEFAULT NULL,
  `verify` varchar(50) DEFAULT NULL,
  `issuedOn` datetime DEFAULT NULL,
  `image` varchar(104) DEFAULT NULL,
  `evidence` varchar(87) DEFAULT NULL,
  `expires` int(11) DEFAULT NULL,
  `badge_type` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `schoolID` varchar(45) DEFAULT NULL,
  `districtID` varchar(45) DEFAULT NULL,
  `json_file` varchar(255) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `sf_ext_id` varchar(255) DEFAULT NULL,
  `concatenate_badgeid_userid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`assertion_id`),
  UNIQUE KEY `onebadgeperuserpercatid` (`badge_id`,`recipient`),
  KEY `sf_ext_id` (`sf_ext_id`),
  KEY `assertion_id_index` (`assertion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69447 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER afterBadgeInsert AFTER INSERT ON wlje4_badge_assertions FOR EACH ROW INSERT INTO badge_audit VALUES (
  NEW.badge_id,
  (SELECT email FROM wlje4_users WHERE id = NEW.recipient LIMIT 1),
  NEW.assertion_id,
  NEW.recipient,
  NEW.issuedOn,
  NEW.evidence,
  NEW.badge_type,
  NEW.item_id,
  (SELECT `name` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT grade_level FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT `year` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT `module` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT `issuer` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1)
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER afterBadgeUpdate AFTER UPDATE ON wlje4_badge_assertions FOR EACH ROW INSERT INTO badge_audit VALUES (
  NEW.badge_id,
  (SELECT email FROM wlje4_users WHERE id = NEW.recipient LIMIT 1),
  NEW.assertion_id,
  NEW.recipient,
  NEW.issuedOn,
  NEW.evidence,
  NEW.badge_type,
  NEW.item_id,
  (SELECT `name` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT grade_level FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT `year` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT `module` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1),
  (SELECT `issuer` FROM wlje4_badge_class WHERE badgeid = NEW.badge_id LIMIT 1)
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wlje4_badge_class`
--

DROP TABLE IF EXISTS `wlje4_badge_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_badge_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badgeid` int(11) DEFAULT NULL,
  `name` varchar(113) DEFAULT NULL,
  `description` varchar(518) DEFAULT NULL,
  `subheading` varchar(87) DEFAULT NULL,
  `image` varchar(109) DEFAULT NULL,
  `criteria` varchar(97) DEFAULT NULL,
  `criteria_description` varchar(830) DEFAULT NULL,
  `hours_equivalency` int(11) DEFAULT NULL,
  `issuer` varchar(50) DEFAULT NULL,
  `alignment` varchar(50) DEFAULT NULL,
  `tags` varchar(92) DEFAULT NULL,
  `designtitle` varchar(52) DEFAULT NULL,
  `unit` varchar(93) DEFAULT NULL,
  `ext_id` varchar(50) DEFAULT NULL,
  `program` varchar(58) DEFAULT NULL,
  `grade_level` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `module_key` varchar(51) DEFAULT NULL,
  `badge_type` varchar(50) DEFAULT NULL,
  `subid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `ordering` varchar(50) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `checked_out` varchar(50) DEFAULT NULL,
  `checked_out_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_badge_class_archive`
--

DROP TABLE IF EXISTS `wlje4_badge_class_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_badge_class_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badgeid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(800) DEFAULT NULL,
  `subheading` varchar(255) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `criteria` varchar(200) DEFAULT NULL,
  `criteria_description` varchar(800) DEFAULT NULL,
  `issuer` int(11) DEFAULT NULL,
  `alignment` varchar(200) DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `designtitle` varchar(255) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `ext_id` varchar(255) DEFAULT NULL,
  `program` varchar(400) DEFAULT NULL,
  `grade_level` varchar(11) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `module_key` varchar(45) DEFAULT NULL,
  `badge_type` varchar(45) DEFAULT NULL,
  `subid` int(11) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_badge_issuer`
--

DROP TABLE IF EXISTS `wlje4_badge_issuer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_badge_issuer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issuer_name` varchar(100) DEFAULT NULL,
  `issuer_url` varchar(200) DEFAULT NULL,
  `issuer_organization` varchar(100) DEFAULT NULL,
  `issuer_contact` varchar(100) DEFAULT NULL,
  `sf_issuer_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_badge_k2item_match`
--

DROP TABLE IF EXISTS `wlje4_badge_k2item_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_badge_k2item_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `k2itemid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10523 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_banner_clients`
--

DROP TABLE IF EXISTS `wlje4_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_banner_tracks`
--

DROP TABLE IF EXISTS `wlje4_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_banners`
--

DROP TABLE IF EXISTS `wlje4_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_blooie`
--

DROP TABLE IF EXISTS `wlje4_blooie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_blooie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `token` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_breezingforms`
--

DROP TABLE IF EXISTS `wlje4_breezingforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_breezingforms` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_breezingforms_addons_gdata`
--

DROP TABLE IF EXISTS `wlje4_breezingforms_addons_gdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_breezingforms_addons_gdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `spreadsheet_id` varchar(255) NOT NULL DEFAULT '',
  `worksheet_id` varchar(255) NOT NULL DEFAULT '',
  `fields` text NOT NULL,
  `meta` varchar(255) NOT NULL,
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id_2` (`form_id`),
  KEY `form_id` (`form_id`,`spreadsheet_id`,`worksheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_categories`
--

DROP TABLE IF EXISTS `wlje4_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core`
--

DROP TABLE IF EXISTS `wlje4_cck_core`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cck` varchar(50) NOT NULL,
  `pk` int(11) NOT NULL,
  `pkb` int(11) NOT NULL,
  `storage_location` varchar(50) NOT NULL,
  `storage_table` varchar(100) NOT NULL,
  `author_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `app` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cck` (`cck`),
  KEY `idx_pk` (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_activities`
--

DROP TABLE IF EXISTS `wlje4_cck_core_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `folder` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_category` (`folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_downloads`
--

DROP TABLE IF EXISTS `wlje4_cck_core_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_downloads` (
  `id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL,
  `collection` varchar(50) NOT NULL,
  `x` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`,`field`,`collection`,`x`),
  KEY `idx_contentid` (`id`),
  KEY `idx_item` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_fields`
--

DROP TABLE IF EXISTS `wlje4_cck_core_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `folder` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(5120) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `label` varchar(50) NOT NULL,
  `selectlabel` varchar(50) NOT NULL,
  `display` int(11) NOT NULL DEFAULT '0',
  `required` varchar(50) NOT NULL,
  `validation` varchar(50) NOT NULL,
  `defaultvalue` varchar(2048) NOT NULL,
  `options` text NOT NULL COMMENT 'string-formated options',
  `options2` text NOT NULL COMMENT 'json-formated options',
  `minlength` int(11) NOT NULL DEFAULT '0',
  `maxlength` int(11) NOT NULL DEFAULT '255',
  `size` int(11) NOT NULL DEFAULT '32',
  `cols` int(11) NOT NULL,
  `rows` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT '0',
  `divider` varchar(50) NOT NULL,
  `bool` tinyint(4) NOT NULL,
  `location` varchar(1024) NOT NULL,
  `extended` varchar(50) NOT NULL,
  `style` varchar(512) NOT NULL,
  `script` text NOT NULL,
  `bool2` tinyint(4) NOT NULL DEFAULT '0',
  `bool3` tinyint(4) NOT NULL DEFAULT '0',
  `bool4` tinyint(4) NOT NULL DEFAULT '0',
  `bool5` tinyint(4) NOT NULL DEFAULT '0',
  `bool6` tinyint(4) NOT NULL DEFAULT '0',
  `bool7` tinyint(4) NOT NULL DEFAULT '0',
  `bool8` tinyint(4) NOT NULL DEFAULT '1',
  `css` varchar(255) NOT NULL,
  `attributes` varchar(512) NOT NULL,
  `storage` varchar(50) NOT NULL,
  `storage_cck` varchar(50) NOT NULL,
  `storage_location` varchar(50) NOT NULL,
  `storage_table` varchar(100) NOT NULL,
  `storage_field` varchar(50) NOT NULL,
  `storage_field2` varchar(50) NOT NULL,
  `storage_params` varchar(2048) NOT NULL,
  `storages` varchar(2048) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_type` (`type`),
  KEY `idx_folder` (`folder`)
) ENGINE=InnoDB AUTO_INCREMENT=5029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_folders`
--

DROP TABLE IF EXISTS `wlje4_cck_core_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `path` varchar(1024) NOT NULL,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `introchar` varchar(2) NOT NULL,
  `colorchar` varchar(50) NOT NULL,
  `elements` varchar(255) NOT NULL,
  `icon_path` varchar(100) NOT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `description` varchar(5120) NOT NULL,
  `app` varchar(50) NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `home` tinyint(3) NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_objects`
--

DROP TABLE IF EXISTS `wlje4_cck_core_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `component` varchar(50) NOT NULL,
  `context` varchar(50) NOT NULL,
  `options` text NOT NULL,
  `vars` varchar(255) NOT NULL,
  `view` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_component` (`component`),
  KEY `idx_view` (`view`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_preferences`
--

DROP TABLE IF EXISTS `wlje4_cck_core_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_preferences` (
  `userid` int(11) NOT NULL,
  `options` text NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_search_field`
--

DROP TABLE IF EXISTS `wlje4_cck_core_search_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_search_field` (
  `searchid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `client` varchar(50) NOT NULL,
  `ordering` int(11) NOT NULL,
  `label` varchar(255) NOT NULL COMMENT 'search,list,item',
  `variation` varchar(50) NOT NULL COMMENT 'search',
  `variation_override` varchar(1024) NOT NULL COMMENT 'search',
  `required` varchar(50) NOT NULL COMMENT 'search',
  `required_alert` varchar(1024) NOT NULL COMMENT 'search',
  `validation` varchar(50) NOT NULL COMMENT 'search',
  `validation_options` varchar(1024) NOT NULL COMMENT 'search',
  `link` varchar(50) NOT NULL COMMENT 'list,item',
  `link_options` varchar(1024) NOT NULL COMMENT 'list,item',
  `live` varchar(50) NOT NULL COMMENT 'search',
  `live_options` varchar(1024) NOT NULL COMMENT 'search',
  `live_value` varchar(255) NOT NULL COMMENT 'search',
  `markup` varchar(50) NOT NULL COMMENT 'search,list,item',
  `markup_class` varchar(255) NOT NULL COMMENT 'list,item',
  `match_collection` varchar(50) NOT NULL COMMENT 'search',
  `match_mode` varchar(50) NOT NULL COMMENT 'search',
  `match_options` varchar(512) NOT NULL COMMENT 'search',
  `match_value` varchar(50) NOT NULL COMMENT 'search',
  `typo` varchar(50) NOT NULL COMMENT 'list,item',
  `typo_label` tinyint(4) NOT NULL COMMENT 'list,item',
  `typo_options` varchar(2048) NOT NULL COMMENT 'list,item',
  `stage` int(11) NOT NULL DEFAULT '0' COMMENT 'search',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'search,list,item',
  `restriction` varchar(512) NOT NULL COMMENT 'search,list,item',
  `restriction_options` text NOT NULL COMMENT 'search,list,item',
  `computation` varchar(512) NOT NULL COMMENT 'search',
  `computation_options` varchar(1024) NOT NULL COMMENT 'search',
  `conditional` varchar(2048) NOT NULL COMMENT 'search',
  `conditional_options` text NOT NULL COMMENT 'search',
  `position` varchar(50) NOT NULL COMMENT 'search,list,item',
  PRIMARY KEY (`searchid`,`fieldid`,`client`),
  KEY `searchid` (`searchid`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_search_position`
--

DROP TABLE IF EXISTS `wlje4_cck_core_search_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_search_position` (
  `searchid` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `client` varchar(50) NOT NULL,
  `legend` varchar(255) NOT NULL,
  `variation` varchar(50) NOT NULL,
  `variation_options` text NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `css` varchar(255) NOT NULL,
  PRIMARY KEY (`searchid`,`position`,`client`),
  KEY `position` (`position`),
  KEY `searchid` (`searchid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_searchs`
--

DROP TABLE IF EXISTS `wlje4_cck_core_searchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_searchs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `folder` int(11) NOT NULL,
  `content` int(11) NOT NULL DEFAULT '0',
  `template_search` int(11) NOT NULL,
  `template_filter` int(11) NOT NULL,
  `template_list` int(11) NOT NULL,
  `template_item` int(11) NOT NULL,
  `description` varchar(5120) NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `published` tinyint(4) NOT NULL,
  `options` text NOT NULL,
  `location` varchar(50) NOT NULL,
  `sef_route` varchar(50) NOT NULL,
  `storage_location` varchar(50) NOT NULL,
  `stylesheets` varchar(5) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_folder` (`folder`),
  KEY `idx_template_search` (`template_search`),
  KEY `idx_template_filter` (`template_filter`),
  KEY `idx_template_list` (`template_list`),
  KEY `idx_template_item` (`template_item`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_sites`
--

DROP TABLE IF EXISTS `wlje4_cck_core_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `aliases` varchar(512) NOT NULL,
  `guest` int(11) NOT NULL,
  `guest_only_group` int(11) NOT NULL,
  `guest_only_viewlevel` int(11) NOT NULL,
  `groups` varchar(255) NOT NULL,
  `viewlevels` varchar(255) NOT NULL,
  `configuration` varchar(1024) NOT NULL,
  `options` varchar(2048) NOT NULL,
  `description` varchar(5120) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_templates`
--

DROP TABLE IF EXISTS `wlje4_cck_core_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `folder` int(11) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `description` varchar(5120) NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_folder` (`folder`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_type_field`
--

DROP TABLE IF EXISTS `wlje4_cck_core_type_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_type_field` (
  `typeid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `client` varchar(50) NOT NULL,
  `ordering` int(11) NOT NULL,
  `label` varchar(255) NOT NULL COMMENT 'admin,site,intro,content',
  `variation` varchar(50) NOT NULL COMMENT 'admin,site',
  `variation_override` varchar(1024) NOT NULL COMMENT 'admin,site',
  `required` varchar(50) NOT NULL COMMENT 'admin,site',
  `required_alert` varchar(1024) NOT NULL COMMENT 'admin,site',
  `validation` varchar(50) NOT NULL COMMENT 'admin,site',
  `validation_options` varchar(1024) NOT NULL COMMENT 'admin,site',
  `link` varchar(50) NOT NULL COMMENT 'intro,content',
  `link_options` varchar(1024) NOT NULL COMMENT 'intro,content',
  `live` varchar(50) NOT NULL COMMENT 'admin,site',
  `live_options` varchar(1024) NOT NULL COMMENT 'admin,site',
  `live_value` varchar(255) NOT NULL COMMENT 'admin,site',
  `markup` varchar(50) NOT NULL COMMENT 'admin,site,intro,content',
  `markup_class` varchar(255) NOT NULL COMMENT 'intro,content',
  `typo` varchar(50) NOT NULL COMMENT 'intro,content',
  `typo_label` tinyint(4) NOT NULL COMMENT 'intro,content',
  `typo_options` varchar(2048) NOT NULL COMMENT 'intro,content',
  `stage` int(11) NOT NULL DEFAULT '0' COMMENT 'admin,site',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'admin,site,intro,content',
  `restriction` varchar(512) NOT NULL COMMENT 'admin,site,intro,content',
  `restriction_options` text NOT NULL COMMENT 'admin,site,intro,content',
  `computation` varchar(512) NOT NULL COMMENT 'admin,site',
  `computation_options` varchar(1024) NOT NULL COMMENT 'admin,site',
  `conditional` varchar(2048) NOT NULL COMMENT 'admin,site',
  `conditional_options` text NOT NULL COMMENT 'admin,site',
  `position` varchar(50) NOT NULL COMMENT 'admin,site,intro,content',
  PRIMARY KEY (`typeid`,`fieldid`,`client`),
  KEY `typeid` (`typeid`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_type_position`
--

DROP TABLE IF EXISTS `wlje4_cck_core_type_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_type_position` (
  `typeid` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `client` varchar(50) NOT NULL,
  `legend` varchar(255) NOT NULL,
  `variation` varchar(50) NOT NULL,
  `variation_options` text NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `css` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`,`position`,`client`),
  KEY `typeid` (`typeid`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_types`
--

DROP TABLE IF EXISTS `wlje4_cck_core_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `folder` int(11) NOT NULL,
  `template_admin` int(11) NOT NULL DEFAULT '0',
  `template_site` int(11) NOT NULL DEFAULT '0',
  `template_content` int(11) NOT NULL DEFAULT '0',
  `template_intro` int(11) NOT NULL DEFAULT '0',
  `description` varchar(5120) NOT NULL,
  `indexed` varchar(50) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `options_admin` text NOT NULL,
  `options_site` text NOT NULL,
  `options_content` text NOT NULL,
  `options_intro` text NOT NULL,
  `location` varchar(50) NOT NULL,
  `parent` varchar(50) NOT NULL,
  `storage_location` varchar(50) NOT NULL,
  `stylesheets` varchar(5) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '3',
  `created_date` datetime NOT NULL,
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_date` datetime NOT NULL,
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_folder` (`folder`),
  KEY `idx_template_admin` (`template_admin`),
  KEY `idx_template_site` (`template_site`),
  KEY `idx_template_content` (`template_content`),
  KEY `idx_template_intro` (`template_intro`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_core_versions`
--

DROP TABLE IF EXISTS `wlje4_cck_core_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_core_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_id` int(11) NOT NULL DEFAULT '0',
  `e_title` varchar(50) NOT NULL,
  `e_name` varchar(50) NOT NULL,
  `e_type` varchar(50) NOT NULL,
  `e_version` int(11) NOT NULL DEFAULT '1',
  `e_core` longblob,
  `e_more` varchar(255) NOT NULL,
  `e_more1` longblob,
  `e_more2` longblob,
  `e_more3` longblob,
  `e_more4` longblob,
  `e_more5` longblob,
  `date_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_id_version` (`e_id`,`e_type`,`e_version`)
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_more_countries`
--

DROP TABLE IF EXISTS `wlje4_cck_more_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_more_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) NOT NULL,
  `name_fr` varchar(255) NOT NULL,
  `code2` varchar(5) NOT NULL,
  `code3` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_more_processings`
--

DROP TABLE IF EXISTS `wlje4_cck_more_processings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_more_processings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `folder` int(11) NOT NULL DEFAULT '1',
  `type` varchar(50) NOT NULL,
  `description` varchar(5120) NOT NULL,
  `options` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `scriptfile` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_more_sessions`
--

DROP TABLE IF EXISTS `wlje4_cck_more_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_more_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `extension` varchar(50) NOT NULL,
  `folder` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `options` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_form_article`
--

DROP TABLE IF EXISTS `wlje4_cck_store_form_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_form_article` (
  `id` int(11) NOT NULL,
  `ggk5y1m1` varchar(255) NOT NULL DEFAULT '',
  `attachments` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_form_badge_metadata_form`
--

DROP TABLE IF EXISTS `wlje4_cck_store_form_badge_metadata_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_form_badge_metadata_form` (
  `id` int(11) NOT NULL,
  `article_title` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_form_k2_item_display`
--

DROP TABLE IF EXISTS `wlje4_cck_store_form_k2_item_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_form_k2_item_display` (
  `id` int(11) NOT NULL,
  `load_all_k2_items` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_form_my_lesson_plans3`
--

DROP TABLE IF EXISTS `wlje4_cck_store_form_my_lesson_plans3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_form_my_lesson_plans3` (
  `id` int(11) NOT NULL,
  `title_header` varchar(255) NOT NULL,
  `title_header_text` varchar(255) NOT NULL,
  `ggk5y1m1_name` varchar(255) NOT NULL,
  `edit_lesson_plan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_form_resource_library_main_page`
--

DROP TABLE IF EXISTS `wlje4_cck_store_form_resource_library_main_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_form_resource_library_main_page` (
  `id` int(11) NOT NULL,
  `resource_library_main_page` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_item_cck_store_form_k2_item_display`
--

DROP TABLE IF EXISTS `wlje4_cck_store_item_cck_store_form_k2_item_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_item_cck_store_form_k2_item_display` (
  `id` int(11) NOT NULL,
  `cck` varchar(50) NOT NULL,
  `unpublish_from_library` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_item_content`
--

DROP TABLE IF EXISTS `wlje4_cck_store_item_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_item_content` (
  `id` int(11) NOT NULL,
  `cck` varchar(50) NOT NULL,
  `wlje4_badge_class | name` varchar(255) NOT NULL,
  `resource_library_search_results_narrow` varchar(255) NOT NULL,
  `resource_library_search_results_wide` varchar(255) NOT NULL,
  `rebuild_test` varchar(255) NOT NULL,
  `rebuild_test_prj` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_item_k2_items`
--

DROP TABLE IF EXISTS `wlje4_cck_store_item_k2_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_item_k2_items` (
  `id` int(11) NOT NULL,
  `cck` varchar(50) NOT NULL,
  `unpublish_from_library` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_item_users`
--

DROP TABLE IF EXISTS `wlje4_cck_store_item_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_item_users` (
  `id` int(11) NOT NULL,
  `cck` varchar(50) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `about_me` text NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `birthdate` datetime NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_join_article_title`
--

DROP TABLE IF EXISTS `wlje4_cck_store_join_article_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_join_article_title` (
  `id` int(11) NOT NULL,
  `id2` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_join_id`
--

DROP TABLE IF EXISTS `wlje4_cck_store_join_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_join_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id2` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_cck_store_join_test`
--

DROP TABLE IF EXISTS `wlje4_cck_store_join_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_cck_store_join_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id2` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PRIMARY 2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_access_log`
--

DROP TABLE IF EXISTS `wlje4_community_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_access_log` (
  `user_hash` varchar(50) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `task` varchar(50) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `domain` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_activities`
--

DROP TABLE IF EXISTS `wlje4_community_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor` int(10) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `app` varchar(200) NOT NULL,
  `verb` varchar(200) NOT NULL,
  `cid` int(10) NOT NULL,
  `groupid` int(10) DEFAULT NULL,
  `eventid` int(10) DEFAULT NULL,
  `group_access` tinyint(4) NOT NULL DEFAULT '0',
  `event_access` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `access` tinyint(3) unsigned NOT NULL,
  `params` text NOT NULL,
  `points` int(4) NOT NULL DEFAULT '1',
  `archived` tinyint(3) NOT NULL,
  `location` text NOT NULL,
  `latitude` float NOT NULL DEFAULT '255',
  `longitude` float NOT NULL DEFAULT '255',
  `comment_id` int(10) NOT NULL,
  `comment_type` varchar(200) NOT NULL,
  `like_id` int(10) NOT NULL,
  `like_type` varchar(200) NOT NULL,
  `actors` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `actor` (`actor`),
  KEY `target` (`target`),
  KEY `app` (`app`),
  KEY `created` (`created`),
  KEY `archived` (`archived`)
) ENGINE=InnoDB AUTO_INCREMENT=95749 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_activities_MIA202`
--

DROP TABLE IF EXISTS `wlje4_community_activities_MIA202`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_activities_MIA202` (
  `id` int(11) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `title` blob,
  `content` blob,
  `app` blob,
  `verb` blob,
  `cid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `eventid` int(11) DEFAULT NULL,
  `group_access` int(11) DEFAULT NULL,
  `event_access` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `params` blob,
  `points` int(11) DEFAULT NULL,
  `archived` int(11) DEFAULT NULL,
  `location` blob,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `comment_type` blob,
  `like_id` int(11) DEFAULT NULL,
  `like_type` blob,
  `actors` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_activities_MIA404`
--

DROP TABLE IF EXISTS `wlje4_community_activities_MIA404`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_activities_MIA404` (
  `id` int(11) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `title` text,
  `content` text,
  `app` varchar(50) DEFAULT NULL,
  `verb` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `eventid` int(11) DEFAULT NULL,
  `group_access` int(11) DEFAULT NULL,
  `event_access` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `params` text,
  `points` int(11) DEFAULT NULL,
  `archived` int(11) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `comment_type` varchar(50) DEFAULT NULL,
  `like_id` int(11) DEFAULT NULL,
  `like_type` varchar(50) DEFAULT NULL,
  `actors` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_activities_hide`
--

DROP TABLE IF EXISTS `wlje4_community_activities_hide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_activities_hide` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_activities_import_MIA`
--

DROP TABLE IF EXISTS `wlje4_community_activities_import_MIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_activities_import_MIA` (
  `id` int(11) DEFAULT NULL,
  `Column1` varchar(50) DEFAULT NULL,
  `actor` varchar(2500) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `title` varchar(5000) DEFAULT NULL,
  `content` text,
  `app` varchar(50) DEFAULT NULL,
  `verb` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `eventid` int(11) DEFAULT NULL,
  `group_access` int(11) DEFAULT NULL,
  `event_access` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `params` varchar(5000) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `archived` int(11) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `comment_type` varchar(50) DEFAULT NULL,
  `like_id` int(11) DEFAULT NULL,
  `like_type` varchar(50) DEFAULT NULL,
  `actors` varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_advertisement`
--

DROP TABLE IF EXISTS `wlje4_community_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_advertisement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(60) NOT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `date_expiration` int(18) DEFAULT NULL,
  `description` text NOT NULL,
  `img` varchar(150) NOT NULL DEFAULT 'no_image.png',
  `cdate` datetime NOT NULL,
  `location` varchar(155) NOT NULL,
  `ad_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_apps`
--

DROP TABLE IF EXISTS `wlje4_community_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `apps` varchar(200) NOT NULL,
  `ordering` int(10) unsigned NOT NULL,
  `position` varchar(50) NOT NULL DEFAULT 'content',
  `params` text NOT NULL,
  `privacy` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_userid` (`userid`),
  KEY `idx_user_apps` (`userid`,`apps`)
) ENGINE=InnoDB AUTO_INCREMENT=11741 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_avatar`
--

DROP TABLE IF EXISTS `wlje4_community_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_avatar` (
  `id` int(10) unsigned NOT NULL,
  `apptype` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `type` tinyint(3) unsigned NOT NULL COMMENT '0 = small, 1 = medium, 2=large',
  UNIQUE KEY `id` (`id`,`apptype`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_badges`
--

DROP TABLE IF EXISTS `wlje4_community_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `image` varchar(256) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `points` (`points`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_blocklist`
--

DROP TABLE IF EXISTS `wlje4_community_blocklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_blocklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `blocked_userid` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `blocked_userid` (`blocked_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_config`
--

DROP TABLE IF EXISTS `wlje4_community_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_config` (
  `name` varchar(64) NOT NULL,
  `params` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_connect_users`
--

DROP TABLE IF EXISTS `wlje4_community_connect_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_connect_users` (
  `connectid` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_connection`
--

DROP TABLE IF EXISTS `wlje4_community_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_connection` (
  `connection_id` int(11) NOT NULL AUTO_INCREMENT,
  `connect_from` int(11) NOT NULL,
  `connect_to` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `group` int(11) NOT NULL,
  `msg` text NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `connect_from` (`connect_from`,`connect_to`,`status`,`group`),
  KEY `idx_connect_to` (`connect_to`),
  KEY `idx_connect_from` (`connect_from`),
  KEY `idx_connect_tofrom` (`connect_to`,`connect_from`)
) ENGINE=InnoDB AUTO_INCREMENT=94467 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_engagement`
--

DROP TABLE IF EXISTS `wlje4_community_engagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_engagement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `week` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64499 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_event_stats`
--

DROP TABLE IF EXISTS `wlje4_community_event_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_event_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `params` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_events`
--

DROP TABLE IF EXISTS `wlje4_community_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL COMMENT 'parent for recurring event',
  `catid` int(11) unsigned NOT NULL,
  `contentid` int(11) unsigned DEFAULT '0' COMMENT '0 - if type == profile, else it hold the group id',
  `type` varchar(255) NOT NULL DEFAULT 'profile' COMMENT 'profile, group',
  `title` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `summary` text NOT NULL,
  `description` text,
  `creator` int(11) unsigned NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `permission` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0 - Open (Anyone can mark attendence), 1 - Private (Only invited can mark attendence)',
  `avatar` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `cover` text NOT NULL,
  `invitedcount` int(11) unsigned DEFAULT '0',
  `confirmedcount` int(11) unsigned DEFAULT '0' COMMENT 'treat this as member count as well',
  `declinedcount` int(11) unsigned DEFAULT '0',
  `maybecount` int(11) unsigned DEFAULT '0',
  `wallcount` int(11) unsigned DEFAULT '0',
  `ticket` int(11) unsigned DEFAULT '0' COMMENT 'Represent how many guest can be joined or invited.',
  `allowinvite` tinyint(1) unsigned DEFAULT '1' COMMENT '0 - guest member cannot invite thier friends to join. 1 - yes, guest member can invite any of thier friends to join.',
  `created` datetime DEFAULT NULL,
  `hits` int(11) unsigned DEFAULT '0',
  `published` int(11) unsigned DEFAULT '1',
  `latitude` float NOT NULL DEFAULT '255',
  `longitude` float NOT NULL DEFAULT '255',
  `offset` varchar(5) DEFAULT NULL,
  `allday` tinyint(11) NOT NULL DEFAULT '0',
  `repeat` varchar(50) DEFAULT NULL COMMENT 'null,daily,weekly,monthly',
  `repeatend` date NOT NULL,
  `params` text NOT NULL,
  `storage` varchar(64) NOT NULL DEFAULT 'file',
  `unlisted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_creator` (`creator`),
  KEY `idx_period` (`startdate`,`enddate`),
  KEY `idx_type` (`type`),
  KEY `idx_catid` (`catid`),
  KEY `idx_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_events_category`
--

DROP TABLE IF EXISTS `wlje4_community_events_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_events_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_events_members`
--

DROP TABLE IF EXISTS `wlje4_community_events_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_events_members` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventid` int(11) unsigned NOT NULL,
  `memberid` int(11) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '[Join / Invite]: 0 - [pending approval/pending invite], 1 - [approved/confirmed], 2 - [rejected/declined], 3 - [maybe/maybe], 4 - [blocked/blocked]',
  `permission` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '1 - creator, 2 - admin, 3 - member',
  `invited_by` int(11) unsigned DEFAULT '0',
  `approval` tinyint(1) unsigned DEFAULT '0' COMMENT '0 - no approval required, 1 - required admin approval',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eventid` (`eventid`),
  KEY `idx_status` (`status`),
  KEY `idx_invitedby` (`invited_by`),
  KEY `idx_permission` (`eventid`,`permission`),
  KEY `idx_member_event` (`eventid`,`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_featured`
--

DROP TABLE IF EXISTS `wlje4_community_featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_featured` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_fields`
--

DROP TABLE IF EXISTS `wlje4_community_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `ordering` int(11) DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `min` int(5) NOT NULL,
  `max` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tips` text NOT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `required` tinyint(1) DEFAULT '0',
  `searchable` tinyint(1) DEFAULT '1',
  `registration` tinyint(1) DEFAULT '1',
  `options` text,
  `fieldcode` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fieldcode` (`fieldcode`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_fields_values`
--

DROP TABLE IF EXISTS `wlje4_community_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_fields_values` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `field_id` int(10) NOT NULL,
  `value` text NOT NULL,
  `access` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_user_fieldid` (`user_id`,`field_id`),
  KEY `access` (`access`)
) ENGINE=InnoDB AUTO_INCREMENT=26329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_files`
--

DROP TABLE IF EXISTS `wlje4_community_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `groupid` int(11) NOT NULL,
  `discussionid` int(11) NOT NULL,
  `bulletinid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `profileid` int(11) NOT NULL,
  `messageid` int(11) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `storage` varchar(64) NOT NULL,
  `creator` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussionid` (`discussionid`),
  KEY `groupid` (`groupid`),
  KEY `creator` (`creator`),
  KEY `bulletinid` (`bulletinid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_group_stats`
--

DROP TABLE IF EXISTS `wlje4_community_group_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_group_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `params` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2213 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_groups`
--

DROP TABLE IF EXISTS `wlje4_community_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `approvals` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `avatar` text NOT NULL,
  `thumb` text NOT NULL,
  `cover` text NOT NULL,
  `discusscount` int(11) NOT NULL DEFAULT '0',
  `wallcount` int(11) NOT NULL DEFAULT '0',
  `membercount` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `storage` varchar(64) NOT NULL DEFAULT 'file',
  `hits` int(11) NOT NULL,
  `summary` text NOT NULL,
  `unlisted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_groups_bulletins`
--

DROP TABLE IF EXISTS `wlje4_community_groups_bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_groups_bulletins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_groups_category`
--

DROP TABLE IF EXISTS `wlje4_community_groups_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_groups_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_groups_discuss`
--

DROP TABLE IF EXISTS `wlje4_community_groups_discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_groups_discuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `lastreplied` datetime NOT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=3673 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_groups_invite`
--

DROP TABLE IF EXISTS `wlje4_community_groups_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_groups_invite` (
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_groups_members`
--

DROP TABLE IF EXISTS `wlje4_community_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_groups_members` (
  `groupid` int(11) NOT NULL,
  `memberid` int(11) NOT NULL,
  `approved` int(11) NOT NULL,
  `permissions` int(1) NOT NULL,
  KEY `groupid` (`groupid`),
  KEY `idx_memberid` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_hashtag`
--

DROP TABLE IF EXISTS `wlje4_community_hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_hashtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(128) NOT NULL,
  `params` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_invitations`
--

DROP TABLE IF EXISTS `wlje4_community_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callback` varchar(255) NOT NULL,
  `cid` int(11) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_likes`
--

DROP TABLE IF EXISTS `wlje4_community_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element` varchar(200) NOT NULL,
  `uid` int(10) NOT NULL,
  `like` text NOT NULL,
  `dislike` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `element` (`element`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19771 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_location_cache`
--

DROP TABLE IF EXISTS `wlje4_community_location_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_location_cache` (
  `address` varchar(255) NOT NULL,
  `latitude` float NOT NULL DEFAULT '255',
  `longitude` float NOT NULL DEFAULT '255',
  `data` text NOT NULL,
  `status` varchar(2) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_mailq`
--

DROP TABLE IF EXISTS `wlje4_community_mailq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_mailq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient` text NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `template` varchar(64) NOT NULL,
  `email_type` text,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34527 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_memberlist`
--

DROP TABLE IF EXISTS `wlje4_community_memberlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_memberlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `condition` varchar(255) NOT NULL,
  `avataronly` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_memberlist_criteria`
--

DROP TABLE IF EXISTS `wlje4_community_memberlist_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_memberlist_criteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listid` int(11) NOT NULL,
  `field` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listid` (`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_moods`
--

DROP TABLE IF EXISTS `wlje4_community_moods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_moods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(128) NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `custom` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  `allowcustomtext` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_msg`
--

DROP TABLE IF EXISTS `wlje4_community_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(10) unsigned NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `deleted` tinyint(3) unsigned DEFAULT '0',
  `from_name` varchar(45) NOT NULL,
  `posted_on` datetime DEFAULT NULL,
  `subject` tinytext NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_msg_recepient`
--

DROP TABLE IF EXISTS `wlje4_community_msg_recepient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_msg_recepient` (
  `msg_id` int(10) unsigned NOT NULL,
  `msg_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `msg_from` int(10) unsigned NOT NULL,
  `to` int(10) unsigned NOT NULL,
  `bcc` tinyint(3) unsigned DEFAULT '0',
  `is_read` tinyint(3) unsigned DEFAULT '0',
  `deleted` tinyint(3) unsigned DEFAULT '0',
  UNIQUE KEY `un` (`msg_id`,`to`),
  KEY `msg_id` (`msg_id`),
  KEY `to` (`to`),
  KEY `idx_isread_to_deleted` (`is_read`,`to`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_notifications`
--

DROP TABLE IF EXISTS `wlje4_community_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(200) NOT NULL,
  `cmd_type` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `target` (`target`),
  KEY `actor` (`actor`)
) ENGINE=InnoDB AUTO_INCREMENT=9883353 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_oauth`
--

DROP TABLE IF EXISTS `wlje4_community_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_oauth` (
  `userid` int(11) NOT NULL,
  `requesttoken` text NOT NULL,
  `accesstoken` text NOT NULL,
  `app` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_photo_stats`
--

DROP TABLE IF EXISTS `wlje4_community_photo_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_photo_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `params` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46479 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_photos`
--

DROP TABLE IF EXISTS `wlje4_community_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumid` int(11) NOT NULL,
  `caption` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `creator` int(11) NOT NULL,
  `permissions` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `original` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `storage` varchar(64) NOT NULL DEFAULT 'file',
  `created` datetime NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `status` varchar(200) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  KEY `idx_storage` (`storage`)
) ENGINE=InnoDB AUTO_INCREMENT=26715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_photos_albums`
--

DROP TABLE IF EXISTS `wlje4_community_photos_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_photos_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photoid` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `permissions` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `path` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `groupid` int(11) NOT NULL DEFAULT '0',
  `eventid` int(11) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `location` text NOT NULL,
  `latitude` float NOT NULL DEFAULT '255',
  `longitude` float NOT NULL DEFAULT '255',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator` (`creator`),
  KEY `idx_type` (`type`),
  KEY `idx_albumtype` (`id`,`type`),
  KEY `idx_creatortype` (`creator`,`type`),
  KEY `idx_groupid` (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=4900 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_photos_tag`
--

DROP TABLE IF EXISTS `wlje4_community_photos_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_photos_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_photoid` (`photoid`),
  KEY `idx_userid` (`userid`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_photo_user` (`photoid`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=849 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_photos_tokens`
--

DROP TABLE IF EXISTS `wlje4_community_photos_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_photos_tokens` (
  `userid` int(11) NOT NULL,
  `token` varchar(200) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_profile_stats`
--

DROP TABLE IF EXISTS `wlje4_community_profile_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_profile_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `params` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20096 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_profiles`
--

DROP TABLE IF EXISTS `wlje4_community_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `approvals` tinyint(3) NOT NULL,
  `published` tinyint(3) NOT NULL,
  `avatar` text NOT NULL,
  `watermark` text NOT NULL,
  `watermark_hash` varchar(255) NOT NULL,
  `watermark_location` text NOT NULL,
  `thumb` text NOT NULL,
  `created` datetime NOT NULL,
  `create_groups` tinyint(1) DEFAULT '1',
  `create_events` int(11) DEFAULT '1',
  `profile_lock` tinyint(1) DEFAULT '0',
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `approvals` (`approvals`,`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_profiles_fields`
--

DROP TABLE IF EXISTS `wlje4_community_profiles_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_profiles_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `multiprofile_id` (`parent`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_register`
--

DROP TABLE IF EXISTS `wlje4_community_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_register` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(200) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(180) NOT NULL,
  `lastname` varchar(180) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `ip` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_register_auth_token`
--

DROP TABLE IF EXISTS `wlje4_community_register_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_register_auth_token` (
  `token` varchar(200) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `auth_key` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`token`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_reports`
--

DROP TABLE IF EXISTS `wlje4_community_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniquestring` varchar(200) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_reports_actions`
--

DROP TABLE IF EXISTS `wlje4_community_reports_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_reports_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reportid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `parameters` varchar(255) NOT NULL,
  `defaultaction` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_reports_reporter`
--

DROP TABLE IF EXISTS `wlje4_community_reports_reporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_reports_reporter` (
  `reportid` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_storage_s3`
--

DROP TABLE IF EXISTS `wlje4_community_storage_s3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_storage_s3` (
  `storageid` varchar(255) NOT NULL,
  `resource_path` varchar(255) NOT NULL,
  UNIQUE KEY `storageid` (`storageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_tags`
--

DROP TABLE IF EXISTS `wlje4_community_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element` varchar(200) NOT NULL,
  `userid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `tag` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1545 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_tags_words`
--

DROP TABLE IF EXISTS `wlje4_community_tags_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_tags_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(200) NOT NULL,
  `count` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_theme`
--

DROP TABLE IF EXISTS `wlje4_community_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_user_status`
--

DROP TABLE IF EXISTS `wlje4_community_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_user_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `status` text NOT NULL,
  `posted_on` int(11) NOT NULL,
  `location` text NOT NULL,
  `latitude` float NOT NULL DEFAULT '255',
  `longitude` float NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_userpoints`
--

DROP TABLE IF EXISTS `wlje4_community_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_userpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) NOT NULL DEFAULT '',
  `rule_description` text NOT NULL,
  `rule_plugin` varchar(255) NOT NULL DEFAULT '',
  `action_string` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(255) NOT NULL DEFAULT '',
  `access` tinyint(1) NOT NULL DEFAULT '1',
  `points` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_users`
--

DROP TABLE IF EXISTS `wlje4_community_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_users` (
  `userid` int(11) NOT NULL,
  `status` text NOT NULL,
  `status_access` int(11) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL,
  `posted_on` datetime NOT NULL,
  `avatar` text NOT NULL,
  `thumb` text NOT NULL,
  `cover` text NOT NULL,
  `invite` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `friends` text NOT NULL,
  `groups` text NOT NULL,
  `events` text NOT NULL,
  `friendcount` int(11) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL,
  `latitude` float NOT NULL DEFAULT '255',
  `longitude` float NOT NULL DEFAULT '255',
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `storage` varchar(64) NOT NULL DEFAULT 'file',
  `watermark_hash` varchar(255) NOT NULL,
  `search_email` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_users_TEST`
--

DROP TABLE IF EXISTS `wlje4_community_users_TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_users_TEST` (
  `userid` int(11) DEFAULT NULL,
  `status` varchar(476) DEFAULT NULL,
  `status_access` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `posted_on` varchar(50) DEFAULT NULL,
  `avatar` varchar(72) DEFAULT NULL,
  `thumb` varchar(78) DEFAULT NULL,
  `cover` varchar(92) DEFAULT NULL,
  `invite` int(11) DEFAULT NULL,
  `params` varchar(3874) DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `friends` varchar(3258) DEFAULT NULL,
  `groups` varchar(123) DEFAULT NULL,
  `events` varchar(50) DEFAULT NULL,
  `friendcount` int(11) DEFAULT NULL,
  `alias` varchar(67) DEFAULT NULL,
  `latitude` decimal(28,10) DEFAULT NULL,
  `longitude` decimal(28,10) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `storage` varchar(50) DEFAULT NULL,
  `watermark_hash` varchar(50) DEFAULT NULL,
  `search_email` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_video_stats`
--

DROP TABLE IF EXISTS `wlje4_community_video_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_video_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `params` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_videos`
--

DROP TABLE IF EXISTS `wlje4_community_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_videos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL DEFAULT 'file',
  `video_id` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `creator` int(11) unsigned NOT NULL,
  `creator_type` varchar(200) NOT NULL DEFAULT 'user',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `permissions` varchar(255) NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL,
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '1',
  `featured` tinyint(3) NOT NULL DEFAULT '0',
  `duration` float unsigned DEFAULT '0',
  `status` varchar(200) NOT NULL DEFAULT 'pending',
  `thumb` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `groupid` int(11) unsigned NOT NULL DEFAULT '0',
  `eventid` int(11) NOT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `storage` varchar(64) NOT NULL DEFAULT 'file',
  `location` text NOT NULL,
  `latitude` float NOT NULL DEFAULT '255',
  `longitude` float NOT NULL DEFAULT '255',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator` (`creator`),
  KEY `idx_groupid` (`groupid`),
  KEY `idx_storage` (`storage`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_videos_category`
--

DROP TABLE IF EXISTS `wlje4_community_videos_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_videos_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_videos_tag`
--

DROP TABLE IF EXISTS `wlje4_community_videos_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_videos_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `position` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_community_wall`
--

DROP TABLE IF EXISTS `wlje4_community_wall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_community_wall` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `post_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL,
  `comment` text NOT NULL,
  `date` varchar(45) NOT NULL,
  `published` tinyint(1) unsigned NOT NULL,
  `type` varchar(200) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentid` (`contentid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=26192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contact_details`
--

DROP TABLE IF EXISTS `wlje4_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_content`
--

DROP TABLE IF EXISTS `wlje4_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `introtext` mediumtext,
  `fulltext` mediumtext,
  `state` tinyint(3) DEFAULT '0',
  `catid` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned DEFAULT '0',
  `created_by_alias` varchar(255) DEFAULT '',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned DEFAULT '0',
  `checked_out` int(10) unsigned DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  `images` text,
  `urls` text,
  `attribs` varchar(5120) DEFAULT NULL,
  `version` int(10) unsigned DEFAULT '1',
  `ordering` int(11) DEFAULT '0',
  `metakey` text,
  `metadesc` text,
  `access` int(10) unsigned DEFAULT '0',
  `hits` int(10) unsigned DEFAULT '0',
  `metadata` text,
  `featured` tinyint(3) unsigned DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) DEFAULT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) DEFAULT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_content_frontpage`
--

DROP TABLE IF EXISTS `wlje4_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_content_rating`
--

DROP TABLE IF EXISTS `wlje4_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_content_types`
--

DROP TABLE IF EXISTS `wlje4_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_articles`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT '',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `record_id` bigint(20) NOT NULL DEFAULT '0',
  `form_id` int(11) NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `record_id` (`record_id`,`form_id`),
  KEY `article_id` (`article_id`,`record_id`),
  KEY `record_id_2` (`record_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_elements`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `change_type` varchar(255) NOT NULL DEFAULT '',
  `options` text NOT NULL,
  `custom_init_script` text NOT NULL,
  `custom_action_script` text NOT NULL,
  `custom_validation_script` text NOT NULL,
  `validation_message` text NOT NULL,
  `default_value` text NOT NULL,
  `hint` text NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `list_include` tinyint(1) NOT NULL DEFAULT '0',
  `search_include` tinyint(1) NOT NULL DEFAULT '1',
  `item_wrapper` text NOT NULL,
  `wordwrap` int(11) NOT NULL DEFAULT '0',
  `linkable` tinyint(1) NOT NULL DEFAULT '1',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `validations` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `order_type` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reference_id` (`reference_id`),
  KEY `form_id` (`form_id`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_forms`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `tag` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `details_template` longtext NOT NULL,
  `details_prepare` longtext NOT NULL,
  `editable_template` longtext NOT NULL,
  `editable_prepare` longtext NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(255) NOT NULL DEFAULT '',
  `modified_by` varchar(255) NOT NULL DEFAULT '',
  `metadata` tinyint(1) NOT NULL DEFAULT '1',
  `export_xls` tinyint(1) NOT NULL DEFAULT '0',
  `print_button` tinyint(1) NOT NULL DEFAULT '1',
  `show_id_column` tinyint(1) NOT NULL DEFAULT '0',
  `use_view_name_as_title` tinyint(1) NOT NULL DEFAULT '0',
  `display_in` tinyint(1) NOT NULL DEFAULT '0',
  `edit_button` tinyint(1) NOT NULL DEFAULT '0',
  `list_state` tinyint(1) NOT NULL DEFAULT '0',
  `list_publish` tinyint(1) NOT NULL DEFAULT '0',
  `list_language` tinyint(1) NOT NULL DEFAULT '0',
  `list_article` tinyint(1) NOT NULL DEFAULT '0',
  `list_author` tinyint(1) NOT NULL DEFAULT '0',
  `select_column` tinyint(1) NOT NULL DEFAULT '0',
  `published_only` tinyint(1) NOT NULL DEFAULT '0',
  `own_only` tinyint(1) NOT NULL DEFAULT '0',
  `own_only_fe` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `intro_text` text NOT NULL,
  `config` longtext NOT NULL,
  `default_section` int(11) NOT NULL DEFAULT '0',
  `default_category` int(11) NOT NULL DEFAULT '0',
  `default_lang_code` varchar(7) NOT NULL DEFAULT '*',
  `default_lang_code_ignore` tinyint(1) NOT NULL DEFAULT '0',
  `create_articles` tinyint(1) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `initial_sort_order` varchar(255) NOT NULL DEFAULT '-1',
  `initial_sort_order2` varchar(255) NOT NULL DEFAULT '-1',
  `initial_sort_order3` varchar(255) NOT NULL DEFAULT '-1',
  `initial_order_dir` varchar(4) NOT NULL DEFAULT 'desc',
  `title_field` int(11) NOT NULL DEFAULT '0',
  `delete_articles` tinyint(1) NOT NULL DEFAULT '1',
  `edit_by_type` tinyint(1) NOT NULL DEFAULT '0',
  `email_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `email_update_notifications` tinyint(1) NOT NULL DEFAULT '0',
  `limited_article_options` tinyint(1) NOT NULL DEFAULT '1',
  `limited_article_options_fe` tinyint(1) NOT NULL DEFAULT '1',
  `upload_directory` text NOT NULL,
  `protect_upload_directory` tinyint(1) NOT NULL DEFAULT '1',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `limit_add` int(11) NOT NULL DEFAULT '0',
  `limit_edit` int(11) NOT NULL DEFAULT '0',
  `verification_required_view` tinyint(1) NOT NULL DEFAULT '0',
  `verification_days_view` float NOT NULL DEFAULT '0',
  `verification_required_new` tinyint(1) NOT NULL DEFAULT '0',
  `verification_days_new` float NOT NULL DEFAULT '0',
  `verification_required_edit` tinyint(1) NOT NULL DEFAULT '0',
  `verification_days_edit` float NOT NULL DEFAULT '0',
  `verification_url_view` text NOT NULL,
  `verification_url_new` text NOT NULL,
  `verification_url_edit` text NOT NULL,
  `show_all_languages_fe` tinyint(1) NOT NULL DEFAULT '1',
  `default_publish_up_days` int(11) NOT NULL DEFAULT '0',
  `default_publish_down_days` int(11) NOT NULL DEFAULT '0',
  `default_access` int(11) NOT NULL DEFAULT '0',
  `default_featured` tinyint(1) NOT NULL DEFAULT '0',
  `email_admin_template` text NOT NULL,
  `email_admin_subject` varchar(255) NOT NULL DEFAULT '',
  `email_admin_alternative_from` varchar(255) NOT NULL DEFAULT '',
  `email_admin_alternative_fromname` varchar(255) NOT NULL DEFAULT '',
  `email_admin_recipients` text NOT NULL,
  `email_admin_recipients_attach_uploads` text NOT NULL,
  `email_admin_html` tinyint(1) NOT NULL DEFAULT '0',
  `email_template` text NOT NULL,
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_alternative_from` varchar(255) NOT NULL DEFAULT '',
  `email_alternative_fromname` varchar(255) NOT NULL,
  `email_recipients` text NOT NULL,
  `email_recipients_attach_uploads` text NOT NULL,
  `email_html` tinyint(1) NOT NULL DEFAULT '0',
  `act_as_registration` tinyint(1) NOT NULL DEFAULT '0',
  `registration_username_field` varchar(255) NOT NULL DEFAULT '',
  `registration_password_field` varchar(255) NOT NULL DEFAULT '',
  `registration_password_repeat_field` varchar(255) NOT NULL DEFAULT '',
  `registration_name_field` varchar(255) NOT NULL DEFAULT '',
  `registration_email_field` varchar(255) NOT NULL DEFAULT '',
  `registration_email_repeat_field` varchar(255) NOT NULL DEFAULT '',
  `auto_publish` tinyint(1) NOT NULL DEFAULT '0',
  `force_login` tinyint(1) NOT NULL DEFAULT '0',
  `force_url` text NOT NULL,
  `registration_bypass_plugin` varchar(255) NOT NULL DEFAULT '',
  `registration_bypass_plugin_params` text NOT NULL,
  `registration_bypass_verification_name` varchar(255) NOT NULL DEFAULT '',
  `registration_bypass_verify_view` varchar(32) NOT NULL DEFAULT '',
  `theme_plugin` varchar(255) NOT NULL DEFAULT '',
  `list_rating` tinyint(1) NOT NULL DEFAULT '0',
  `rating_slots` tinyint(1) NOT NULL DEFAULT '5',
  `rand_date_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rand_update` int(11) NOT NULL DEFAULT '86400',
  `article_record_impact_publish` tinyint(1) NOT NULL DEFAULT '0',
  `article_record_impact_language` tinyint(1) NOT NULL DEFAULT '0',
  `allow_external_filter` tinyint(1) NOT NULL DEFAULT '0',
  `show_filter` tinyint(1) NOT NULL DEFAULT '1',
  `show_records_per_page` tinyint(1) NOT NULL DEFAULT '1',
  `initial_list_limit` tinyint(4) NOT NULL DEFAULT '20',
  `save_button_title` varchar(255) NOT NULL DEFAULT '',
  `filter_exact_match` tinyint(1) NOT NULL DEFAULT '0',
  `apply_button_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `reference_id` (`reference_id`),
  KEY `rand_date_update` (`rand_date_update`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_list_records`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_list_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_list_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `record_id` bigint(20) NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`,`record_id`,`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_list_states`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_list_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_list_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_rating_cache`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_rating_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_rating_cache` (
  `record_id` varchar(255) NOT NULL DEFAULT '',
  `form_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `record_id` (`record_id`,`form_id`,`ip`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_records`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `record_id` bigint(20) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `edited` int(11) NOT NULL DEFAULT '0',
  `sef` varchar(50) NOT NULL DEFAULT '',
  `lang_code` varchar(7) NOT NULL DEFAULT '*',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_future` tinyint(1) NOT NULL DEFAULT '0',
  `rating_sum` int(10) NOT NULL DEFAULT '0',
  `rating_count` int(10) NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `rand_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `robots` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `rights` varchar(255) NOT NULL DEFAULT '',
  `xreference` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `record_id` (`record_id`),
  KEY `reference_id` (`reference_id`),
  KEY `rand_date` (`rand_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_registered_users`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_registered_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_registered_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `record_id` bigint(20) NOT NULL DEFAULT '0',
  `form_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`record_id`,`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_resource_access`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_resource_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_resource_access` (
  `type` varchar(100) NOT NULL DEFAULT '',
  `form_id` int(11) NOT NULL DEFAULT '0',
  `element_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` varchar(100) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `type` (`type`,`element_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_storage_fields`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_storage_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_storage_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `is_group` tinyint(1) NOT NULL DEFAULT '0',
  `group_definition` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `storage_id` (`storage_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_storages`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_storages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `bytable` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_users`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `form_id` int(11) NOT NULL DEFAULT '0',
  `records` int(11) NOT NULL DEFAULT '0',
  `verified_view` tinyint(1) NOT NULL DEFAULT '0',
  `verification_date_view` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `verified_new` tinyint(1) NOT NULL DEFAULT '0',
  `verification_date_new` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `verified_edit` tinyint(1) NOT NULL DEFAULT '0',
  `verification_date_edit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `limit_add` int(11) NOT NULL DEFAULT '0',
  `limit_edit` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentbuilder_verifications`
--

DROP TABLE IF EXISTS `wlje4_contentbuilder_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentbuilder_verifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verification_hash` varchar(255) NOT NULL DEFAULT '',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `verification_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `verification_data` text NOT NULL,
  `create_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `plugin` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `is_test` tinyint(1) NOT NULL DEFAULT '0',
  `setup` text NOT NULL,
  `client` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `verification_hash` (`verification_hash`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_contentitem_tag_map`
--

DROP TABLE IF EXISTS `wlje4_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_core_log_searches`
--

DROP TABLE IF EXISTS `wlje4_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_acl`
--

DROP TABLE IF EXISTS `wlje4_discuss_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_acl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `public` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `discuss_post_acl_action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_acl_group`
--

DROP TABLE IF EXISTS `wlje4_discuss_acl_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_acl_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) unsigned NOT NULL,
  `acl_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_post_acl_content_type` (`content_id`,`type`),
  KEY `discuss_post_acl` (`acl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_assignment_map`
--

DROP TABLE IF EXISTS `wlje4_discuss_assignment_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_assignment_map` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `assignee_id` bigint(20) unsigned NOT NULL,
  `assigner_id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_attachments`
--

DROP TABLE IF EXISTS `wlje4_discuss_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` text NOT NULL,
  `type` varchar(200) NOT NULL,
  `path` text NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(3) NOT NULL,
  `mime` text NOT NULL,
  `size` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_badges`
--

DROP TABLE IF EXISTS `wlje4_discuss_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_badges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `avatar` text NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(3) NOT NULL,
  `rule_limit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_badges_alias` (`alias`),
  KEY `discuss_badges_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_badges_history`
--

DROP TABLE IF EXISTS `wlje4_discuss_badges_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_badges_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `command` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_badges_rules`
--

DROP TABLE IF EXISTS `wlje4_discuss_badges_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_badges_rules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `command` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `callback` text NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_badges_users`
--

DROP TABLE IF EXISTS `wlje4_discuss_badges_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_badges_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `badge_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(3) NOT NULL,
  `custom` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `badge_id` (`badge_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_captcha`
--

DROP TABLE IF EXISTS `wlje4_discuss_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `response` varchar(5) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_category`
--

DROP TABLE IF EXISTS `wlje4_discuss_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `private` int(11) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `params` text NOT NULL,
  `container` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `discuss_cat_published` (`published`),
  KEY `discuss_cat_parentid` (`parent_id`),
  KEY `discuss_cat_mod_categories1` (`published`,`private`,`id`),
  KEY `discuss_cat_mod_categories2` (`published`,`private`,`ordering`),
  KEY `discuss_cat_acl` (`parent_id`,`published`,`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_category_acl_item`
--

DROP TABLE IF EXISTS `wlje4_discuss_category_acl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_category_acl_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `description` text,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_category_acl_map`
--

DROP TABLE IF EXISTS `wlje4_discuss_category_acl_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_category_acl_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `acl_id` bigint(20) NOT NULL,
  `type` varchar(25) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `discuss_category_acl` (`category_id`),
  KEY `discuss_category_acl_id` (`acl_id`),
  KEY `discuss_content_type` (`content_id`,`type`),
  KEY `discuss_category_content_type` (`category_id`,`content_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=53954 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_comments`
--

DROP TABLE IF EXISTS `wlje4_discuss_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) unsigned DEFAULT '0',
  `ordering` tinyint(1) unsigned DEFAULT '0',
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `discuss_comment_postid` (`post_id`),
  KEY `discuss_comment_post_created` (`post_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_configs`
--

DROP TABLE IF EXISTS `wlje4_discuss_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_configs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_conversations`
--

DROP TABLE IF EXISTS `wlje4_discuss_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_conversations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `lastreplied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_conversations_message`
--

DROP TABLE IF EXISTS `wlje4_discuss_conversations_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_conversations_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) NOT NULL,
  `message` text,
  `created` datetime NOT NULL,
  `created_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_id` (`conversation_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_conversations_message_maps`
--

DROP TABLE IF EXISTS `wlje4_discuss_conversations_message_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_conversations_message_maps` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `conversation_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `node_id` (`user_id`),
  KEY `conversation_id` (`conversation_id`),
  KEY `message_id` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_conversations_participants`
--

DROP TABLE IF EXISTS `wlje4_discuss_conversations_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_conversations_participants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_id` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_customfields`
--

DROP TABLE IF EXISTS `wlje4_discuss_customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_customfields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `params` text,
  `ordering` bigint(20) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_customfields_acl`
--

DROP TABLE IF EXISTS `wlje4_discuss_customfields_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_customfields_acl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `acl_published` tinyint(1) unsigned NOT NULL,
  `default` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_customfields_rule`
--

DROP TABLE IF EXISTS `wlje4_discuss_customfields_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_customfields_rule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `acl_id` bigint(20) NOT NULL,
  `content_id` int(10) NOT NULL,
  `content_type` varchar(25) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cf_rule_field_id` (`field_id`),
  KEY `cf_rule_acl_types` (`content_type`,`acl_id`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_customfields_value`
--

DROP TABLE IF EXISTS `wlje4_discuss_customfields_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_customfields_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `value` text NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cf_value_field_id` (`field_id`),
  KEY `cf_value_field_post` (`field_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_favourites`
--

DROP TABLE IF EXISTS `wlje4_discuss_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_favourites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fav_postid` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_hashkeys`
--

DROP TABLE IF EXISTS `wlje4_discuss_hashkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_hashkeys` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `key` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_likes`
--

DROP TABLE IF EXISTS `wlje4_discuss_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `discuss_content_type` (`type`,`content_id`),
  KEY `discuss_contentid` (`content_id`),
  KEY `discuss_createdby` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_mailq`
--

DROP TABLE IF EXISTS `wlje4_discuss_mailq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_mailq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `mailfrom` varchar(255) DEFAULT NULL,
  `fromname` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `ashtml` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_mailq_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=34653 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_migrators`
--

DROP TABLE IF EXISTS `wlje4_discuss_migrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_migrators` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `internal_id` bigint(20) NOT NULL,
  `external_id` bigint(20) NOT NULL,
  `component` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_external_id` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_notifications`
--

DROP TABLE IF EXISTS `wlje4_discuss_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `cid` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `target` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  `permalink` text NOT NULL,
  `state` tinyint(4) NOT NULL,
  `favicon` text NOT NULL,
  `component` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_notification_created` (`created`),
  KEY `discuss_notification` (`target`,`state`,`cid`,`created`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_oauth`
--

DROP TABLE IF EXISTS `wlje4_discuss_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `request_token` text NOT NULL,
  `access_token` text NOT NULL,
  `message` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_oauth_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_oauth_posts`
--

DROP TABLE IF EXISTS `wlje4_discuss_oauth_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_oauth_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `oauth_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_points`
--

DROP TABLE IF EXISTS `wlje4_discuss_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(3) NOT NULL,
  `rule_limit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_points_rule` (`rule_id`),
  KEY `discuss_points_published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_polls`
--

DROP TABLE IF EXISTS `wlje4_discuss_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_polls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `value` text NOT NULL,
  `count` bigint(20) NOT NULL DEFAULT '0',
  `multiple_polls` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `polls_posts` (`post_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_polls_question`
--

DROP TABLE IF EXISTS `wlje4_discuss_polls_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_polls_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `multiple` tinyint(1) DEFAULT '0',
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_polls_users`
--

DROP TABLE IF EXISTS `wlje4_discuss_polls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_polls_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `poll_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `session_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_post_types`
--

DROP TABLE IF EXISTS `wlje4_discuss_post_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_post_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `suffix` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(3) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_posts`
--

DROP TABLE IF EXISTS `wlje4_discuss_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` text,
  `alias` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `replied` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` longtext NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote` int(11) unsigned DEFAULT '0',
  `hits` int(11) unsigned DEFAULT '0',
  `islock` tinyint(1) unsigned DEFAULT '0',
  `lockdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `featured` tinyint(1) unsigned DEFAULT '0',
  `isresolve` tinyint(1) unsigned DEFAULT '0',
  `isreport` tinyint(1) unsigned DEFAULT '0',
  `answered` tinyint(1) unsigned DEFAULT '0',
  `user_id` bigint(20) unsigned DEFAULT '0',
  `parent_id` bigint(20) unsigned DEFAULT '0',
  `user_type` varchar(255) NOT NULL,
  `poster_name` varchar(255) NOT NULL,
  `poster_email` varchar(255) NOT NULL,
  `num_likes` int(11) DEFAULT '0',
  `num_negvote` int(11) DEFAULT '0',
  `sum_totalvote` int(11) DEFAULT '0',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `password` text,
  `legacy` tinyint(1) DEFAULT '1',
  `address` text,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `content_type` varchar(25) DEFAULT NULL,
  `post_status` tinyint(1) NOT NULL DEFAULT '0',
  `post_type` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `private` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Determines if the discussion should be a private ticket or not.',
  PRIMARY KEY (`id`),
  KEY `discuss_post_published` (`published`),
  KEY `discuss_post_user_id` (`user_id`),
  KEY `discuss_post_vote` (`vote`),
  KEY `discuss_post_isreport` (`isreport`),
  KEY `discuss_post_answered` (`answered`),
  KEY `discuss_post_category` (`category_id`),
  KEY `discuss_post_query1` (`published`,`parent_id`,`answered`,`id`),
  KEY `discuss_post_query2` (`published`,`parent_id`,`answered`,`replied`),
  KEY `discuss_post_query3` (`published`,`parent_id`,`category_id`,`created`),
  KEY `discuss_post_query4` (`published`,`parent_id`,`category_id`,`id`),
  KEY `discuss_post_query5` (`published`,`parent_id`,`created`),
  KEY `discuss_post_query6` (`published`,`parent_id`,`id`),
  KEY `unread_category_posts` (`published`,`parent_id`,`legacy`,`category_id`,`id`),
  KEY `discuss_post_last_reply` (`parent_id`,`id`),
  KEY `idx_post_type` (`post_type`),
  KEY `private` (`private`),
  KEY `discuss_post_parentid` (`published`,`parent_id`),
  FULLTEXT KEY `discuss_post_titlecontent` (`title`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=1701 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_posts_labels`
--

DROP TABLE IF EXISTS `wlje4_discuss_posts_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_posts_labels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` bigint(20) NOT NULL DEFAULT '0',
  `creator` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_posts_labels_map`
--

DROP TABLE IF EXISTS `wlje4_discuss_posts_labels_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_posts_labels_map` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `post_label_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_posts_references`
--

DROP TABLE IF EXISTS `wlje4_discuss_posts_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_posts_references` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `reference_id` bigint(20) NOT NULL,
  `extension` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_posts_tags`
--

DROP TABLE IF EXISTS `wlje4_discuss_posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_posts_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `tag_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tag` (`post_id`,`tag_id`),
  KEY `discuss_posts_tags_tagid` (`tag_id`),
  KEY `discuss_posts_tags_postid` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_ranks`
--

DROP TABLE IF EXISTS `wlje4_discuss_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_ranks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `start` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `discuss_ranks_range` (`start`,`end`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_ranks_users`
--

DROP TABLE IF EXISTS `wlje4_discuss_ranks_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_ranks_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rank_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ranks_users` (`rank_id`,`user_id`),
  KEY `ranks_id` (`rank_id`),
  KEY `ranks_userid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1512 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_reports`
--

DROP TABLE IF EXISTS `wlje4_discuss_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `reason` text,
  `created_by` bigint(20) unsigned DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `discuss_reports_post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_roles`
--

DROP TABLE IF EXISTS `wlje4_discuss_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `usergroup_id` int(10) unsigned NOT NULL,
  `colorcode` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` bigint(20) NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_rules`
--

DROP TABLE IF EXISTS `wlje4_discuss_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_rules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `command` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `callback` text NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_rules_command` (`command`(255))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_subscription`
--

DROP TABLE IF EXISTS `wlje4_discuss_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_subscription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `member` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL DEFAULT 'daily',
  `cid` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `interval` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `sent_out` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_tags`
--

DROP TABLE IF EXISTS `wlje4_discuss_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(1) unsigned DEFAULT '0',
  `user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_tags_alias` (`alias`),
  KEY `discuss_tags_user_id` (`user_id`),
  KEY `discuss_tags_published` (`published`),
  KEY `discuss_tags_query1` (`published`,`id`),
  FULLTEXT KEY `discuss_tags_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_users`
--

DROP TABLE IF EXISTS `wlje4_discuss_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_users` (
  `id` bigint(20) unsigned NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `params` text,
  `alias` varchar(255) DEFAULT NULL,
  `points` bigint(20) NOT NULL DEFAULT '0',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `location` text NOT NULL,
  `signature` text NOT NULL,
  `edited` text NOT NULL,
  `posts_read` text,
  `site` text,
  PRIMARY KEY (`id`),
  KEY `discuss_users_alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_users_history`
--

DROP TABLE IF EXISTS `wlje4_discuss_users_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_users_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `command` text NOT NULL,
  `created` datetime NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_views`
--

DROP TABLE IF EXISTS `wlje4_discuss_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_views` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=6225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_discuss_votes`
--

DROP TABLE IF EXISTS `wlje4_discuss_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_discuss_votes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `ipaddress` varchar(15) DEFAULT NULL,
  `value` tinyint(2) DEFAULT '0',
  `session_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discuss_user_post` (`user_id`,`post_id`),
  KEY `discuss_post_id` (`post_id`),
  KEY `discuss_user_id` (`user_id`),
  KEY `discuss_session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_acl`
--

DROP TABLE IF EXISTS `wlje4_easyblog_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_acl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '1',
  `description` text NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `easyblog_post_acl_action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_acl_filters`
--

DROP TABLE IF EXISTS `wlje4_easyblog_acl_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_acl_filters` (
  `content_id` bigint(20) unsigned NOT NULL,
  `disallow_tags` text NOT NULL,
  `disallow_attributes` text NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_acl_group`
--

DROP TABLE IF EXISTS `wlje4_easyblog_acl_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_acl_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) unsigned NOT NULL,
  `acl_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `easyblog_post_acl_content_type` (`content_id`,`type`),
  KEY `easyblog_post_acl` (`acl_id`),
  KEY `acl_grp_acl_type` (`acl_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3355 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_adsense`
--

DROP TABLE IF EXISTS `wlje4_easyblog_adsense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_adsense` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `display` varchar(255) NOT NULL DEFAULT 'both',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_autoarticle_map`
--

DROP TABLE IF EXISTS `wlje4_easyblog_autoarticle_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_autoarticle_map` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autoarticle_map_post_id` (`post_id`),
  KEY `autoarticle_map_content_id` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_blogger_subscription`
--

DROP TABLE IF EXISTS `wlje4_easyblog_blogger_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_blogger_subscription` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blogger_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT '0',
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_blogger_subscription_blogger_id` (`blogger_id`),
  KEY `easyblog_blogger_subscription_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_captcha`
--

DROP TABLE IF EXISTS `wlje4_easyblog_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `response` varchar(5) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_category`
--

DROP TABLE IF EXISTS `wlje4_easyblog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `private` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned DEFAULT '0',
  `lft` int(11) unsigned DEFAULT '0',
  `rgt` int(11) unsigned DEFAULT '0',
  `default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `easyblog_cat_published` (`published`),
  KEY `easyblog_cat_parentid` (`parent_id`),
  KEY `easyblog_cat_private` (`private`),
  KEY `easyblog_cat_lft` (`lft`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_category_acl`
--

DROP TABLE IF EXISTS `wlje4_easyblog_category_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_category_acl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `acl_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `easyblog_category_acl` (`category_id`),
  KEY `easyblog_category_acl_id` (`acl_id`),
  KEY `easyblog_content_type` (`content_id`,`type`),
  KEY `easyblog_category_content_type` (`category_id`,`content_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_category_acl_item`
--

DROP TABLE IF EXISTS `wlje4_easyblog_category_acl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_category_acl_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `description` text,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_category_subscription`
--

DROP TABLE IF EXISTS `wlje4_easyblog_category_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_category_subscription` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT '0',
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_category_subscription_category_id` (`category_id`),
  KEY `easyblog_category_subscription_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_comment`
--

DROP TABLE IF EXISTS `wlje4_easyblog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `comment` text,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `created_by` bigint(20) unsigned DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `sent` tinyint(1) DEFAULT '1',
  `parent_id` int(11) unsigned DEFAULT '0',
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `easyblog_comment_postid` (`post_id`),
  KEY `easyblog_comment_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_configs`
--

DROP TABLE IF EXISTS `wlje4_easyblog_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_configs` (
  `name` varchar(255) NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store any configuration in key => params maps';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_drafts`
--

DROP TABLE IF EXISTS `wlje4_easyblog_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_drafts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` bigint(20) NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `title` text,
  `permalink` text NOT NULL,
  `content` longtext NOT NULL,
  `intro` longtext NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `private` int(11) unsigned NOT NULL DEFAULT '0',
  `allowcomment` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `subscription` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `frontpage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isnew` tinyint(3) unsigned DEFAULT '0' COMMENT 'To indicate whether the post is new created or already been edited',
  `ispending` tinyint(1) DEFAULT '0',
  `issitewide` tinyint(1) DEFAULT '1',
  `blogpassword` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `trackbacks` text NOT NULL,
  `blog_contribute` tinyint(1) NOT NULL,
  `autopost` text NOT NULL,
  `autopost_centralized` text NOT NULL,
  `pending_approval` tinyint(3) DEFAULT '0',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `address` text,
  `external_source` text,
  `external_group_id` int(11) DEFAULT NULL,
  `robots` text,
  `copyrights` text,
  `language` char(7) NOT NULL,
  `source` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `send_notification_emails` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `easyblog_post_catid` (`category_id`),
  KEY `easyblog_post_published` (`published`),
  KEY `easyblog_post_created_by` (`created_by`),
  KEY `easyblog_post_pending_approval` (`pending_approval`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_external`
--

DROP TABLE IF EXISTS `wlje4_easyblog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `external_groups_post_id` (`post_id`),
  KEY `external_groups_group_id` (`uid`),
  KEY `external_groups_posts` (`uid`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_external_groups`
--

DROP TABLE IF EXISTS `wlje4_easyblog_external_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_external_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` text NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `external_groups_post_id` (`post_id`),
  KEY `external_groups_group_id` (`group_id`),
  KEY `external_groups_posts` (`group_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_featured`
--

DROP TABLE IF EXISTS `wlje4_easyblog_featured`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_featured` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `easyblog_featured_content_type` (`content_id`,`type`),
  KEY `easyblog_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_feedburner`
--

DROP TABLE IF EXISTS `wlje4_easyblog_feedburner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_feedburner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_feeds`
--

DROP TABLE IF EXISTS `wlje4_easyblog_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_feeds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `url` text NOT NULL,
  `interval` int(11) NOT NULL,
  `cron` tinyint(3) NOT NULL,
  `item_creator` int(11) NOT NULL,
  `item_category` bigint(20) NOT NULL,
  `item_frontpage` tinyint(3) NOT NULL,
  `item_published` tinyint(3) NOT NULL,
  `item_content` text NOT NULL,
  `item_get_fulltext` tinyint(3) NOT NULL DEFAULT '0',
  `author` tinyint(3) NOT NULL,
  `params` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `created` datetime NOT NULL,
  `last_import` datetime NOT NULL,
  `flag` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cron` (`cron`),
  KEY `item_creator` (`item_creator`),
  KEY `author` (`author`),
  KEY `item_frontpage` (`item_frontpage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_feeds_history`
--

DROP TABLE IF EXISTS `wlje4_easyblog_feeds_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_feeds_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feed_id` bigint(20) NOT NULL,
  `post_id` int(11) NOT NULL,
  `uid` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_post_id` (`feed_id`,`post_id`),
  KEY `feed_uids` (`feed_id`,`uid`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_hashkeys`
--

DROP TABLE IF EXISTS `wlje4_easyblog_hashkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_hashkeys` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `key` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_likes`
--

DROP TABLE IF EXISTS `wlje4_easyblog_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_content_type` (`type`,`content_id`),
  KEY `easyblog_contentid` (`content_id`),
  KEY `easyblog_createdby` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_mailq`
--

DROP TABLE IF EXISTS `wlje4_easyblog_mailq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_mailq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailfrom` varchar(255) DEFAULT NULL,
  `fromname` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `easyblog_mailq_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_mediamanager`
--

DROP TABLE IF EXISTS `wlje4_easyblog_mediamanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_mediamanager` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  FULLTEXT KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_meta`
--

DROP TABLE IF EXISTS `wlje4_easyblog_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `content_id` int(11) NOT NULL,
  `keywords` text,
  `description` text,
  `indexing` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_migrate_content`
--

DROP TABLE IF EXISTS `wlje4_easyblog_migrate_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_migrate_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT 'com_content',
  `filename` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `post_id` (`post_id`),
  KEY `session_id` (`session_id`),
  KEY `component_content` (`content_id`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store migrated joomla content id and map with eblog post id.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_oauth`
--

DROP TABLE IF EXISTS `wlje4_easyblog_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `auto` tinyint(1) NOT NULL,
  `request_token` text NOT NULL,
  `access_token` text NOT NULL,
  `message` text NOT NULL,
  `created` datetime NOT NULL,
  `private` tinyint(4) NOT NULL,
  `params` text NOT NULL,
  `system` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `easyblog_oauth_user_type` (`user_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_oauth_posts`
--

DROP TABLE IF EXISTS `wlje4_easyblog_oauth_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_oauth_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `sent` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `easyblog_oauth_posts_ids` (`oauth_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_post`
--

DROP TABLE IF EXISTS `wlje4_easyblog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `title` text,
  `permalink` text NOT NULL,
  `content` longtext NOT NULL,
  `intro` longtext NOT NULL,
  `excerpt` text,
  `category_id` bigint(20) unsigned NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `private` int(11) unsigned NOT NULL DEFAULT '0',
  `allowcomment` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `subscription` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `frontpage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isnew` tinyint(3) unsigned DEFAULT '0' COMMENT 'To indicate whether the post is new created or already been edited',
  `ispending` tinyint(1) DEFAULT '0',
  `issitewide` tinyint(1) DEFAULT '1',
  `blogpassword` varchar(100) NOT NULL DEFAULT '',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `address` text,
  `system` tinyint(3) unsigned DEFAULT '0',
  `source` varchar(255) NOT NULL,
  `robots` text,
  `copyrights` text,
  `image` text,
  `language` char(7) NOT NULL,
  `send_notification_emails` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `easyblog_post_catid` (`category_id`),
  KEY `easyblog_post_published` (`published`),
  KEY `easyblog_post_created_by` (`created_by`),
  KEY `easyblog_post_blogger_list` (`published`,`id`,`created_by`),
  KEY `easyblog_post_search` (`private`,`published`,`issitewide`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_post_rejected`
--

DROP TABLE IF EXISTS `wlje4_easyblog_post_rejected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_post_rejected` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `draft_id` bigint(20) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `message` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `draft_id` (`draft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_post_subscription`
--

DROP TABLE IF EXISTS `wlje4_easyblog_post_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_post_subscription` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT '0',
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_post_subscription_post_id` (`post_id`),
  KEY `easyblog_post_subscription_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_post_tag`
--

DROP TABLE IF EXISTS `wlje4_easyblog_post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_post_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_post_tag_tag_id` (`tag_id`),
  KEY `easyblog_post_tag_post_id` (`post_id`),
  KEY `easyblog_post_tagpost_id` (`tag_id`,`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5025 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_ratings`
--

DROP TABLE IF EXISTS `wlje4_easyblog_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `sessionid` varchar(200) NOT NULL,
  `value` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `published` tinyint(3) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`uid`),
  KEY `created_by` (`created_by`),
  KEY `rating` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_reports`
--

DROP TABLE IF EXISTS `wlje4_easyblog_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_reports` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_id` bigint(20) NOT NULL,
  `obj_type` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `ip` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`,`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_site_subscription`
--

DROP TABLE IF EXISTS `wlje4_easyblog_site_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_site_subscription` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT '0',
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_site_subscription_user_id` (`user_id`),
  KEY `easyblog_site_subscription_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_stream`
--

DROP TABLE IF EXISTS `wlje4_easyblog_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_stream` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` bigint(20) unsigned NOT NULL,
  `target_id` bigint(20) unsigned DEFAULT '0',
  `context_type` varchar(255) DEFAULT '',
  `context_id` bigint(20) unsigned DEFAULT '0',
  `verb` text,
  `source_id` bigint(20) unsigned DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` text,
  PRIMARY KEY (`id`),
  KEY `easyblog_stream_actor` (`actor_id`),
  KEY `easyblog_stream_actor_timeline` (`actor_id`,`created`),
  KEY `easyblog_stream_target_timeline` (`target_id`,`created`)
) ENGINE=InnoDB AUTO_INCREMENT=1261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_tag`
--

DROP TABLE IF EXISTS `wlje4_easyblog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `easyblog_tag_title` (`title`),
  KEY `easyblog_tag_published` (`published`),
  KEY `easyblog_tag_alias` (`alias`),
  KEY `easyblog_tag_query1` (`published`,`id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_team`
--

DROP TABLE IF EXISTS `wlje4_easyblog_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `access` tinyint(1) DEFAULT '1',
  `published` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_team_groups`
--

DROP TABLE IF EXISTS `wlje4_easyblog_team_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_team_groups` (
  `team_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `team_id` (`team_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_team_post`
--

DROP TABLE IF EXISTS `wlje4_easyblog_team_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_team_post` (
  `team_id` int(11) NOT NULL,
  `post_id` bigint(11) NOT NULL,
  KEY `easyblog_teampost_tid` (`team_id`),
  KEY `easyblog_teampost_pid` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_team_request`
--

DROP TABLE IF EXISTS `wlje4_easyblog_team_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_team_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ispending` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `easyblog_team_request_teamid` (`team_id`),
  KEY `easyblog_team_request_userid` (`user_id`),
  KEY `easyblog_team_request_pending` (`ispending`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_team_subscription`
--

DROP TABLE IF EXISTS `wlje4_easyblog_team_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_team_subscription` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT '0',
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_team_subscription_team_id` (`team_id`),
  KEY `easyblog_team_subscription_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_team_users`
--

DROP TABLE IF EXISTS `wlje4_easyblog_team_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_team_users` (
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isadmin` tinyint(1) DEFAULT '0',
  KEY `easyblog_team_id` (`team_id`),
  KEY `easyblog_team_userid` (`user_id`),
  KEY `easyblog_team_isadmin` (`team_id`,`user_id`,`isadmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_trackback`
--

DROP TABLE IF EXISTS `wlje4_easyblog_trackback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_trackback` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(25) NOT NULL DEFAULT '',
  `title` text NOT NULL,
  `excerpt` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `blog_name` text NOT NULL,
  `charset` varchar(45) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `option` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `easyblog_tb_post_id` (`post_id`),
  KEY `easyblog_tb_url` (`url`),
  KEY `easyblog_tb_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_trackback_sent`
--

DROP TABLE IF EXISTS `wlje4_easyblog_trackback_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_trackback_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `sent` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `easyblog_tb_sent_post_id` (`post_id`),
  KEY `easyblog_tb_sent_url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_twitter_microblog`
--

DROP TABLE IF EXISTS `wlje4_easyblog_twitter_microblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_twitter_microblog` (
  `id_str` text NOT NULL,
  `oauth_id` int(11) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `tweet_author` text NOT NULL,
  KEY `post_id` (`post_id`),
  FULLTEXT KEY `id_str` (`id_str`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_users`
--

DROP TABLE IF EXISTS `wlje4_easyblog_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_users` (
  `id` bigint(20) unsigned NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` text,
  `url` varchar(255) DEFAULT NULL,
  `params` text,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `biography` text,
  `permalink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `easyblog_users_permalink` (`permalink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyblog_xml_wpdata`
--

DROP TABLE IF EXISTS `wlje4_easyblog_xml_wpdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyblog_xml_wpdata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `source` varchar(15) NOT NULL,
  `data` longtext NOT NULL,
  `comments` longtext,
  PRIMARY KEY (`id`),
  KEY `xml_wpdate_session` (`session_id`),
  KEY `xml_wpdate_post_source` (`post_id`,`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_easyjoomlabackup`
--

DROP TABLE IF EXISTS `wlje4_easyjoomlabackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_easyjoomlabackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `comment` tinytext NOT NULL,
  `type` varchar(32) NOT NULL,
  `size` varchar(12) NOT NULL,
  `duration` varchar(8) NOT NULL,
  `name` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_example_items`
--

DROP TABLE IF EXISTS `wlje4_example_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_example_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_extensions`
--

DROP TABLE IF EXISTS `wlje4_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  `extra_params` varchar(5120) NOT NULL DEFAULT '',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10750 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_compmenus`
--

DROP TABLE IF EXISTS `wlje4_facileforms_compmenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_compmenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package` varchar(30) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` int(11) NOT NULL DEFAULT '1',
  `frame` tinyint(1) NOT NULL DEFAULT '0',
  `border` tinyint(1) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_config`
--

DROP TABLE IF EXISTS `wlje4_facileforms_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_config` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_elements`
--

DROP TABLE IF EXISTS `wlje4_facileforms_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form` int(11) NOT NULL DEFAULT '0',
  `page` int(11) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `class1` varchar(30) DEFAULT NULL,
  `class2` varchar(30) DEFAULT NULL,
  `logging` tinyint(1) NOT NULL DEFAULT '1',
  `posx` int(11) DEFAULT NULL,
  `posxmode` tinyint(1) NOT NULL DEFAULT '0',
  `posy` int(11) DEFAULT NULL,
  `posymode` tinyint(1) NOT NULL DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  `widthmode` tinyint(1) NOT NULL DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `heightmode` tinyint(1) NOT NULL DEFAULT '0',
  `flag1` tinyint(1) NOT NULL DEFAULT '0',
  `flag2` tinyint(1) NOT NULL DEFAULT '0',
  `data1` text,
  `data2` text,
  `data3` text,
  `script1cond` tinyint(1) NOT NULL DEFAULT '0',
  `script1id` int(11) DEFAULT NULL,
  `script1code` text,
  `script1flag1` tinyint(1) NOT NULL DEFAULT '0',
  `script1flag2` tinyint(1) NOT NULL DEFAULT '0',
  `script2cond` tinyint(1) NOT NULL DEFAULT '0',
  `script2id` int(11) DEFAULT NULL,
  `script2code` text,
  `script2flag1` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag2` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag3` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag4` tinyint(1) NOT NULL DEFAULT '0',
  `script2flag5` tinyint(1) NOT NULL DEFAULT '0',
  `script3cond` tinyint(1) NOT NULL DEFAULT '0',
  `script3id` int(11) DEFAULT NULL,
  `script3code` text,
  `script3msg` text,
  `mailback` tinyint(1) NOT NULL DEFAULT '0',
  `mailbackfile` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54345 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_forms`
--

DROP TABLE IF EXISTS `wlje4_facileforms_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alt_mailfrom` text,
  `alt_fromname` text,
  `mb_alt_mailfrom` text,
  `mb_alt_fromname` text,
  `mailchimp_email_field` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_checkbox_field` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_api_key` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_list_id` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_double_optin` tinyint(1) NOT NULL DEFAULT '1',
  `mailchimp_mergevars` text,
  `mailchimp_text_html_mobile_field` varchar(255) NOT NULL DEFAULT '',
  `mailchimp_send_errors` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_update_existing` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_replace_interests` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_send_welcome` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_default_type` varchar(255) NOT NULL DEFAULT 'text',
  `mailchimp_delete_member` tinyint(1) NOT NULL DEFAULT '0',
  `mailchimp_send_goodbye` tinyint(1) NOT NULL DEFAULT '1',
  `mailchimp_send_notify` tinyint(1) NOT NULL DEFAULT '1',
  `mailchimp_unsubscribe_field` varchar(255) NOT NULL DEFAULT '',
  `salesforce_token` varchar(255) NOT NULL DEFAULT '',
  `salesforce_username` varchar(255) NOT NULL DEFAULT '',
  `salesforce_password` varchar(255) NOT NULL DEFAULT '',
  `salesforce_type` varchar(255) NOT NULL DEFAULT '',
  `salesforce_fields` text,
  `salesforce_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dropbox_email` varchar(255) NOT NULL DEFAULT '',
  `dropbox_password` varchar(255) NOT NULL DEFAULT '',
  `dropbox_folder` text,
  `dropbox_submission_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dropbox_submission_types` varchar(255) NOT NULL DEFAULT 'pdf',
  `tags_content` text NOT NULL,
  `tags_content_template` mediumtext NOT NULL,
  `tags_content_template_default_element` int(11) NOT NULL DEFAULT '0',
  `tags_content_default_category` int(11) NOT NULL DEFAULT '0',
  `tags_content_default_state` int(11) NOT NULL DEFAULT '1',
  `tags_content_default_access` int(11) NOT NULL DEFAULT '1',
  `tags_content_default_language` varchar(7) NOT NULL DEFAULT '*',
  `tags_content_default_featured` int(11) NOT NULL DEFAULT '0',
  `tags_content_default_publishup` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags_content_default_publishdown` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags_form` text NOT NULL,
  `autoheight` tinyint(1) NOT NULL DEFAULT '0',
  `package` varchar(30) NOT NULL DEFAULT '',
  `template_code` longtext NOT NULL,
  `template_code_processed` longtext NOT NULL,
  `template_areas` longtext NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `runmode` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `custom_mail_subject` varchar(255) NOT NULL DEFAULT '',
  `mb_custom_mail_subject` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `class1` varchar(30) DEFAULT NULL,
  `class2` varchar(30) DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `widthmode` tinyint(1) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `heightmode` tinyint(1) NOT NULL DEFAULT '0',
  `pages` int(11) NOT NULL DEFAULT '1',
  `emailntf` tinyint(1) NOT NULL DEFAULT '1',
  `mb_emailntf` tinyint(1) NOT NULL DEFAULT '1',
  `emaillog` tinyint(1) NOT NULL DEFAULT '1',
  `mb_emaillog` tinyint(1) NOT NULL DEFAULT '1',
  `emailxml` tinyint(1) NOT NULL DEFAULT '0',
  `mb_emailxml` tinyint(1) NOT NULL DEFAULT '0',
  `email_type` tinyint(1) NOT NULL DEFAULT '0',
  `mb_email_type` tinyint(1) NOT NULL DEFAULT '0',
  `email_custom_template` text,
  `mb_email_custom_template` text,
  `email_custom_html` tinyint(1) NOT NULL DEFAULT '0',
  `mb_email_custom_html` tinyint(1) NOT NULL DEFAULT '0',
  `emailadr` text,
  `dblog` tinyint(1) NOT NULL DEFAULT '1',
  `script1cond` tinyint(1) NOT NULL DEFAULT '0',
  `script1id` int(11) DEFAULT NULL,
  `script1code` text,
  `script2cond` tinyint(1) NOT NULL DEFAULT '0',
  `script2id` int(11) DEFAULT NULL,
  `script2code` text,
  `piece1cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece1id` int(11) DEFAULT NULL,
  `piece1code` text,
  `piece2cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece2id` int(11) DEFAULT NULL,
  `piece2code` text,
  `piece3cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece3id` int(11) DEFAULT NULL,
  `piece3code` text,
  `piece4cond` tinyint(1) NOT NULL DEFAULT '0',
  `piece4id` int(11) DEFAULT NULL,
  `piece4code` text,
  `prevmode` tinyint(1) NOT NULL DEFAULT '2',
  `prevwidth` int(11) DEFAULT NULL,
  `filter_state` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=739 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_integrator_criteria_fixed`
--

DROP TABLE IF EXISTS `wlje4_facileforms_integrator_criteria_fixed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_integrator_criteria_fixed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `fixed_value` text NOT NULL,
  `andor` varchar(3) NOT NULL DEFAULT 'AND',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_integrator_criteria_form`
--

DROP TABLE IF EXISTS `wlje4_facileforms_integrator_criteria_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_integrator_criteria_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `element_id` varchar(255) NOT NULL,
  `andor` varchar(3) NOT NULL DEFAULT 'AND',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_integrator_criteria_joomla`
--

DROP TABLE IF EXISTS `wlje4_facileforms_integrator_criteria_joomla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_integrator_criteria_joomla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `joomla_object` varchar(255) NOT NULL,
  `andor` varchar(3) NOT NULL DEFAULT 'AND',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_integrator_items`
--

DROP TABLE IF EXISTS `wlje4_facileforms_integrator_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_integrator_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `reference_column` varchar(255) NOT NULL,
  `code` text CHARACTER SET latin1,
  `published` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7295 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_integrator_rules`
--

DROP TABLE IF EXISTS `wlje4_facileforms_integrator_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_integrator_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `form_id` int(11) NOT NULL,
  `reference_table` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'insert',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `finalize_code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_new_archive_record`
--

DROP TABLE IF EXISTS `wlje4_facileforms_new_archive_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_new_archive_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_new_archive_subrecords`
--

DROP TABLE IF EXISTS `wlje4_facileforms_new_archive_subrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_new_archive_subrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `field_name` varchar(45) DEFAULT NULL,
  `field_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_packages`
--

DROP TABLE IF EXISTS `wlje4_facileforms_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_packages` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(30) NOT NULL DEFAULT '',
  `created` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `author` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_pieces`
--

DROP TABLE IF EXISTS `wlje4_facileforms_pieces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_pieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `package` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(30) NOT NULL DEFAULT '',
  `code` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_records`
--

DROP TABLE IF EXISTS `wlje4_facileforms_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `form` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(30) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL DEFAULT '',
  `opsys` varchar(255) NOT NULL DEFAULT '',
  `provider` varchar(255) NOT NULL DEFAULT '',
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `exported` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `user_full_name` varchar(255) NOT NULL DEFAULT '',
  `paypal_tx_id` varchar(255) NOT NULL DEFAULT '',
  `paypal_payment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paypal_testaccount` tinyint(1) NOT NULL DEFAULT '0',
  `paypal_download_tries` int(11) NOT NULL DEFAULT '0',
  `userid_formid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486827 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_scripts`
--

DROP TABLE IF EXISTS `wlje4_facileforms_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_scripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `package` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(30) NOT NULL DEFAULT '',
  `code` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_facileforms_subrecords`
--

DROP TABLE IF EXISTS `wlje4_facileforms_subrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_facileforms_subrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record` int(11) NOT NULL DEFAULT '0',
  `element` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `form_id` int(11) DEFAULT NULL,
  `new_element_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16193652 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_filters`
--

DROP TABLE IF EXISTS `wlje4_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links`
--

DROP TABLE IF EXISTS `wlje4_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB AUTO_INCREMENT=15635 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms0`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms1`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms2`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms3`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms4`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms5`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms6`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms7`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms8`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_terms9`
--

DROP TABLE IF EXISTS `wlje4_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_termsa`
--

DROP TABLE IF EXISTS `wlje4_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_termsb`
--

DROP TABLE IF EXISTS `wlje4_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_termsc`
--

DROP TABLE IF EXISTS `wlje4_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_termsd`
--

DROP TABLE IF EXISTS `wlje4_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_termse`
--

DROP TABLE IF EXISTS `wlje4_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_links_termsf`
--

DROP TABLE IF EXISTS `wlje4_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_taxonomy`
--

DROP TABLE IF EXISTS `wlje4_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=1184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `wlje4_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_terms`
--

DROP TABLE IF EXISTS `wlje4_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB AUTO_INCREMENT=3638259 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_terms_common`
--

DROP TABLE IF EXISTS `wlje4_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_tokens`
--

DROP TABLE IF EXISTS `wlje4_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `wlje4_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_finder_types`
--

DROP TABLE IF EXISTS `wlje4_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_html2articles_links`
--

DROP TABLE IF EXISTS `wlje4_html2articles_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_html2articles_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catid` int(11) NOT NULL,
  `articleid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_html2articles_log`
--

DROP TABLE IF EXISTS `wlje4_html2articles_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_html2articles_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `error` tinyint(4) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=1431 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_jak2filter`
--

DROP TABLE IF EXISTS `wlje4_jak2filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_jak2filter` (
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_je_jek2submit`
--

DROP TABLE IF EXISTS `wlje4_je_jek2submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_je_jek2submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `notify_email` varchar(250) NOT NULL,
  `message` longtext NOT NULL,
  `notify` tinyint(4) NOT NULL,
  `notify_message` longtext NOT NULL,
  `captcha` tinyint(4) NOT NULL,
  `itemid` tinyint(4) NOT NULL,
  `term` tinyint(4) NOT NULL,
  `category` tinyint(4) NOT NULL,
  `cat_id` varchar(200) NOT NULL,
  `allow_reguser` tinyint(4) NOT NULL,
  `auto_publish` tinyint(4) NOT NULL,
  `pageurl` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `publish` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_je_k2itemlist`
--

DROP TABLE IF EXISTS `wlje4_je_k2itemlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_je_k2itemlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `published` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10946 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_jfbconnect_channel`
--

DROP TABLE IF EXISTS `wlje4_jfbconnect_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_jfbconnect_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(20) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `title` varchar(40) NOT NULL DEFAULT '',
  `description` text,
  `attribs` text,
  `published` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_jfbconnect_config`
--

DROP TABLE IF EXISTS `wlje4_jfbconnect_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_jfbconnect_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting` varchar(50) NOT NULL,
  `value` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting` (`setting`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_jfbconnect_notification`
--

DROP TABLE IF EXISTS `wlje4_jfbconnect_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_jfbconnect_notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fb_request_id` bigint(20) NOT NULL,
  `fb_user_to` bigint(20) NOT NULL,
  `fb_user_from` bigint(20) NOT NULL,
  `jfbc_request_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_jfbconnect_request`
--

DROP TABLE IF EXISTS `wlje4_jfbconnect_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_jfbconnect_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `published` tinyint(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` varchar(250) NOT NULL,
  `destination_url` varchar(200) NOT NULL,
  `thanks_url` varchar(200) NOT NULL,
  `breakout_canvas` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_jfbconnect_user_map`
--

DROP TABLE IF EXISTS `wlje4_jfbconnect_user_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_jfbconnect_user_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `j_user_id` int(11) NOT NULL,
  `provider_user_id` varchar(40) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_token` text,
  `authorized` tinyint(1) DEFAULT '1',
  `params` text,
  `provider` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_js_classified_config`
--

DROP TABLE IF EXISTS `wlje4_js_classified_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_js_classified_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories` varchar(10) DEFAULT '0',
  `locations` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories` (`categories`),
  UNIQUE KEY `locations` (`locations`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='JomSocial Classified...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_js_classified_locations`
--

DROP TABLE IF EXISTS `wlje4_js_classified_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_js_classified_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(23) DEFAULT '0',
  `city` varchar(23) DEFAULT '0',
  `first_address_line` varchar(50) DEFAULT '',
  `second_address_line` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='JomSocial Classified...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_attachments`
--

DROP TABLE IF EXISTS `wlje4_k2_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `titleAttribute` text CHARACTER SET latin1,
  `thumbnail` varchar(255) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `catid` varchar(55) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `uploadtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=76827 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_categories`
--

DROP TABLE IF EXISTS `wlje4_k2_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `parent` int(11) DEFAULT '0',
  `extraFieldsGroup` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `params` text NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`published`,`access`,`trash`),
  KEY `parent` (`parent`),
  KEY `ordering` (`ordering`),
  KEY `published` (`published`),
  KEY `access` (`access`),
  KEY `trash` (`trash`),
  KEY `language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=725 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_comments`
--

DROP TABLE IF EXISTS `wlje4_k2_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `commentDate` datetime NOT NULL,
  `commentText` text NOT NULL,
  `commentEmail` varchar(255) NOT NULL,
  `commentURL` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`),
  KEY `userID` (`userID`),
  KEY `published` (`published`),
  KEY `latestComments` (`published`,`commentDate`)
) ENGINE=InnoDB AUTO_INCREMENT=1331 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_extra_fields`
--

DROP TABLE IF EXISTS `wlje4_k2_extra_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `group` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `published` (`published`),
  KEY `ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=32121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_extra_fields_groups`
--

DROP TABLE IF EXISTS `wlje4_k2_extra_fields_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_extra_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_extra_fields_index`
--

DROP TABLE IF EXISTS `wlje4_k2_extra_fields_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_extra_fields_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k2_item_id` int(11) DEFAULT '0',
  `item_title` varchar(255) DEFAULT '0',
  `extrafield_id` int(11) DEFAULT '0',
  `extrafield_name` varchar(255) DEFAULT '0',
  `extrafield_value` varchar(255) DEFAULT '0',
  `extrafield_keyword` longtext,
  `extrafield_gradelevel` varchar(255) DEFAULT '0',
  `extrafield_region` varchar(255) DEFAULT '0',
  `extrafield_subject` varchar(255) DEFAULT '0',
  `extrafield_author` varchar(255) DEFAULT '0',
  `extrafield_language` varchar(255) DEFAULT '0',
  `extrafield_resourcetype` varchar(255) DEFAULT '0',
  `extrafield_globaltopic` varchar(255) DEFAULT '0',
  `extrafield_length` varchar(255) DEFAULT '0',
  `extrafield_materials` longtext,
  `extrafield_ask` longtext,
  `extrafield_activate` longtext,
  `extrafield_investigate` longtext,
  `extrafield_synthesize` longtext,
  `extrafield_share` longtext,
  `extrafield_reflect` longtext,
  `extrafield_assess` longtext,
  `extrafield_extend` longtext,
  `extrafield_web_print` longblob,
  `extrafield_standards` longtext,
  `extrafield_reflection` longtext,
  `extrafield_attachments` longtext,
  `extrafield_school` varchar(255) DEFAULT '0',
  `extrafield_district` varchar(255) DEFAULT '0',
  `extrafield_connection` varchar(255) DEFAULT '0',
  `extrafield_moduleid` varchar(255) DEFAULT '0',
  `extrafield_revision_status` varchar(255) DEFAULT '0',
  `extrafield_unit` varchar(255) DEFAULT '0',
  `extrafield_unit_lesson_plans` varchar(255) DEFAULT '0',
  `extrafield_activities` varchar(255) DEFAULT '0',
  `extrafield_capstone` varchar(255) DEFAULT '0',
  `extrafield_competence` varchar(255) DEFAULT '0',
  `extrafield_tags` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wlje4_k2_extra_fields_index_k2_item_id` (`k2_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76388 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_extra_fields_mapping`
--

DROP TABLE IF EXISTS `wlje4_k2_extra_fields_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_extra_fields_mapping` (
  `map_id` int(11) NOT NULL AUTO_INCREMENT,
  `extra_field_id` int(11) DEFAULT NULL,
  `extra_field_name` text,
  `group_type` text,
  `extra_field_option1` text,
  `extra_field_option2` text,
  `extra_field_option3` text,
  `extra_field_option4` text,
  `extra_field_option5` text,
  `extra_field_option6` text,
  `extra_field_option7` text,
  `extra_field_option8` text,
  `extra_field_option9` text,
  `extra_field_option10` text,
  `extra_field_option11` text,
  `extra_field_option12` text,
  `extra_field_option13` text,
  `extra_field_option14` text,
  `extra_field_option15` text,
  `extra_field_option16` text,
  `extra_field_option17` text,
  `extra_field_option18` text,
  `extra_field_option19` text,
  `extra_field_option20` text,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_itemid_associations`
--

DROP TABLE IF EXISTS `wlje4_k2_itemid_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_itemid_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k2itemid` int(11) DEFAULT NULL,
  `badgeid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `status` char(20) DEFAULT NULL,
  `formurl` text,
  `date_created` datetime DEFAULT NULL,
  `date_edited` datetime DEFAULT NULL,
  `date_attached` datetime DEFAULT NULL,
  `date_revised` datetime DEFAULT NULL,
  `user_school` varchar(255) DEFAULT NULL,
  `user_district` varchar(255) DEFAULT NULL,
  `badge_assertion_id` int(11) DEFAULT NULL,
  `sf_ext_id` varchar(45) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `concat_badgeid_userid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `one_peruser_percatid` (`userid`,`catid`),
  KEY `badge_assertion_id_index` (`badge_assertion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41081 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_items`
--

DROP TABLE IF EXISTS `wlje4_k2_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(87) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `moduletype` varchar(50) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `introtext` text,
  `fulltext` longtext,
  `video` varchar(50) DEFAULT NULL,
  `gallery` varchar(50) DEFAULT NULL,
  `extra_fields` longtext,
  `extra_fields_search` longtext,
  `created` datetime DEFAULT NULL,
  `created_by_alias` varchar(50) DEFAULT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(50) DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT '2080-01-01 01:00:00',
  `trash` int(11) DEFAULT '0',
  `access` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `featured` varchar(50) DEFAULT NULL,
  `featured_ordering` varchar(50) DEFAULT NULL,
  `image_caption` varchar(50) DEFAULT NULL,
  `image_credits` varchar(50) DEFAULT NULL,
  `video_caption` varchar(50) DEFAULT NULL,
  `video_credits` varchar(50) DEFAULT NULL,
  `hits` int(11) DEFAULT '1',
  `params` varchar(255) DEFAULT NULL,
  `metadesc` varchar(238) DEFAULT NULL,
  `metadata` varchar(50) DEFAULT NULL,
  `metakey` varchar(50) DEFAULT NULL,
  `plugins` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `badge` int(11) DEFAULT NULL,
  `userid_catid` varchar(45) DEFAULT NULL,
  `rating_sum` int(11) DEFAULT '0',
  `rating_count` int(11) DEFAULT '0',
  `vif_other` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `onecatidperperson` (`created_by`,`catid`,`alias`),
  KEY `item` (`published`,`publish_up`,`publish_down`,`trash`,`access`),
  KEY `catid` (`catid`),
  KEY `created_by` (`created_by`),
  KEY `ordering` (`ordering`),
  KEY `featured` (`featured`),
  KEY `featured_ordering` (`featured_ordering`),
  KEY `hits` (`hits`),
  KEY `created` (`created`),
  KEY `language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=40569 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_matching_custom_table`
--

DROP TABLE IF EXISTS `wlje4_k2_matching_custom_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_matching_custom_table` (
  `module_id` int(11) DEFAULT NULL,
  `subid` varchar(50) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  `badgeid` int(11) DEFAULT NULL,
  `yearbadgeid` int(11) DEFAULT NULL,
  `pd_module` varchar(255) DEFAULT NULL,
  `ref_catid` int(11) DEFAULT NULL,
  `lp_formid` int(11) DEFAULT NULL,
  `attach_formid` int(11) DEFAULT NULL,
  `reflection_formid` int(11) DEFAULT NULL,
  `module_key` varchar(50) DEFAULT NULL,
  `lp_form_menu` varchar(64) DEFAULT NULL,
  `lp_reflection_menu` varchar(51) DEFAULT NULL,
  `lp_attachments_menu` varchar(57) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `badgeurl` varchar(255) DEFAULT NULL,
  `badgetype` varchar(50) DEFAULT NULL,
  `additional_criteria_catid` int(11) DEFAULT NULL,
  `conf_page` varchar(255) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `badge_image` varchar(255) DEFAULT NULL,
  `form_type` varchar(45) DEFAULT NULL,
  `create_conf_page` varchar(255) DEFAULT NULL,
  `share_conf_page` varchar(255) DEFAULT NULL,
  `revise_conf_page` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_rating`
--

DROP TABLE IF EXISTS `wlje4_k2_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_rating` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_search_tally`
--

DROP TABLE IF EXISTS `wlje4_k2_search_tally`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_search_tally` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `k2_item_id` int(11) NOT NULL,
  `add_status` text,
  `datetime_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  UNIQUE KEY `unique_k2_id` (`k2_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28657 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_tags`
--

DROP TABLE IF EXISTS `wlje4_k2_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=15395 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_tags_xref`
--

DROP TABLE IF EXISTS `wlje4_k2_tags_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_tags_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `single_instance_keyword_per_k2item` (`tagID`,`itemID`),
  KEY `tagID` (`tagID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=578855 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_user_groups`
--

DROP TABLE IF EXISTS `wlje4_k2_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_k2_users`
--

DROP TABLE IF EXISTS `wlje4_k2_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_k2_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL DEFAULT 'm',
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=27378 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_acl`
--

DROP TABLE IF EXISTS `wlje4_komento_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_acl` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` varchar(255) NOT NULL,
  `component` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rules` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `komento_acl_content_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_actions`
--

DROP TABLE IF EXISTS `wlje4_komento_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_actions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL,
  `action_by` bigint(20) unsigned NOT NULL DEFAULT '0',
  `actioned` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `komento_actions` (`type`,`comment_id`,`action_by`),
  KEY `komento_actions_comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_activities`
--

DROP TABLE IF EXISTS `wlje4_komento_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_activities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `comment_id` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_captcha`
--

DROP TABLE IF EXISTS `wlje4_komento_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_captcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `response` varchar(5) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_comments`
--

DROP TABLE IF EXISTS `wlje4_komento_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `cid` bigint(20) unsigned NOT NULL,
  `comment` text,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `ip` varchar(255) DEFAULT '',
  `created_by` bigint(20) unsigned DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) unsigned DEFAULT '0',
  `modified` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_by` bigint(20) unsigned DEFAULT '0',
  `deleted` datetime DEFAULT '0000-00-00 00:00:00',
  `flag` tinyint(1) DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  `sticked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sent` tinyint(1) DEFAULT '0',
  `parent_id` int(11) unsigned DEFAULT '0',
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `depth` int(11) unsigned NOT NULL DEFAULT '0',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `address` text,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `komento_threaded` (`component`,`cid`,`published`,`lft`,`rgt`),
  KEY `komento_threaded_reverse` (`component`,`cid`,`published`,`rgt`),
  KEY `komento_module_comments` (`component`,`cid`,`published`,`created`),
  KEY `komento_backend` (`parent_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_configs`
--

DROP TABLE IF EXISTS `wlje4_komento_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_configs` (
  `component` varchar(255) NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_hashkeys`
--

DROP TABLE IF EXISTS `wlje4_komento_hashkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_hashkeys` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `key` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_ipfilter`
--

DROP TABLE IF EXISTS `wlje4_komento_ipfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_ipfilter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `rules` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `komento_ipfilter` (`component`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_mailq`
--

DROP TABLE IF EXISTS `wlje4_komento_mailq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_mailq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailfrom` varchar(255) DEFAULT NULL,
  `fromname` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'text',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `komento_mailq_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_subscription`
--

DROP TABLE IF EXISTS `wlje4_komento_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_subscription` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `component` varchar(255) NOT NULL,
  `cid` bigint(20) unsigned NOT NULL,
  `userid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `komento_subscription` (`type`,`component`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_komento_uploads`
--

DROP TABLE IF EXISTS `wlje4_komento_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_komento_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `filename` text NOT NULL,
  `hashname` text NOT NULL,
  `path` text,
  `created` datetime NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT '0',
  `published` tinyint(1) NOT NULL,
  `mime` text NOT NULL,
  `size` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_aliases`
--

DROP TABLE IF EXISTS `wlje4_kunena_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_aliases` (
  `alias` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `item` varchar(32) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `alias` (`alias`),
  KEY `state` (`state`),
  KEY `item` (`item`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_announcement`
--

DROP TABLE IF EXISTS `wlje4_kunena_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_announcement` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `sdescription` text NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` tinyint(4) NOT NULL DEFAULT '0',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_attachments`
--

DROP TABLE IF EXISTS `wlje4_kunena_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mesid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `hash` char(32) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `folder` varchar(255) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mesid` (`mesid`),
  KEY `userid` (`userid`),
  KEY `hash` (`hash`),
  KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_categories`
--

DROP TABLE IF EXISTS `wlje4_kunena_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `name` tinytext,
  `alias` varchar(255) NOT NULL,
  `icon_id` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `accesstype` varchar(20) NOT NULL DEFAULT 'joomla.level',
  `access` int(11) NOT NULL DEFAULT '0',
  `pub_access` int(11) NOT NULL DEFAULT '1',
  `pub_recurse` tinyint(4) DEFAULT '1',
  `admin_access` int(11) NOT NULL DEFAULT '0',
  `admin_recurse` tinyint(4) DEFAULT '1',
  `ordering` smallint(6) NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `channels` text,
  `checked_out` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review` tinyint(4) NOT NULL DEFAULT '0',
  `allow_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `post_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `headerdesc` text NOT NULL,
  `class_sfx` varchar(20) NOT NULL,
  `allow_polls` tinyint(4) NOT NULL DEFAULT '0',
  `topic_ordering` varchar(16) NOT NULL DEFAULT 'lastpost',
  `numTopics` mediumint(8) NOT NULL DEFAULT '0',
  `numPosts` mediumint(8) NOT NULL DEFAULT '0',
  `last_topic_id` int(11) NOT NULL DEFAULT '0',
  `last_post_id` int(11) NOT NULL DEFAULT '0',
  `last_post_time` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `category_access` (`accesstype`,`access`),
  KEY `published_pubaccess_id` (`published`,`pub_access`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_configuration`
--

DROP TABLE IF EXISTS `wlje4_kunena_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_configuration` (
  `id` int(11) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_keywords`
--

DROP TABLE IF EXISTS `wlje4_kunena_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `public_count` int(11) NOT NULL,
  `total_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `public_count` (`public_count`),
  KEY `total_count` (`total_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_keywords_map`
--

DROP TABLE IF EXISTS `wlje4_kunena_keywords_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_keywords_map` (
  `keyword_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  UNIQUE KEY `keyword_user_topic` (`keyword_id`,`user_id`,`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_user` (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_messages`
--

DROP TABLE IF EXISTS `wlje4_kunena_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT '0',
  `thread` int(11) DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `name` tinytext,
  `userid` int(11) NOT NULL DEFAULT '0',
  `email` tinytext,
  `subject` tinytext,
  `time` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(128) DEFAULT NULL,
  `topic_emoticon` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `hold` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `moved` tinyint(4) DEFAULT '0',
  `modified_by` int(7) DEFAULT NULL,
  `modified_time` int(11) DEFAULT NULL,
  `modified_reason` tinytext,
  PRIMARY KEY (`id`),
  KEY `thread` (`thread`),
  KEY `ip` (`ip`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `locked` (`locked`),
  KEY `hold_time` (`hold`,`time`),
  KEY `parent_hits` (`parent`,`hits`),
  KEY `catid_parent` (`catid`,`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_messages_text`
--

DROP TABLE IF EXISTS `wlje4_kunena_messages_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_messages_text` (
  `mesid` int(11) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  PRIMARY KEY (`mesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_polls`
--

DROP TABLE IF EXISTS `wlje4_kunena_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `threadid` int(11) NOT NULL,
  `polltimetolive` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `threadid` (`threadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_polls_options`
--

DROP TABLE IF EXISTS `wlje4_kunena_polls_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_polls_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_polls_users`
--

DROP TABLE IF EXISTS `wlje4_kunena_polls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_polls_users` (
  `pollid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `lasttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvote` int(11) DEFAULT NULL,
  UNIQUE KEY `pollid` (`pollid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_ranks`
--

DROP TABLE IF EXISTS `wlje4_kunena_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(255) NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_sessions`
--

DROP TABLE IF EXISTS `wlje4_kunena_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_sessions` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `allowed` text,
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `readtopics` text,
  `currvisit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `currvisit` (`currvisit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_smileys`
--

DROP TABLE IF EXISTS `wlje4_kunena_smileys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_smileys` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL DEFAULT '',
  `location` varchar(50) NOT NULL DEFAULT '',
  `greylocation` varchar(60) NOT NULL DEFAULT '',
  `emoticonbar` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_thankyou`
--

DROP TABLE IF EXISTS `wlje4_kunena_thankyou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_thankyou` (
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `targetuserid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  UNIQUE KEY `postid` (`postid`,`userid`),
  KEY `userid` (`userid`),
  KEY `targetuserid` (`targetuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_topics`
--

DROP TABLE IF EXISTS `wlje4_kunena_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `subject` tinytext,
  `icon_id` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `hold` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `attachments` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `moved_id` int(11) NOT NULL DEFAULT '0',
  `first_post_id` int(11) NOT NULL DEFAULT '0',
  `first_post_time` int(11) NOT NULL DEFAULT '0',
  `first_post_userid` int(11) NOT NULL DEFAULT '0',
  `first_post_message` text,
  `first_post_guest_name` tinytext,
  `last_post_id` int(11) NOT NULL DEFAULT '0',
  `last_post_time` int(11) NOT NULL DEFAULT '0',
  `last_post_userid` int(11) NOT NULL DEFAULT '0',
  `last_post_message` text,
  `last_post_guest_name` tinytext,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `locked` (`locked`),
  KEY `hold` (`hold`),
  KEY `posts` (`posts`),
  KEY `hits` (`hits`),
  KEY `first_post_userid` (`first_post_userid`),
  KEY `last_post_userid` (`last_post_userid`),
  KEY `first_post_time` (`first_post_time`),
  KEY `last_post_time` (`last_post_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_user_categories`
--

DROP TABLE IF EXISTS `wlje4_kunena_user_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_user_categories` (
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `allreadtime` datetime DEFAULT NULL,
  `subscribed` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`user_id`,`category_id`),
  KEY `category_subscribed` (`category_id`,`subscribed`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_user_read`
--

DROP TABLE IF EXISTS `wlje4_kunena_user_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_user_read` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  UNIQUE KEY `user_topic_id` (`user_id`,`topic_id`),
  KEY `category_user_id` (`category_id`,`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_user_topics`
--

DROP TABLE IF EXISTS `wlje4_kunena_user_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_user_topics` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_post_id` int(11) NOT NULL DEFAULT '0',
  `owner` tinyint(4) NOT NULL DEFAULT '0',
  `favorite` tinyint(4) NOT NULL DEFAULT '0',
  `subscribed` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  UNIQUE KEY `user_topic_id` (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`),
  KEY `posts` (`posts`),
  KEY `owner` (`owner`),
  KEY `favorite` (`favorite`),
  KEY `subscribed` (`subscribed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_users`
--

DROP TABLE IF EXISTS `wlje4_kunena_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_users` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `view` varchar(8) NOT NULL DEFAULT '',
  `signature` text,
  `moderator` int(11) DEFAULT '0',
  `banned` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `posts` int(11) DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `karma` int(11) DEFAULT '0',
  `karma_time` int(11) DEFAULT '0',
  `group_id` int(4) DEFAULT '1',
  `uhits` int(11) DEFAULT '0',
  `personalText` tinytext,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `birthdate` date NOT NULL DEFAULT '0001-01-01',
  `location` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `aim` varchar(50) DEFAULT NULL,
  `yim` varchar(50) DEFAULT NULL,
  `msn` varchar(50) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `gtalk` varchar(50) DEFAULT NULL,
  `myspace` varchar(50) DEFAULT NULL,
  `linkedin` varchar(50) DEFAULT NULL,
  `delicious` varchar(50) DEFAULT NULL,
  `friendfeed` varchar(50) DEFAULT NULL,
  `digg` varchar(50) DEFAULT NULL,
  `blogspot` varchar(50) DEFAULT NULL,
  `flickr` varchar(50) DEFAULT NULL,
  `bebo` varchar(50) DEFAULT NULL,
  `websitename` varchar(50) DEFAULT NULL,
  `websiteurl` varchar(50) DEFAULT NULL,
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `hideEmail` tinyint(1) NOT NULL DEFAULT '1',
  `showOnline` tinyint(1) NOT NULL DEFAULT '1',
  `thankyou` int(11) DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `group_id` (`group_id`),
  KEY `posts` (`posts`),
  KEY `uhits` (`uhits`),
  KEY `banned` (`banned`),
  KEY `moderator` (`moderator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_users_banned`
--

DROP TABLE IF EXISTS `wlje4_kunena_users_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_users_banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `blocked` tinyint(4) NOT NULL DEFAULT '0',
  `expiration` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `reason_private` text,
  `reason_public` text,
  `modified_by` int(11) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `comments` text,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`),
  KEY `expiration` (`expiration`),
  KEY `created_time` (`created_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_kunena_version`
--

DROP TABLE IF EXISTS `wlje4_kunena_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_kunena_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(20) NOT NULL,
  `versiondate` date NOT NULL,
  `installdate` date NOT NULL,
  `build` varchar(20) NOT NULL,
  `versionname` varchar(40) DEFAULT NULL,
  `state` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_languages`
--

DROP TABLE IF EXISTS `wlje4_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_addons`
--

DROP TABLE IF EXISTS `wlje4_listbingo_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_addons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `published` tinyint(3) NOT NULL DEFAULT '1',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  `author` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_categories`
--

DROP TABLE IF EXISTS `wlje4_listbingo_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` longtext,
  `parent_id` int(11) DEFAULT '0',
  `profile` varchar(255) NOT NULL,
  `hasprice` tinyint(2) DEFAULT NULL,
  `priceable` tinyint(2) DEFAULT NULL,
  `price` decimal(15,5) DEFAULT NULL,
  `currency` varchar(16) DEFAULT NULL,
  `currency_symbol` varchar(8) DEFAULT NULL,
  `access` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `published` tinyint(2) DEFAULT NULL,
  `level` int(5) NOT NULL DEFAULT '0',
  `rel_cats` text NOT NULL COMMENT 'Related Categories',
  `cats_path` text NOT NULL,
  `last_cat` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_conditions`
--

DROP TABLE IF EXISTS `wlje4_listbingo_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `access` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `searchable` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  `categories` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_countries`
--

DROP TABLE IF EXISTS `wlje4_listbingo_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `code` char(2) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `description` text,
  `logo` varchar(255) DEFAULT NULL,
  `default_country` tinyint(4) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(10) DEFAULT NULL,
  `currency_format` varchar(32) DEFAULT NULL,
  `decimals` varchar(5) DEFAULT NULL,
  `decimal_separator` varchar(8) DEFAULT NULL,
  `value_separator` varchar(8) DEFAULT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `listbingo_country_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_crontrackers`
--

DROP TABLE IF EXISTS `wlje4_listbingo_crontrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_crontrackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastrun` datetime NOT NULL,
  `scope` varchar(50) DEFAULT NULL,
  `lastrunid` int(11) NOT NULL,
  `trackerinfo` varchar(255) DEFAULT NULL,
  `subscope` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_extrafield_options`
--

DROP TABLE IF EXISTS `wlje4_listbingo_extrafield_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_extrafield_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `extrafield_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_extrafields`
--

DROP TABLE IF EXISTS `wlje4_listbingo_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_extrafields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `fieldcode` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `description` text,
  `published` tinyint(4) DEFAULT NULL,
  `searchable` tinyint(4) DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `required` tinyint(4) DEFAULT '0',
  `infobar` tinyint(4) DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `visible_summary` tinyint(4) DEFAULT '0',
  `visible_detail` tinyint(4) DEFAULT '0',
  `prefix_edit` varchar(255) NOT NULL,
  `suffix_edit` varchar(255) NOT NULL,
  `prefix_view` varchar(255) NOT NULL,
  `suffix_view` varchar(255) NOT NULL,
  `access` tinyint(4) DEFAULT NULL,
  `params` longtext,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `categories` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_flag_reports`
--

DROP TABLE IF EXISTS `wlje4_listbingo_flag_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_flag_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `flag_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `flag_date` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_groups`
--

DROP TABLE IF EXISTS `wlje4_listbingo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` text,
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `access` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_items`
--

DROP TABLE IF EXISTS `wlje4_listbingo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `global_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `currencycode` varchar(10) NOT NULL,
  `pricetype` tinyint(3) NOT NULL,
  `price` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `access` tinyint(4) NOT NULL DEFAULT '1',
  `prestatus` int(5) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `category_id` int(8) NOT NULL DEFAULT '0',
  `country_code` varchar(8) NOT NULL DEFAULT '0',
  `region_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `address1` text NOT NULL,
  `address2` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `show_contact` tinyint(3) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `itemtags` text NOT NULL,
  `ordering` int(11) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `badge_priority` int(4) NOT NULL DEFAULT '0',
  `badge_id` int(11) NOT NULL DEFAULT '0',
  `badge_start_date` datetime NOT NULL,
  `badge_valid_days` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `extrafield_values` longtext NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `lng` decimal(10,7) NOT NULL,
  `pagetitle` text NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `enable_map` tinyint(4) NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `priceable_category` int(5) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paid_rel_cats` varchar(255) NOT NULL COMMENT 'Paid related categories',
  `salt` varchar(255) NOT NULL COMMENT 'Salt',
  `authkey` varchar(255) NOT NULL COMMENT 'Auth Key',
  `rel_cats` varchar(255) NOT NULL COMMENT 'Related Categories',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `alias` (`alias`),
  KEY `status` (`status`),
  KEY `currencycode` (`currencycode`),
  KEY `category_id` (`category_id`),
  KEY `region_id` (`region_id`),
  KEY `user_id` (`user_id`),
  KEY `country_code` (`country_code`),
  KEY `type_id` (`type_id`),
  KEY `condition_id` (`condition_id`),
  KEY `badge_id` (`badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_itemsimages`
--

DROP TABLE IF EXISTS `wlje4_listbingo_itemsimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_itemsimages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(4) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_logs`
--

DROP TABLE IF EXISTS `wlje4_listbingo_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `logtime` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `log_type` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_mailtemplates`
--

DROP TABLE IF EXISTS `wlje4_listbingo_mailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_mailtemplates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `body` text COMMENT '@Filter("html,tidy")',
  `type` tinyint(3) DEFAULT NULL,
  `state` tinyint(3) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `mailto` tinyint(4) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `reply_to` varchar(255) DEFAULT NULL,
  `reply_to_email` varchar(255) DEFAULT NULL,
  `mailtogroup` varchar(255) DEFAULT NULL,
  `to_email` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `listbingo_mailtemplate_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_pms_threads`
--

DROP TABLE IF EXISTS `wlje4_listbingo_pms_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_pms_threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(5) NOT NULL,
  `message` text NOT NULL,
  `posted_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `users` varchar(255) NOT NULL,
  `read` int(5) NOT NULL DEFAULT '0',
  `unread` int(4) NOT NULL,
  `ordering` int(5) NOT NULL,
  `to_read` tinyint(11) NOT NULL DEFAULT '0',
  `from_read` tinyint(11) NOT NULL DEFAULT '1',
  `guest` tinyint(1) NOT NULL,
  `sent_delete` tinyint(1) NOT NULL DEFAULT '0',
  `inbox_delete` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `item_id` (`item_id`),
  KEY `read` (`read`),
  KEY `unread` (`unread`),
  KEY `sent_delete` (`sent_delete`),
  KEY `inbox_delete` (`inbox_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_pms_threads_messages`
--

DROP TABLE IF EXISTS `wlje4_listbingo_pms_threads_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_pms_threads_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(5) NOT NULL,
  `uid` int(5) NOT NULL,
  `message` text NOT NULL,
  `sent_delete` int(5) NOT NULL DEFAULT '0',
  `inbox_delete` int(5) NOT NULL DEFAULT '0',
  `posted_date` datetime NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `thread_id` (`thread_id`),
  KEY `uid` (`uid`),
  KEY `sent_delete` (`sent_delete`),
  KEY `inbox_delete` (`inbox_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_profiles`
--

DROP TABLE IF EXISTS `wlje4_listbingo_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `preferences` text,
  `show_contact` tinyint(3) NOT NULL DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `region_id` (`region_id`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_regions`
--

DROP TABLE IF EXISTS `wlje4_listbingo_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_regions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` text,
  `parent_id` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `default_region` tinyint(4) DEFAULT NULL,
  `currency_format` varchar(32) NOT NULL,
  `decimals` varchar(5) NOT NULL,
  `decimal_separator` varchar(8) NOT NULL,
  `value_separator` varchar(8) NOT NULL,
  `level` int(5) NOT NULL DEFAULT '0',
  `regs_path` text NOT NULL,
  `last_region` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_statistics`
--

DROP TABLE IF EXISTS `wlje4_listbingo_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5848 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_tmpimages`
--

DROP TABLE IF EXISTS `wlje4_listbingo_tmpimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_tmpimages` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_token` longtext,
  `image_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_types`
--

DROP TABLE IF EXISTS `wlje4_listbingo_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `access` tinyint(4) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `searchable` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  `categories` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_listbingo_userposts`
--

DROP TABLE IF EXISTS `wlje4_listbingo_userposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_listbingo_userposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `post_type` tinyint(4) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`item_id`),
  KEY `item_id` (`item_id`),
  KEY `reference_id` (`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_consumer`
--

DROP TABLE IF EXISTS `wlje4_lti_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_consumer` (
  `consumer_key` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `lti_version` varchar(12) DEFAULT NULL,
  `consumer_name` varchar(255) DEFAULT NULL,
  `consumer_version` varchar(255) DEFAULT NULL,
  `consumer_guid` varchar(255) DEFAULT NULL,
  `css_path` varchar(255) DEFAULT NULL,
  `protected` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enable_from` datetime DEFAULT NULL,
  `enable_until` datetime DEFAULT NULL,
  `last_access` date DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_consumer_context`
--

DROP TABLE IF EXISTS `wlje4_lti_consumer_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_consumer_context` (
  `context_id` varchar(255) NOT NULL,
  `lti_context_id` varchar(255) DEFAULT NULL,
  `lti_resource_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `settings` text,
  `primary_consumer_key` varchar(255) DEFAULT NULL,
  `primary_context_id` varchar(255) DEFAULT NULL,
  `share_approved` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `context_label` varchar(45) DEFAULT NULL,
  `context_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`context_id`),
  KEY `wlje4_lti_context_context_FK1` (`primary_consumer_key`,`primary_context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_consumer_v1`
--

DROP TABLE IF EXISTS `wlje4_lti_consumer_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_consumer_v1` (
  `consumer_key` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `lti_version` varchar(12) DEFAULT NULL,
  `consumer_name` varchar(255) DEFAULT NULL,
  `consumer_version` varchar(255) DEFAULT NULL,
  `consumer_guid` varchar(255) DEFAULT NULL,
  `css_path` varchar(255) DEFAULT NULL,
  `protected` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `enable_from` datetime DEFAULT NULL,
  `enable_until` datetime DEFAULT NULL,
  `last_access` date DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_consumers`
--

DROP TABLE IF EXISTS `wlje4_lti_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_consumers` (
  `consumer_key` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `lti_version` varchar(12) DEFAULT NULL,
  `consumer_name` varchar(255) DEFAULT NULL,
  `consumer_version` varchar(255) DEFAULT NULL,
  `consumer_guid` varchar(255) DEFAULT NULL,
  `return_path` varchar(255) DEFAULT NULL,
  `protected` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `enable_from` datetime DEFAULT NULL,
  `enable_until` datetime DEFAULT NULL,
  `last_access` date DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_context_v1`
--

DROP TABLE IF EXISTS `wlje4_lti_context_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_context_v1` (
  `consumer_key` varchar(255) NOT NULL,
  `context_id` varchar(255) NOT NULL,
  `lti_context_id` varchar(255) DEFAULT NULL,
  `lti_resource_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `settings` text,
  `primary_consumer_key` varchar(255) DEFAULT NULL,
  `primary_context_id` varchar(255) DEFAULT NULL,
  `share_approved` tinyint(4) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`,`context_id`),
  KEY `wlje4_lti_context_context_FK1` (`primary_consumer_key`,`primary_context_id`),
  CONSTRAINT `wlje4_wlje4_lti_context_consumer_FK1` FOREIGN KEY (`consumer_key`) REFERENCES `wlje4_lti_consumers` (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_ims_keys`
--

DROP TABLE IF EXISTS `wlje4_lti_ims_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_ims_keys` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `oauth_consumer_key` char(255) NOT NULL,
  `secret` char(255) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `context_id` char(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_imskeys_v1`
--

DROP TABLE IF EXISTS `wlje4_lti_imskeys_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_imskeys_v1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `oauthconsumerkey` varchar(256) NOT NULL,
  `secret` varchar(256) NOT NULL,
  `contextid` varchar(256) NOT NULL,
  `createdat` date NOT NULL,
  `updatedat` date NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_nonce_v1`
--

DROP TABLE IF EXISTS `wlje4_lti_nonce_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_nonce_v1` (
  `consumer_key` varchar(255) NOT NULL,
  `value` varchar(32) NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`consumer_key`,`value`),
  CONSTRAINT `wlje4_lti_nonce_consumer_FK1` FOREIGN KEY (`consumer_key`) REFERENCES `wlje4_lti_consumers` (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_share_key_v1`
--

DROP TABLE IF EXISTS `wlje4_lti_share_key_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_share_key_v1` (
  `share_key_id` varchar(32) NOT NULL,
  `primary_consumer_key` varchar(255) NOT NULL,
  `primary_context_id` varchar(255) NOT NULL,
  `auto_approve` tinyint(4) NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`share_key_id`),
  KEY `wlje4_lti_share_key_context_FK1` (`primary_consumer_key`,`primary_context_id`),
  CONSTRAINT `wlje4_lti_share_key_context_FK1` FOREIGN KEY (`primary_consumer_key`, `primary_context_id`) REFERENCES `wlje4_lti_context_v1` (`consumer_key`, `context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_lti_users`
--

DROP TABLE IF EXISTS `wlje4_lti_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_lti_users` (
  `user_key` varchar(255) NOT NULL,
  `consumer_key` varchar(255) NOT NULL,
  `context_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `lti_result_sourcedid` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`user_key`),
  UNIQUE KEY `user_key_UNIQUE` (`user_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_menu`
--

DROP TABLE IF EXISTS `wlje4_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2097 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_menu_easyblog_update`
--

DROP TABLE IF EXISTS `wlje4_menu_easyblog_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_menu_easyblog_update` (
  `id` int(11) DEFAULT NULL,
  `menutype` varchar(50) DEFAULT NULL,
  `title` varchar(67) DEFAULT NULL,
  `alias` varchar(67) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `path` varchar(80) DEFAULT NULL,
  `link` varchar(78) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` varchar(50) DEFAULT NULL,
  `browserNav` int(11) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `img` varchar(93) DEFAULT NULL,
  `template_style_id` int(11) DEFAULT NULL,
  `params` varchar(50) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_menu_types`
--

DROP TABLE IF EXISTS `wlje4_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_menus_attachments`
--

DROP TABLE IF EXISTS `wlje4_menus_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_menus_attachments` (
  `id` int(11) DEFAULT NULL,
  `menutype` varchar(50) DEFAULT NULL,
  `title` varchar(56) DEFAULT NULL,
  `alias` varchar(56) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `path` varchar(56) DEFAULT NULL,
  `link` varchar(74) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `published` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `checked_out` int(11) DEFAULT NULL,
  `checked_out_time` varchar(50) DEFAULT NULL,
  `browserNav` int(11) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `template_style_id` int(11) DEFAULT NULL,
  `params` varchar(50) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_messages`
--

DROP TABLE IF EXISTS `wlje4_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_messages_cfg`
--

DROP TABLE IF EXISTS `wlje4_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_module_quiz_results`
--

DROP TABLE IF EXISTS `wlje4_module_quiz_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_module_quiz_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `module_id` varchar(50) DEFAULT NULL,
  `quiz_id` varchar(50) DEFAULT NULL,
  `q1` varchar(50) DEFAULT NULL,
  `q2` varchar(50) DEFAULT NULL,
  `q3` varchar(50) DEFAULT NULL,
  `q4` varchar(50) DEFAULT NULL,
  `q5` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `completion_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_modules`
--

DROP TABLE IF EXISTS `wlje4_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `extra_params` varchar(5120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_modules_menu`
--

DROP TABLE IF EXISTS `wlje4_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_mylessonplans`
--

DROP TABLE IF EXISTS `wlje4_mylessonplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_mylessonplans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_id` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '2013-05-14 15:32:24',
  `created_by` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(11) NOT NULL DEFAULT '0',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(255) NOT NULL DEFAULT '',
  `grade` text NOT NULL,
  `subject` text NOT NULL,
  `lesson_plan_name` text NOT NULL,
  `edit` text,
  `region` text NOT NULL,
  `view` text,
  `publish` text,
  PRIMARY KEY (`id`),
  KEY `storage_id` (`storage_id`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `modified_user_id` (`modified_user_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_newsfeeds`
--

DROP TABLE IF EXISTS `wlje4_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_offlajn_forms`
--

DROP TABLE IF EXISTS `wlje4_offlajn_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_offlajn_forms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `props` text NOT NULL,
  `fields` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_offlajn_oauths`
--

DROP TABLE IF EXISTS `wlje4_offlajn_oauths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_offlajn_oauths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `alias` varchar(127) NOT NULL,
  `app_id` varchar(127) DEFAULT NULL,
  `app_secret` varchar(127) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `create_app` varchar(255) NOT NULL,
  `auth` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `userinfo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_offlajn_users`
--

DROP TABLE IF EXISTS `wlje4_offlajn_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_offlajn_users` (
  `user_id` int(11) NOT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `windows_id` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL,
  `linkedin_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_oneclickaction_actions`
--

DROP TABLE IF EXISTS `wlje4_oneclickaction_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_oneclickaction_actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL,
  `actionurl` varchar(4000) NOT NULL,
  `otp` char(64) NOT NULL,
  `expiry` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_opengraph_action`
--

DROP TABLE IF EXISTS `wlje4_opengraph_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_opengraph_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(20) DEFAULT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `fb_built_in` tinyint(1) DEFAULT NULL,
  `can_disable` tinyint(1) DEFAULT NULL,
  `params` text,
  `published` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_opengraph_action_object`
--

DROP TABLE IF EXISTS `wlje4_opengraph_action_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_opengraph_action_object` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_opengraph_activity`
--

DROP TABLE IF EXISTS `wlje4_opengraph_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_opengraph_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url` text,
  `status` tinyint(2) DEFAULT NULL,
  `unique_key` varchar(32) DEFAULT NULL,
  `response` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_opengraph_object`
--

DROP TABLE IF EXISTS `wlje4_opengraph_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_opengraph_object` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(15) DEFAULT NULL,
  `system_name` varchar(20) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `fb_built_in` int(1) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `params` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_overrider`
--

DROP TABLE IF EXISTS `wlje4_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18460 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_address`
--

DROP TABLE IF EXISTS `wlje4_payplans_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `street1` varchar(64) NOT NULL DEFAULT '',
  `street2` varchar(64) DEFAULT NULL,
  `zipcode` varchar(10) NOT NULL DEFAULT '',
  `city` varchar(32) NOT NULL DEFAULT '',
  `state` varchar(32) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT '0',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_personal` int(1) NOT NULL DEFAULT '1',
  `is_buisness` int(1) NOT NULL DEFAULT '1',
  `is_shipping` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`address_id`),
  KEY `idx_address_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_app`
--

DROP TABLE IF EXISTS `wlje4_payplans_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_app` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `type` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `core_params` text,
  `app_params` text,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_config`
--

DROP TABLE IF EXISTS `wlje4_payplans_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `idx_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=1111189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_country`
--

DROP TABLE IF EXISTS `wlje4_payplans_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isocode2` char(2) DEFAULT NULL,
  `isocode3` char(3) DEFAULT NULL,
  `isocode3n` int(3) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_currency`
--

DROP TABLE IF EXISTS `wlje4_payplans_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_currency` (
  `currency_id` char(3) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `params` text,
  `symbol` char(5) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_field_map`
--

DROP TABLE IF EXISTS `wlje4_payplans_field_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_field_map` (
  `plan_id` int(11) NOT NULL,
  `plan_title` varchar(80) DEFAULT NULL,
  `program` varchar(57) DEFAULT NULL,
  `gradelevel` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_group`
--

DROP TABLE IF EXISTS `wlje4_payplans_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) DEFAULT '1',
  `ordering` int(11) DEFAULT '0',
  `description` text,
  `params` text,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_invoice`
--

DROP TABLE IF EXISTS `wlje4_payplans_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL DEFAULT '10010',
  `object_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` decimal(15,5) DEFAULT '0.00000',
  `total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `currency` char(3) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_invoice_bkup`
--

DROP TABLE IF EXISTS `wlje4_payplans_invoice_bkup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_invoice_bkup` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL DEFAULT '10010',
  `object_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` decimal(15,5) DEFAULT '0.00000',
  `total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `currency` char(3) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_order_id` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_log`
--

DROP TABLE IF EXISTS `wlje4_payplans_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `object_id` int(11) NOT NULL,
  `message` text,
  `user_ip` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `content` text,
  `read` tinyint(1) DEFAULT '0',
  `position` text,
  `previous_token` text,
  `current_token` text,
  PRIMARY KEY (`log_id`),
  KEY `idx_level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=1327917 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_modifier`
--

DROP TABLE IF EXISTS `wlje4_payplans_modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_modifier` (
  `modifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `amount` decimal(15,5) DEFAULT '0.00000',
  `type` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `message` text,
  `percentage` tinyint(1) NOT NULL DEFAULT '1',
  `serial` int(11) NOT NULL DEFAULT '0',
  `frequency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`modifier_id`),
  KEY `idx_user_id` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1733 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_order`
--

DROP TABLE IF EXISTS `wlje4_payplans_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL,
  `total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `currency` char(3) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `params` text,
  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20361 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_parentchild`
--

DROP TABLE IF EXISTS `wlje4_payplans_parentchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_parentchild` (
  `dependent_plan` int(11) NOT NULL,
  `base_plan` varchar(255) DEFAULT NULL,
  `relation` int(11) DEFAULT '-2',
  `display_dependent_plan` int(11) DEFAULT '0',
  `params` text,
  PRIMARY KEY (`dependent_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_payment`
--

DROP TABLE IF EXISTS `wlje4_payplans_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `params` text,
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `gateway_params` text,
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `idx_invoice_id` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_plan`
--

DROP TABLE IF EXISTS `wlje4_payplans_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `published` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) DEFAULT '1',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime DEFAULT '0000-00-00 00:00:00',
  `description` text,
  `details` text,
  `params` text,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_planapp`
--

DROP TABLE IF EXISTS `wlje4_payplans_planapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_planapp` (
  `planapp_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`planapp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10561 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_plangroup`
--

DROP TABLE IF EXISTS `wlje4_payplans_plangroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_plangroup` (
  `plangroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`plangroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_prodiscount`
--

DROP TABLE IF EXISTS `wlje4_payplans_prodiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_prodiscount` (
  `prodiscount_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_type` varchar(255) DEFAULT NULL,
  `core_discount` tinyint(1) DEFAULT NULL,
  `coupon_amount` decimal(15,5) DEFAULT '0.00000',
  `plans` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`prodiscount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_purge`
--

DROP TABLE IF EXISTS `wlje4_payplans_purge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_purge` (
  `Subscription_Id__c` int(11) DEFAULT NULL,
  `del0` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_resource`
--

DROP TABLE IF EXISTS `wlje4_payplans_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `subscription_ids` text,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resource_id`),
  KEY `user_id` (`user_id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=103314 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_statistics`
--

DROP TABLE IF EXISTS `wlje4_payplans_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `statistics_type` varchar(255) DEFAULT NULL,
  `purpose_id_1` int(11) NOT NULL,
  `purpose_id_2` int(11) DEFAULT '0',
  `count_1` int(11) DEFAULT '0',
  `count_2` int(11) DEFAULT '0',
  `count_3` int(11) DEFAULT '0',
  `count_4` int(11) DEFAULT '0',
  `count_5` int(11) DEFAULT '0',
  `count_6` int(11) DEFAULT '0',
  `count_7` int(11) DEFAULT '0',
  `count_8` int(11) DEFAULT '0',
  `count_9` int(11) DEFAULT '0',
  `count_10` int(11) DEFAULT '0',
  `details_1` varchar(255) DEFAULT NULL,
  `details_2` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `statistics_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`statistics_id`),
  KEY `idx_statistics_date` (`statistics_date`)
) ENGINE=InnoDB AUTO_INCREMENT=299433 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_subscription`
--

DROP TABLE IF EXISTS `wlje4_payplans_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT '0',
  `total` decimal(15,5) DEFAULT '0.00000',
  `subscription_date` datetime DEFAULT '0000-00-00 00:00:00',
  `expiration_date` datetime DEFAULT '2038-01-01 00:00:00',
  `cancel_date` datetime DEFAULT '0000-00-00 00:00:00',
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  `EmailAddress` text,
  `sf_ext_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73986 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER afterSubscriptionInsert AFTER INSERT ON wlje4_payplans_subscription FOR EACH ROW INSERT INTO subscription_audit VALUES (
  NEW.subscription_id,
  NEW.plan_id,
  (SELECT email FROM wlje4_users WHERE id = NEW.user_id LIMIT 1),
  
  (SELECT title FROM wlje4_payplans_plan, wlje4_payplans_subscription where wlje4_payplans_plan.plan_id = wlje4_payplans_subscription.plan_id and wlje4_payplans_plan.plan_id = NEW.plan_id LIMIT 1),
  NEW.user_id,
  NEW.status,
  NEW.subscription_date,
  NEW.expiration_date,
  NEW.modified_date
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER afterSubscriptionUpdate AFTER UPDATE ON wlje4_payplans_subscription FOR EACH ROW INSERT INTO subscription_audit VALUES (
  NEW.subscription_id,
  NEW.plan_id,
  (SELECT email FROM wlje4_users WHERE id = NEW.user_id LIMIT 1),
  
  (SELECT title FROM wlje4_payplans_plan, wlje4_payplans_subscription where wlje4_payplans_plan.plan_id = wlje4_payplans_subscription.plan_id and wlje4_payplans_plan.plan_id = NEW.plan_id LIMIT 1),
  NEW.user_id,
  NEW.status,
  NEW.subscription_date,
  NEW.expiration_date,
  NEW.modified_date
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wlje4_payplans_support`
--

DROP TABLE IF EXISTS `wlje4_payplans_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_support` (
  `support_id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(45) NOT NULL,
  `value` text,
  PRIMARY KEY (`support_id`),
  UNIQUE KEY `idx_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_temp_comp_table`
--

DROP TABLE IF EXISTS `wlje4_payplans_temp_comp_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_temp_comp_table` (
  `old_plan_id` int(11) NOT NULL,
  `new_plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`old_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_transaction`
--

DROP TABLE IF EXISTS `wlje4_payplans_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `invoice_id` int(11) DEFAULT '0',
  `current_invoice_id` int(11) DEFAULT '0',
  `payment_id` int(11) DEFAULT '0',
  `gateway_txn_id` varchar(255) DEFAULT NULL,
  `gateway_parent_txn` varchar(255) DEFAULT NULL,
  `gateway_subscr_id` varchar(255) DEFAULT NULL,
  `amount` decimal(15,5) DEFAULT '0.00000',
  `reference` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `params` text,
  PRIMARY KEY (`transaction_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1635 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_user`
--

DROP TABLE IF EXISTS `wlje4_payplans_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_user` (
  `user_id` int(11) NOT NULL,
  `params` text,
  `address` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) DEFAULT '',
  `city` varchar(255) DEFAULT '',
  `country` int(11) NOT NULL DEFAULT '0',
  `zipcode` varchar(10) NOT NULL DEFAULT '',
  `preference` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_payplans_wallet`
--

DROP TABLE IF EXISTS `wlje4_payplans_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_payplans_wallet` (
  `wallet_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT '0',
  `amount` decimal(15,5) DEFAULT '0.00000',
  `message` varchar(255) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT '0',
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`wallet_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=748 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_postinstall_messages`
--

DROP TABLE IF EXISTS `wlje4_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_ppinstaller_config`
--

DROP TABLE IF EXISTS `wlje4_ppinstaller_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_ppinstaller_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `idx_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_admins`
--

DROP TABLE IF EXISTS `wlje4_pr_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  CONSTRAINT `admins_id_foreign` FOREIGN KEY (`id`) REFERENCES `wlje4_pr_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42343 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_author_module`
--

DROP TABLE IF EXISTS `wlje4_pr_author_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_author_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `author_module_author_id_module_id_unique` (`author_id`,`module_id`),
  KEY `author_module_module_id_foreign` (`module_id`),
  CONSTRAINT `author_module_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `wlje4_pr_authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `author_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `wlje4_pr_modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_authors`
--

DROP TABLE IF EXISTS `wlje4_pr_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  CONSTRAINT `authors_id_foreign` FOREIGN KEY (`id`) REFERENCES `wlje4_pr_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42343 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_group_roadmap`
--

DROP TABLE IF EXISTS `wlje4_pr_group_roadmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_group_roadmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `roadmap_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_roadmap_group_id_roadmap_id_unique` (`group_id`,`roadmap_id`),
  KEY `group_roadmap_roadmap_id_foreign` (`roadmap_id`),
  CONSTRAINT `group_roadmap_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `wlje4_pr_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_roadmap_roadmap_id_foreign` FOREIGN KEY (`roadmap_id`) REFERENCES `wlje4_pr_roadmaps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_group_user`
--

DROP TABLE IF EXISTS `wlje4_pr_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_group_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_user_group_id_user_id_unique` (`group_id`,`user_id`),
  KEY `group_user_user_id_foreign` (`user_id`),
  CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `wlje4_pr_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wlje4_pr_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_groups`
--

DROP TABLE IF EXISTS `wlje4_pr_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_groups` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_lesson_principal`
--

DROP TABLE IF EXISTS `wlje4_pr_lesson_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_lesson_principal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(10) unsigned NOT NULL,
  `principal_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `lesson_principal_lesson_id_foreign` (`lesson_id`),
  KEY `lesson_principal_principal_id_foreign` (`principal_id`),
  CONSTRAINT `lesson_principal_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `wlje4_pr_lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_principal_principal_id_foreign` FOREIGN KEY (`principal_id`) REFERENCES `wlje4_pr_principals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=889 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_lesson_resource`
--

DROP TABLE IF EXISTS `wlje4_pr_lesson_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_lesson_resource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(10) unsigned NOT NULL,
  `resource_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `lesson_resource_lesson_id_foreign` (`lesson_id`),
  KEY `lesson_resource_resource_id_foreign` (`resource_id`),
  CONSTRAINT `lesson_resource_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `wlje4_pr_lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_resource_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `wlje4_pr_resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=576 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_lessons`
--

DROP TABLE IF EXISTS `wlje4_pr_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_lessons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `bonus` tinyint(1) NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ect` smallint(5) unsigned NOT NULL DEFAULT '10',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'video',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `ask_a_question_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lessons_slug_unique` (`slug`),
  KEY `lessons_author_id_foreign` (`author_id`),
  KEY `lessons_module_id_foreign` (`module_id`),
  CONSTRAINT `lessons_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `wlje4_pr_authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lessons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `wlje4_pr_modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_migrations`
--

DROP TABLE IF EXISTS `wlje4_pr_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_module_roadmap`
--

DROP TABLE IF EXISTS `wlje4_pr_module_roadmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_module_roadmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `roadmap_id` int(10) unsigned NOT NULL,
  `order` smallint(5) unsigned NOT NULL,
  `bonus` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_roadmap_module_id_roadmap_id_unique` (`module_id`,`roadmap_id`),
  KEY `module_roadmap_roadmap_id_foreign` (`roadmap_id`),
  CONSTRAINT `module_roadmap_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `wlje4_pr_modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `module_roadmap_roadmap_id_foreign` FOREIGN KEY (`roadmap_id`) REFERENCES `wlje4_pr_roadmaps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=725 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_modules`
--

DROP TABLE IF EXISTS `wlje4_pr_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `joomla_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discussion_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_slug_unique` (`slug`),
  KEY `modules_author_id_foreign` (`author_id`),
  CONSTRAINT `modules_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `wlje4_pr_authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_password_resets`
--

DROP TABLE IF EXISTS `wlje4_pr_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_permission_role`
--

DROP TABLE IF EXISTS `wlje4_pr_permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_role_permission_id_role_id_unique` (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `wlje4_pr_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wlje4_pr_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_permissions`
--

DROP TABLE IF EXISTS `wlje4_pr_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_principals`
--

DROP TABLE IF EXISTS `wlje4_pr_principals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_principals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  CONSTRAINT `principals_id_foreign` FOREIGN KEY (`id`) REFERENCES `wlje4_pr_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42343 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_resources`
--

DROP TABLE IF EXISTS `wlje4_pr_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `resources_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_roadmaps`
--

DROP TABLE IF EXISTS `wlje4_pr_roadmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_roadmaps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `principal_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `force_modules_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roadmaps_slug_unique` (`slug`),
  KEY `roadmaps_admin_id_foreign` (`admin_id`),
  KEY `roadmaps_principal_id_foreign` (`principal_id`),
  CONSTRAINT `roadmaps_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `wlje4_pr_admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roadmaps_principal_id_foreign` FOREIGN KEY (`principal_id`) REFERENCES `wlje4_pr_principals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_role_user`
--

DROP TABLE IF EXISTS `wlje4_pr_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_user_role_id_user_id_unique` (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wlje4_pr_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wlje4_pr_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_roles`
--

DROP TABLE IF EXISTS `wlje4_pr_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_taggables`
--

DROP TABLE IF EXISTS `wlje4_pr_taggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_taggables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `taggable_id` int(10) unsigned NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=713 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_tags`
--

DROP TABLE IF EXISTS `wlje4_pr_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_pr_users`
--

DROP TABLE IF EXISTS `wlje4_pr_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_pr_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uuid_unique` (`uuid`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42343 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_rb_ecommerce_country`
--

DROP TABLE IF EXISTS `wlje4_rb_ecommerce_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_rb_ecommerce_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isocode2` char(2) DEFAULT NULL,
  `isocode3` char(3) DEFAULT NULL,
  `isocode3n` int(3) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_rb_ecommerce_currency`
--

DROP TABLE IF EXISTS `wlje4_rb_ecommerce_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_rb_ecommerce_currency` (
  `currency_id` char(3) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `params` text,
  `symbol` char(5) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_rb_ecommerce_invoice`
--

DROP TABLE IF EXISTS `wlje4_rb_ecommerce_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_rb_ecommerce_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `object_type` varchar(255) DEFAULT NULL,
  `buyer_id` int(11) NOT NULL,
  `master_invoice_id` int(11) NOT NULL DEFAULT '0',
  `currency` char(3) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `serial` varchar(255) NOT NULL COMMENT 'Fo custom invoice numbering',
  `status` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `expiration_type` varchar(255) NOT NULL,
  `time_price` text NOT NULL,
  `recurrence_count` int(11) NOT NULL DEFAULT '0',
  `subtotal` decimal(15,5) DEFAULT '0.00000',
  `total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `notes` text,
  `params` text,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `paid_date` datetime DEFAULT NULL,
  `refund_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `issue_date` datetime DEFAULT NULL,
  `processor_type` varchar(255) DEFAULT NULL,
  `processor_config` text,
  `processor_data` text,
  PRIMARY KEY (`invoice_id`),
  KEY `idx_buyer_id` (`buyer_id`),
  KEY `idx_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_rb_ecommerce_modifier`
--

DROP TABLE IF EXISTS `wlje4_rb_ecommerce_modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_rb_ecommerce_modifier` (
  `modifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `amount` decimal(15,5) DEFAULT '0.00000',
  `value` decimal(15,5) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` varchar(255) DEFAULT NULL,
  `message` text,
  `percentage` tinyint(1) NOT NULL DEFAULT '1',
  `serial` int(11) NOT NULL DEFAULT '0',
  `frequency` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `consumed_date` datetime DEFAULT NULL,
  PRIMARY KEY (`modifier_id`),
  KEY `idx_invoice_id` (`invoice_id`),
  KEY `idx_buyer_id` (`buyer_id`),
  KEY `idx_object_type` (`object_type`),
  KEY `idx_object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_rb_ecommerce_transaction`
--

DROP TABLE IF EXISTS `wlje4_rb_ecommerce_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_rb_ecommerce_transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) DEFAULT '0',
  `invoice_id` int(11) DEFAULT '0',
  `processor_type` varchar(255) DEFAULT NULL,
  `gateway_txn_id` varchar(255) DEFAULT NULL,
  `gateway_parent_txn` varchar(255) DEFAULT NULL,
  `gateway_subscr_id` varchar(255) DEFAULT NULL,
  `amount` decimal(15,5) DEFAULT '0.00000',
  `payment_status` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `params` text,
  `signature` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `idx_user_id` (`buyer_id`),
  KEY `idx_invoice_id` (`invoice_id`),
  KEY `idx_signature` (`signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_rbinstaller_config`
--

DROP TABLE IF EXISTS `wlje4_rbinstaller_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_rbinstaller_config` (
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirect_links`
--

DROP TABLE IF EXISTS `wlje4_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB AUTO_INCREMENT=54692 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_config`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_config` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_dynamics`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_dynamics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_dynamics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_groups`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `frontend_type` varchar(255) NOT NULL,
  `frontend_url` varchar(255) NOT NULL,
  `frontend_type_logout` varchar(255) NOT NULL,
  `frontend_url_logout` varchar(255) NOT NULL,
  `backend_type` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'normal',
  `backend_url` varchar(255) NOT NULL,
  `backend_component` varchar(255) NOT NULL,
  `opening_site` varchar(20) NOT NULL,
  `opening_site_url` varchar(255) NOT NULL,
  `opening_site_home` int(1) NOT NULL,
  `menuitem_login` int(11) NOT NULL DEFAULT '0',
  `menuitem_open` int(11) NOT NULL DEFAULT '0',
  `menuitem_logout` int(11) NOT NULL DEFAULT '0',
  `dynamic_login` int(11) NOT NULL DEFAULT '0',
  `dynamic_open` int(11) NOT NULL DEFAULT '0',
  `dynamic_logout` int(11) NOT NULL DEFAULT '0',
  `open_type` varchar(50) NOT NULL,
  `inherit_login` int(11) NOT NULL DEFAULT '0',
  `inherit_open` int(11) NOT NULL DEFAULT '0',
  `inherit_logout` int(11) NOT NULL DEFAULT '0',
  `inherit_backend` int(11) NOT NULL DEFAULT '0',
  `logoutbackend_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'normal',
  `logoutbackend_menu` int(11) NOT NULL DEFAULT '0',
  `logoutbackend_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '../index.php',
  `logoutbackend_dyna` int(11) NOT NULL DEFAULT '0',
  `logoutbackend_inherit` int(11) NOT NULL DEFAULT '0',
  `first_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'normal',
  `first_menu` int(11) NOT NULL DEFAULT '0',
  `first_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'index.php',
  `first_dyna` int(11) NOT NULL DEFAULT '0',
  `first_inherit` int(11) NOT NULL DEFAULT '0',
  `loginbackend_dynamic` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_levels`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `frontend_type` varchar(255) NOT NULL,
  `frontend_url` varchar(255) NOT NULL,
  `frontend_type_logout` varchar(255) NOT NULL,
  `frontend_url_logout` varchar(255) NOT NULL,
  `opening_site` varchar(20) NOT NULL,
  `opening_site_url` varchar(255) NOT NULL,
  `opening_site_home` int(1) NOT NULL,
  `menuitem_login` int(11) NOT NULL DEFAULT '0',
  `menuitem_open` int(11) NOT NULL DEFAULT '0',
  `menuitem_logout` int(11) NOT NULL DEFAULT '0',
  `dynamic_login` int(11) NOT NULL DEFAULT '0',
  `dynamic_open` int(11) NOT NULL DEFAULT '0',
  `dynamic_logout` int(11) NOT NULL DEFAULT '0',
  `open_type` varchar(50) NOT NULL,
  `inherit_login` int(11) NOT NULL DEFAULT '0',
  `inherit_open` int(11) NOT NULL DEFAULT '0',
  `inherit_logout` int(11) NOT NULL DEFAULT '0',
  `first_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'normal',
  `first_menu` int(11) NOT NULL DEFAULT '0',
  `first_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'index.php',
  `first_dyna` int(11) NOT NULL DEFAULT '0',
  `first_inherit` int(11) NOT NULL DEFAULT '0',
  `logoutbackend_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'normal',
  `logoutbackend_menu` int(11) NOT NULL DEFAULT '0',
  `logoutbackend_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '../index.php',
  `logoutbackend_dyna` int(11) NOT NULL DEFAULT '0',
  `logoutbackend_inherit` int(11) NOT NULL DEFAULT '0',
  `loginbackend_type` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'normal',
  `loginbackend_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `loginbackend_component` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `loginbackend_inherit` int(5) NOT NULL DEFAULT '0',
  `loginbackend_dynamic` int(5) NOT NULL DEFAULT '0',
  `logoutbackend_dynamic` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_map`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_order_groups`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_order_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_order_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `redirect_order_front` int(11) NOT NULL,
  `redirect_order_back` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_order_levels`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_order_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_order_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_id` int(11) NOT NULL,
  `redirect_order` int(11) NOT NULL,
  `order_backend` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_sessions`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(200) NOT NULL,
  `url` varchar(500) NOT NULL,
  `message` varchar(500) NOT NULL,
  `message_type` varchar(100) NOT NULL,
  `unixtime` varchar(14) NOT NULL,
  `opening_site` int(1) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `opening_site_home` int(1) NOT NULL,
  `logout` int(1) NOT NULL,
  `silent` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_redirectonlogin_users`
--

DROP TABLE IF EXISTS `wlje4_redirectonlogin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_redirectonlogin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `frontend_type` varchar(255) NOT NULL,
  `frontend_url` varchar(255) NOT NULL,
  `frontend_type_logout` varchar(255) NOT NULL,
  `frontend_url_logout` varchar(255) NOT NULL,
  `backend_type` varchar(255) NOT NULL,
  `backend_url` varchar(255) NOT NULL,
  `backend_component` varchar(255) NOT NULL,
  `opening_site` varchar(20) NOT NULL,
  `opening_site_url` varchar(255) NOT NULL,
  `opening_site_home` int(1) NOT NULL,
  `menuitem_login` int(11) NOT NULL DEFAULT '0',
  `menuitem_open` int(11) NOT NULL DEFAULT '0',
  `menuitem_logout` int(11) NOT NULL DEFAULT '0',
  `dynamic_login` int(11) NOT NULL DEFAULT '0',
  `dynamic_open` int(11) NOT NULL DEFAULT '0',
  `dynamic_logout` int(11) NOT NULL DEFAULT '0',
  `open_type` varchar(50) NOT NULL,
  `open_front_logout` int(11) NOT NULL,
  `open_back_logout` int(11) NOT NULL,
  `logoutbackend_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'none',
  `logoutbackend_menu` int(11) NOT NULL DEFAULT '0',
  `logoutbackend_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '../index.php',
  `logoutbackend_dyna` int(11) NOT NULL DEFAULT '0',
  `first_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'none',
  `first_menu` int(11) NOT NULL DEFAULT '0',
  `first_url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'index.php',
  `first_dyna` int(11) NOT NULL DEFAULT '0',
  `loginbackend_dynamic` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_rereplacer`
--

DROP TABLE IF EXISTS `wlje4_rereplacer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_rereplacer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `search` text NOT NULL,
  `replace` text NOT NULL,
  `area` text NOT NULL,
  `params` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`published`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_samlogin_authz_hist`
--

DROP TABLE IF EXISTS `wlje4_samlogin_authz_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_samlogin_authz_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(500) NOT NULL,
  `group` int(11) NOT NULL,
  `email` varchar(500) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `initiator` varchar(1000) NOT NULL DEFAULT 'manual',
  `timeid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `samlogin_user` (`username`(255)),
  KEY `samlogin_timeid` (`timeid`),
  KEY `samlogin_group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_samlogin_session_kvstore`
--

DROP TABLE IF EXISTS `wlje4_samlogin_session_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_samlogin_session_kvstore` (
  `_type` varchar(30) NOT NULL,
  `_key` varchar(50) NOT NULL,
  `_value` text NOT NULL,
  `_expire` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_key`,`_type`),
  KEY `wlje4_samlogin_session_kvstore_expire` (`_expire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_samlogin_session_tableVersion`
--

DROP TABLE IF EXISTS `wlje4_samlogin_session_tableVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_samlogin_session_tableVersion` (
  `_name` varchar(30) NOT NULL,
  `_version` int(11) NOT NULL,
  UNIQUE KEY `_name` (`_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_schemas`
--

DROP TABLE IF EXISTS `wlje4_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_session`
--

DROP TABLE IF EXISTS `wlje4_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sh404sef_aliases`
--

DROP TABLE IF EXISTS `wlje4_sh404sef_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sh404sef_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `newurl` (`newurl`),
  KEY `alias` (`alias`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sh404sef_metas`
--

DROP TABLE IF EXISTS `wlje4_sh404sef_metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sh404sef_metas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `metadesc` varchar(255) DEFAULT '',
  `metakey` varchar(255) DEFAULT '',
  `metatitle` varchar(255) DEFAULT '',
  `metalang` varchar(30) DEFAULT '',
  `metarobots` varchar(30) DEFAULT '',
  `canonical` varchar(255) DEFAULT '',
  `og_enable` tinyint(3) NOT NULL DEFAULT '2',
  `og_type` varchar(30) DEFAULT '',
  `og_image` varchar(255) DEFAULT '',
  `og_enable_description` tinyint(3) NOT NULL DEFAULT '2',
  `og_enable_site_name` tinyint(3) NOT NULL DEFAULT '2',
  `og_site_name` varchar(255) DEFAULT '',
  `fb_admin_ids` varchar(255) DEFAULT '',
  `og_enable_location` tinyint(3) NOT NULL DEFAULT '2',
  `og_latitude` varchar(30) DEFAULT '',
  `og_longitude` varchar(30) DEFAULT '',
  `og_street_address` varchar(255) DEFAULT '',
  `og_locality` varchar(255) DEFAULT '',
  `og_postal_code` varchar(30) DEFAULT '',
  `og_region` varchar(255) DEFAULT '',
  `og_country_name` varchar(255) DEFAULT '',
  `og_enable_contact` tinyint(3) NOT NULL DEFAULT '2',
  `og_email` varchar(255) DEFAULT '',
  `og_phone_number` varchar(255) DEFAULT '',
  `og_fax_number` varchar(255) DEFAULT '',
  `og_enable_fb_admin_ids` tinyint(3) NOT NULL DEFAULT '2',
  `twittercards_enable` tinyint(3) NOT NULL DEFAULT '2',
  `twittercards_site_account` varchar(100) DEFAULT '',
  `twittercards_creator_account` varchar(100) DEFAULT '',
  `google_authorship_enable` tinyint(3) NOT NULL DEFAULT '2',
  `google_authorship_author_profile` varchar(255) DEFAULT '',
  `google_authorship_author_name` varchar(255) DEFAULT '',
  `google_publisher_enable` tinyint(3) NOT NULL DEFAULT '2',
  `google_publisher_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `newurl` (`newurl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sh404sef_pageids`
--

DROP TABLE IF EXISTS `wlje4_sh404sef_pageids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sh404sef_pageids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `pageid` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `newurl` (`newurl`),
  KEY `alias` (`pageid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sh404sef_urls`
--

DROP TABLE IF EXISTS `wlje4_sh404sef_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sh404sef_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpt` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `oldurl` varchar(255) NOT NULL DEFAULT '',
  `newurl` varchar(255) NOT NULL DEFAULT '',
  `dateadd` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `newurl` (`newurl`),
  KEY `rank` (`rank`),
  KEY `oldurl` (`oldurl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_shlib_consumers`
--

DROP TABLE IF EXISTS `wlje4_shlib_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_shlib_consumers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL DEFAULT '',
  `context` varchar(50) NOT NULL DEFAULT '',
  `min_version` varchar(20) NOT NULL DEFAULT '0',
  `max_version` varchar(20) NOT NULL DEFAULT '0',
  `refuse_versions` varchar(255) NOT NULL DEFAULT '',
  `accept_versions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_context` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_shlib_resources`
--

DROP TABLE IF EXISTS `wlje4_shlib_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_shlib_resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL DEFAULT '',
  `current_version` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_resource` (`resource`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_activities_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_activities_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_activities_segmentation` (
  `activity_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3741 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_albums_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_albums_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_albums_segmentation` (
  `album_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_config`
--

DROP TABLE IF EXISTS `wlje4_sociala_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_config` (
  `name` varchar(64) NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_connection_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_connection_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_connection_segmentation` (
  `connection_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`connection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5423 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_event_cr_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_event_cr_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_event_cr_segmentation` (
  `event_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_event_memb_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_event_memb_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_event_memb_segmentation` (
  `event_member_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`event_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_event_st_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_event_st_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_event_st_segmentation` (
  `event_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_group_cr_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_group_cr_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_group_cr_segmentation` (
  `group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_history_actions`
--

DROP TABLE IF EXISTS `wlje4_sociala_history_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_history_actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `seg_table_id` int(11) unsigned NOT NULL,
  `action` char(1) NOT NULL,
  `action_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_photos_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_photos_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_photos_segmentation` (
  `photo_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_report_params`
--

DROP TABLE IF EXISTS `wlje4_sociala_report_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_report_params` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `param` varchar(16) NOT NULL,
  `param_query` text NOT NULL,
  `param_values` text NOT NULL,
  `param_clause` text NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_report_queries`
--

DROP TABLE IF EXISTS `wlje4_sociala_report_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_report_queries` (
  `queries_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_query` text NOT NULL,
  `report_query_params` tinyint(4) NOT NULL,
  `header_query` text NOT NULL,
  `header_query_params` tinyint(4) NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`queries_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_report_query_params`
--

DROP TABLE IF EXISTS `wlje4_sociala_report_query_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_report_query_params` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) unsigned NOT NULL,
  `query_id` int(11) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  `query_param` varchar(16) NOT NULL,
  `query_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_report_types`
--

DROP TABLE IF EXISTS `wlje4_sociala_report_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_report_types` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` char(1) NOT NULL,
  `default_report` char(2) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `report_type_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_reports`
--

DROP TABLE IF EXISTS `wlje4_sociala_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_reports` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) unsigned NOT NULL,
  `report_type` int(11) unsigned NOT NULL,
  `report_layout` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` char(2) NOT NULL,
  `queries_id` int(11) unsigned NOT NULL,
  `time_segmented` tinyint(4) NOT NULL DEFAULT '1',
  `comparison` tinyint(4) NOT NULL DEFAULT '0',
  `graph_columns` varchar(64) NOT NULL,
  `table_columns` varchar(64) NOT NULL,
  `non_currency_table_cols` varchar(64) NOT NULL,
  `header_columns` varchar(64) NOT NULL,
  `non_currency_header_cols` varchar(64) NOT NULL,
  `header_colors` varchar(254) NOT NULL,
  `additional_params` varchar(254) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `report_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_segmentation_tables`
--

DROP TABLE IF EXISTS `wlje4_sociala_segmentation_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_segmentation_tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(16) NOT NULL,
  `former_table_name` varchar(32) NOT NULL,
  `id_field` varchar(16) NOT NULL,
  `former_id_field` varchar(32) NOT NULL,
  `former_date_field` varchar(32) NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_user_login_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_user_login_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_user_login_segmentation` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3700 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_user_post_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_user_post_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_user_post_segmentation` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3673 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_user_reg_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_user_reg_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_user_reg_segmentation` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3700 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_videos_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_videos_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_videos_segmentation` (
  `video_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sociala_wall_segmentation`
--

DROP TABLE IF EXISTS `wlje4_sociala_wall_segmentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sociala_wall_segmentation` (
  `wall_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdate` date NOT NULL,
  `cdate_t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cdate_u` int(11) NOT NULL,
  `cweek_n` int(4) unsigned NOT NULL,
  `cweek_y` int(4) unsigned NOT NULL,
  `cweek_t` char(7) NOT NULL,
  `cweek` varchar(7) NOT NULL,
  `cmonth_n` int(4) unsigned NOT NULL,
  `cmonth_t` char(7) NOT NULL,
  `cmonth` varchar(16) NOT NULL,
  `cyear` int(4) unsigned NOT NULL,
  `source` char(1) NOT NULL,
  PRIMARY KEY (`wall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_spmedia`
--

DROP TABLE IF EXISTS `wlje4_spmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_spmedia` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  `caption` varchar(2048) NOT NULL,
  `description` mediumtext NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'image',
  `extension` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sppagebuilder`
--

DROP TABLE IF EXISTS `wlje4_sppagebuilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sppagebuilder` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `published` tinyint(3) NOT NULL DEFAULT '1',
  `catid` int(10) NOT NULL DEFAULT '0',
  `access` int(10) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` bigint(20) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` bigint(20) NOT NULL DEFAULT '0',
  `og_title` varchar(255) NOT NULL,
  `og_image` varchar(255) NOT NULL,
  `og_description` varchar(255) NOT NULL,
  `page_layout` varchar(55) DEFAULT NULL,
  `language` char(7) NOT NULL,
  `hits` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sptransfer_log`
--

DROP TABLE IF EXISTS `wlje4_sptransfer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sptransfer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tables_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__sptransfer_tables',
  `note` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0',
  `destination_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1323 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_sptransfer_tables`
--

DROP TABLE IF EXISTS `wlje4_sptransfer_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_sptransfer_tables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Name of the extension''s table',
  `category` int(11) unsigned DEFAULT NULL COMMENT 'Parent id category',
  PRIMARY KEY (`id`),
  UNIQUE KEY `extension_name` (`extension_name`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_tagmeta_rules`
--

DROP TABLE IF EXISTS `wlje4_tagmeta_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_tagmeta_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `case_sensitive` tinyint(1) NOT NULL DEFAULT '1',
  `request_only` tinyint(1) NOT NULL DEFAULT '1',
  `decode_url` tinyint(1) NOT NULL DEFAULT '1',
  `last_rule` tinyint(1) NOT NULL DEFAULT '1',
  `placeholders` text NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `rights` varchar(255) DEFAULT NULL,
  `xreference` varchar(255) DEFAULT NULL,
  `canonical` varchar(255) DEFAULT NULL,
  `rindex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=No,1=Yes,2=Skip',
  `rfollow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=No,1=Yes,2=Skip',
  `rsnippet` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0=No,1=Yes,2=Skip',
  `rarchive` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0=No,1=Yes,2=Skip',
  `rodp` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0=No,1=Yes,2=Skip',
  `rimageindex` tinyint(1) NOT NULL DEFAULT '2' COMMENT '0=No,1=Yes,2=Skip',
  `comment` varchar(255) DEFAULT NULL,
  `synonyms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes,2=Yes (case sensitive)',
  `synonmax` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of synonyms to add',
  `synonweight` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Use ordering,1=Use weight',
  `preserve_title` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `last_visit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idxurl` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_tagmeta_synonyms`
--

DROP TABLE IF EXISTS `wlje4_tagmeta_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_tagmeta_synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(500) NOT NULL DEFAULT '',
  `synonyms` varchar(500) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `last_visit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_tags`
--

DROP TABLE IF EXISTS `wlje4_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0',
  `lft` int(11) DEFAULT '0',
  `rgt` int(11) DEFAULT '0',
  `level` int(10) unsigned DEFAULT '0',
  `path` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `note` varchar(255) DEFAULT '',
  `description` mediumtext,
  `published` tinyint(1) DEFAULT '0',
  `checked_out` int(11) unsigned DEFAULT '0',
  `checked_out_time` datetime DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned DEFAULT '0',
  `params` text,
  `metadesc` varchar(1024) DEFAULT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) DEFAULT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) DEFAULT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned DEFAULT '0',
  `created_time` datetime DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) DEFAULT '',
  `modified_user_id` int(10) unsigned DEFAULT '0',
  `modified_time` datetime DEFAULT '0000-00-00 00:00:00',
  `images` text,
  `urls` text,
  `hits` int(10) unsigned DEFAULT '0',
  `language` char(7) DEFAULT NULL,
  `version` int(10) unsigned DEFAULT '1',
  `publish_up` datetime DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_template_styles`
--

DROP TABLE IF EXISTS `wlje4_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_termsofservice_terms`
--

DROP TABLE IF EXISTS `wlje4_termsofservice_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_termsofservice_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acllist` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `term` text NOT NULL,
  `created` datetime NOT NULL,
  `published` tinyint(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_ucm_base`
--

DROP TABLE IF EXISTS `wlje4_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_ucm_content`
--

DROP TABLE IF EXISTS `wlje4_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_ucm_history`
--

DROP TABLE IF EXISTS `wlje4_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1532 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_update_categories`
--

DROP TABLE IF EXISTS `wlje4_update_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_update_sites`
--

DROP TABLE IF EXISTS `wlje4_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_update_sites_extensions`
--

DROP TABLE IF EXISTS `wlje4_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_updates`
--

DROP TABLE IF EXISTS `wlje4_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_user_keys`
--

DROP TABLE IF EXISTS `wlje4_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12543 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_user_notes`
--

DROP TABLE IF EXISTS `wlje4_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_user_profiles`
--

DROP TABLE IF EXISTS `wlje4_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_user_usergroup_map`
--

DROP TABLE IF EXISTS `wlje4_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  `concat_usergroup` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_user_usergroupid_match_planid`
--

DROP TABLE IF EXISTS `wlje4_user_usergroupid_match_planid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_user_usergroupid_match_planid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `module_key` varchar(50) DEFAULT NULL,
  `usergroupid` varchar(50) DEFAULT NULL,
  `usergroupname` varchar(70) DEFAULT NULL,
  `Column1` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_usergroups`
--

DROP TABLE IF EXISTS `wlje4_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_users`
--

DROP TABLE IF EXISTS `wlje4_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '2001-01-01 01:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0',
  `otpKey` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `otep` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `contactrecordtype` varchar(20) DEFAULT NULL,
  `salesforceID` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `accountID` varchar(20) DEFAULT '001d000001HhH4lAAF',
  `schoolID` varchar(45) DEFAULT NULL,
  `districtID` varchar(45) DEFAULT NULL,
  `lc_user_status` varchar(45) DEFAULT 'Teacher',
  `cohort` varchar(45) DEFAULT NULL,
  `cohort_start_year` varchar(45) DEFAULT NULL,
  `j1_term` varchar(45) DEFAULT NULL,
  `j1_placed_subject` varchar(255) DEFAULT NULL,
  `j1_staff_record` varchar(255) DEFAULT NULL,
  `j1_subtype` varchar(255) DEFAULT NULL,
  `secondary_email` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `process_lab_role` varchar(45) DEFAULT 'Learner',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=50282 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER afterLeadInsert AFTER INSERT ON wlje4_users FOR EACH ROW INSERT INTO lead_audit VALUES (
  NEW.id,
  SUBSTRING_INDEX(NEW.name,' ',1),
  SUBSTRING_INDEX(NEW.name,' ',-1),
  NEW.username,
  NEW.email,
  NEW.email,
  NEW.registerDate,
  NEW.lastvisitDate
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER afterLeadUpdate AFTER UPDATE ON wlje4_users FOR EACH ROW INSERT INTO lead_audit VALUES (
  NEW.id,
  SUBSTRING_INDEX(NEW.name,' ',1),
  SUBSTRING_INDEX(NEW.name,' ',-1),
  NEW.username,
  NEW.email,
  NEW.email,
  NEW.registerDate,
  NEW.lastvisitDate
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wlje4_users_lti_test`
--

DROP TABLE IF EXISTS `wlje4_users_lti_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_users_lti_test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '2001-01-01 01:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0',
  `otpKey` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `otep` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `contactrecordtype` varchar(20) DEFAULT NULL,
  `salesforceID` varchar(20) DEFAULT NULL,
  `accountID` varchar(20) DEFAULT NULL,
  `match_thisone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_users_vif_testing`
--

DROP TABLE IF EXISTS `wlje4_users_vif_testing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_users_vif_testing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(87) DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  `sendEmail` int(11) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` int(11) DEFAULT NULL,
  `params` varchar(50) DEFAULT NULL,
  `lastResetTime` varchar(50) DEFAULT NULL,
  `resetCount` int(11) DEFAULT NULL,
  `requireReset` int(11) DEFAULT NULL,
  `otpKey` varchar(50) DEFAULT NULL,
  `otep` varchar(50) DEFAULT NULL,
  `contactrecordtype` varchar(50) DEFAULT NULL,
  `salesforceID` varchar(50) DEFAULT NULL,
  `accountID` varchar(50) DEFAULT NULL,
  `schoolID` varchar(50) DEFAULT NULL,
  `districtID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_users_vifonly`
--

DROP TABLE IF EXISTS `wlje4_users_vifonly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_users_vifonly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(57) DEFAULT NULL,
  `username` varchar(65) DEFAULT NULL,
  `email` varchar(66) DEFAULT NULL,
  `password` varchar(95) DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  `sendEmail` int(11) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(50) DEFAULT NULL,
  `params` varchar(165) DEFAULT NULL,
  `lastResetTime` varchar(50) DEFAULT NULL,
  `resetCount` int(11) DEFAULT NULL,
  `otpKey` varchar(50) DEFAULT NULL,
  `otep` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5286 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_viewlevels`
--

DROP TABLE IF EXISTS `wlje4_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_vif_couponcode_school`
--

DROP TABLE IF EXISTS `wlje4_vif_couponcode_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_vif_couponcode_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sf_id` varchar(50) NOT NULL COMMENT ' Possible use to help facilitate the updates from SF',
  `coupon_code` varchar(100) NOT NULL,
  `school_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sf_id_idx` (`sf_id`),
  KEY `coupon_code` (`coupon_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4510 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_vif_salesforce_exclusion_list`
--

DROP TABLE IF EXISTS `wlje4_vif_salesforce_exclusion_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_vif_salesforce_exclusion_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(68) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_vif_salesforce_sync_queue`
--

DROP TABLE IF EXISTS `wlje4_vif_salesforce_sync_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_vif_salesforce_sync_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `sync_ready` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' 1 = need to sync, 0 = already processed',
  `last_updated` datetime DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_id` (`record_id`),
  KEY `sync_ready_idx` (`sync_ready`)
) ENGINE=InnoDB AUTO_INCREMENT=1597 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_vif_sync_configs`
--

DROP TABLE IF EXISTS `wlje4_vif_sync_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_vif_sync_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(50) NOT NULL,
  `prod_config_value` varchar(100) NOT NULL,
  `dev_config_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `config_name_idx` (`config_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_weblinks`
--

DROP TABLE IF EXISTS `wlje4_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_wf_profiles`
--

DROP TABLE IF EXISTS `wlje4_wf_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_wf_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `users` text NOT NULL,
  `types` text NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `device` varchar(255) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_widgetkit`
--

DROP TABLE IF EXISTS `wlje4_widgetkit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_widgetkit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_aclrules`
--

DROP TABLE IF EXISTS `wlje4_xipt_aclrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_aclrules` (
  `id` int(31) NOT NULL AUTO_INCREMENT,
  `rulename` varchar(250) NOT NULL,
  `aclname` varchar(128) NOT NULL,
  `coreparams` text NOT NULL,
  `aclparams` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_aec`
--

DROP TABLE IF EXISTS `wlje4_xipt_aec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_aec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planid` int(11) NOT NULL,
  `profiletype` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_applications`
--

DROP TABLE IF EXISTS `wlje4_xipt_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_applications` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `applicationid` int(10) NOT NULL DEFAULT '0',
  `profiletype` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_jstoolbar`
--

DROP TABLE IF EXISTS `wlje4_xipt_jstoolbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_jstoolbar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `menuid` int(10) NOT NULL DEFAULT '0',
  `profiletype` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_profilefields`
--

DROP TABLE IF EXISTS `wlje4_xipt_profilefields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_profilefields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fid` int(10) NOT NULL DEFAULT '0',
  `pid` int(10) NOT NULL DEFAULT '0',
  `category` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_profiletypes`
--

DROP TABLE IF EXISTS `wlje4_xipt_profiletypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_profiletypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ordering` int(10) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `tip` text NOT NULL,
  `privacy` text NOT NULL,
  `template` varchar(50) NOT NULL DEFAULT 'default',
  `jusertype` varchar(50) NOT NULL DEFAULT 'Registered',
  `avatar` varchar(250) NOT NULL DEFAULT 'components/com_community/assets/default.jpg',
  `approve` tinyint(1) NOT NULL DEFAULT '0',
  `allowt` tinyint(1) NOT NULL DEFAULT '0',
  `group` text NOT NULL,
  `watermark` varchar(250) NOT NULL,
  `params` text NOT NULL,
  `watermarkparams` text NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `config` text NOT NULL,
  `coverimage` varchar(255) DEFAULT NULL COMMENT 'store cover image stuff',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_settings`
--

DROP TABLE IF EXISTS `wlje4_xipt_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_settings` (
  `name` varchar(250) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wlje4_xipt_users`
--

DROP TABLE IF EXISTS `wlje4_xipt_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlje4_xipt_users` (
  `userid` int(11) NOT NULL,
  `profiletype` int(10) NOT NULL DEFAULT '0',
  `template` varchar(80) NOT NULL DEFAULT 'NOT_DEFINED',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-29 12:11:10
