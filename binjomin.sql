-- phpMyAdmin SQL Dump
-- version 4.7.0-rc1
-- https://www.phpmyadmin.net/
--
-- Host: morpheus.tarhelykeszito.hu
-- Generation Time: Mar 14, 2017 at 10:27 AM
-- Server version: 5.5.52-0+deb8u1
-- PHP Version: 5.6.24-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binjomin`
--

-- --------------------------------------------------------

--
-- Table structure for table `chovato_comments`
--

CREATE TABLE `chovato_comments` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `ticket` bigint(11) UNSIGNED NOT NULL,
  `user` bigint(11) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL,
  `text` text NOT NULL,
  `closing` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chovato_comments`
--

INSERT INTO `chovato_comments` (`id`, `ticket`, `user`, `datetime`, `text`, `closing`) VALUES
(1, 1, 1, '2017-03-02 22:51:51', 'uu', 0),
(2, 1, 1, '2017-03-02 22:54:44', 'még egy,\r\nami több soros\r\n\r\nis', 0),
(3, 1, 1, '2017-03-02 22:54:52', 'majd markdown-t adjunk hozzá', 0),
(4, 2, 1, '2017-03-02 22:55:14', 'Most már szépen lehet kommentelgetni.', 0),
(5, 2, 1, '2017-03-02 22:55:19', 'Többet, gyorsan.', 0),
(6, 2, 1, '2017-03-02 22:55:32', 'Egyel?re csak én írom, de majd kelleni fog felhasználó, meg némi formázás.', 0),
(7, 2, 1, '2017-03-02 22:55:52', 'Az már tiszta élvezet ahhoz képest, ami a formok gyártása. Meg persze a magyar ékezetek.', 0),
(8, 2, 1, '2017-03-02 22:56:58', 'Reméljük, most már m?ködni fog.', 0),
(9, 2, 1, '2017-03-02 22:57:07', '???', 0),
(10, 2, 1, '2017-03-02 22:57:47', '?', 0),
(11, 2, 1, '2017-03-02 22:58:46', '?', 0),
(12, 2, 1, '2017-03-02 22:59:03', '', 0),
(13, 2, 1, '2017-03-02 22:59:06', '', 0),
(14, 2, 1, '2017-03-02 22:59:22', '?', 0),
(15, 2, 1, '2017-03-02 23:00:13', '?', 0),
(16, 2, 1, '2017-03-02 23:00:16', '?', 0),
(17, 3, 1, '2017-03-02 23:04:45', 'Ez az!', 0),
(18, 3, 1, '2017-03-02 23:04:57', 'Egyetértek! ?????', 0),
(19, 5, 1, '2017-03-02 23:06:15', 'Hoppá! Sikerült beillesztenie a hosszú ?-t! Kommentbe nem megy, így viszont igen? Hogyhogy?', 0),
(20, 6, 1, '2017-03-02 23:07:26', 'Annyira érdekes, hogy le sem bírok feküdni.', 0),
(21, 4, 1, '2017-03-02 23:12:16', 'Egyszer?: drag & drop ráhúzás a ticket-re. És nem is kell a formjában.', 0),
(22, 10, 1, '2017-03-04 23:39:14', 'teszt1', 0),
(23, 10, 1, '2017-03-04 23:39:18', 'teszt2', 0),
(24, 10, 1, '2017-03-04 23:39:23', 'teszt3, lezárás.', 0),
(25, 10, 1, '2017-03-04 23:39:30', 'na, jó, akkor most', 1),
(26, 7, 1, '2017-03-04 23:51:54', 'M?ködik.', 1),
(27, 6, 1, '2017-03-04 23:52:17', 'Örülök neki, de most már nem kell ide.', 1),
(28, 12, 1, '2017-03-04 23:52:49', 'Elolvastam. Azt írja, hogy értsen a világi tudományokhoz. Nem minden kommentálója örül neki.', 1),
(29, 1, 1, '2017-03-04 23:53:12', 'Jó, most már úgysem ez a releváns, hanem egyesével minden dalt végigvenni, alaposan.', 1),
(30, 13, 1, '2017-03-04 23:54:22', 'Úgy t?nik, textareából nem, sima inputból átmegy. Egyébként enélkül tudjuk élni az életünket.', 0),
(31, 4, 1, '2017-03-04 23:55:58', 'Javaslat: https://jqueryui.com/droppable/#photo-manager', 0),
(32, 4, 1, '2017-03-05 00:27:19', 'A stylesheet-et némileg befolyásolta, de talán ez nem a világ vége.\r\nAzt már tudja, hogy ráhúzza, észrevegye, és itt írja is, hogy hogyan kell beazonosítani, hogy mit húzott rá:\r\n\r\nhttp://stackoverflow.com/questions/2975091/jquery-droppable-get-the-element-dropped\r\n\r\nAmi még hiányzik: rendesen írja ki arra, amire applikálva van (jelenleg csak a lezárt zenei Ne tégy-re), és ha ráhúzza, AJAX-ból csinálja meg, és azonnal írja ki. (A revert JS-b?l már megy szépen most is.)', 0),
(33, 3, 1, '2017-03-05 00:34:45', 'OK, a Markdown _elvileg_ már megy.\r\n\r\n**Nagyon remélem!**', 0),
(34, 3, 1, '2017-03-05 00:35:08', 'Szupi! Akkor próbáljunk 1-2 felsorolást:\r\n\r\n- egyik\r\n- másik\r\n- harmadik\r\n\r\n1. egy\r\n1. két\r\n1. hár', 0),
(35, 5, 1, '2017-03-05 00:40:31', 'Ld. még #16-os ticket ugyanitt.', 0),
(36, 15, 1, '2017-03-05 00:40:52', 'Lehetséges forrásai?', 0),
(37, 5, 1, '2017-03-05 00:46:24', 'Legyen egyel?re: legfelül a legújabb.', 0),
(38, 8, 1, '2017-03-05 00:51:19', 'Emlékeztet?ül: ingoláról.', 0),
(39, 3, 1, '2017-03-05 00:51:38', 'Kommenteket CSS-ezni: egyszer? és szép fejlesztés lenne.', 0),
(40, 14, 1, '2017-03-05 00:55:19', 'Kulcskérdésem jelenleg: hogyan lehet úgy JOIN-olni, hogy ha nincs párja, akkor is kiírjon, Null-t? (Vagy ezt érdemesebb, vagy inkább egyesével újabb lekérdezéseket futtatni? Lehet, hogy a mi méreteinknél egyszer?bb így. Tesztje könny?: keressünk rá a nagyságrendre neten.)\r\n\r\nTipikus példa: ticket-hez a kommentjei, ticket-hez a tag-jei.', 0),
(41, 3, 1, '2017-03-05 00:55:56', 'Markdown: szép, hogy van PHP processzor, de Githubhoz hasonló JS-toolbar sem lenne rossz.', 0),
(42, 14, 1, '2017-03-05 00:58:52', 'http://stackoverflow.com/questions/1067016/join-queries-vs-multiple-queries\r\n\r\nhttp://dba.stackexchange.com/questions/42998/are-individual-queries-faster-than-joins', 0),
(43, 14, 1, '2017-03-05 01:00:55', 'OK, talán lehet egyel?re egyesével, és reméljük, nem halmozunk fel annyi munkát, hogy szükség lesz rá.\r\n\r\nElvileg azonban meg kellene tudni az igazságot, hogy hogyan van mód Null-os JOIN létrehozására.', 0),
(44, 14, 1, '2017-03-05 01:01:54', 'OK, úgy t?nik, hogy csak meg kell fordítani:\r\n\r\nhttp://stackoverflow.com/questions/3709229/left-join-return-null-even-if-there-are-no-rows', 0),
(45, 14, 1, '2017-03-05 01:12:04', 'Még egy ok az egyedi SELECT mellett: a functions.php nem tesz különbséget a projekt-alapú és a Dashboard nézet között. (Miért, az utóbbiba nem kellene, hogy látszódjanak a tag-ek? De!)', 0),
(46, 14, 1, '2017-03-05 01:12:45', 'Viszont processzálni is nehezebb úgy, hogy kiválasztja az összeset. Els? körb?l mindenképpen inkább nehezítés ez.', 0),
(47, 4, 1, '2017-03-05 01:22:12', 'AJAX ezt adja vissza: a ticket teljes megjelenítend? tartalma, a kész függvényeink alapján.', 0),
(48, 4, 1, '2017-03-05 01:34:53', 'Szuperül megy a Drag & Drop. Most már csak törlési funkció kellene.', 0),
(49, 4, 1, '2017-03-05 07:02:12', 'Jelenjen meg a Tag sz?résnél az adott tag.', 0),
(50, 7, 1, '2017-03-05 07:02:48', 'Újra megnyitása?', 0),
(51, 18, 1, '2017-03-06 21:49:35', 'Megvan.', 1),
(52, 15, 1, '2017-03-06 21:50:01', 'Inkább: 1 dolgot rendesen befejezni. A mostani cheszed-projektem a zenélés. Talán erre kellene koncentrálni?', 0),
(53, 11, 1, '2017-03-06 22:50:46', 'Teend? holnapra:\r\n-Verse akusztikus kíséret\r\n-Elektromos dallam\r\n-Esetleg egy ének', 0),
(54, 14, 1, '2017-03-07 10:32:16', '„Lezárt” ikon mellé is kerüljön számláló, ami környezetfügg?.', 0),
(55, 23, 1, '2017-03-07 10:39:12', 'Jevámot: jes ziká.', 0),
(56, 23, 1, '2017-03-07 10:40:37', 'Chezkát hábátin (BB 41a): chád jomá. (Miért elég néha egyetlen napról tanúkat szerezni, ha általában 3 év szokott lenni.)', 0),
(57, 23, 1, '2017-03-07 10:44:39', 'Mátne ál másekátuv bátorá (BB, 2. kötet, 43. fejezet).', 0),
(58, 24, 1, '2017-03-07 21:22:18', 'Annyit kell adni, hogy felt?n? legyen a szegénynek is, ne gondolhassa, hogy normális adomány. Ha több ennél, akkor a többletet szabad máászerb?l leírni.\r\n\r\nTovábbá szükséges, hogy Purim napközben élvezze a szegény, ezért a sajátjainknak problémás az átadás.', 1),
(59, 5, 1, '2017-03-07 21:22:51', '', 1),
(60, 13, 1, '2017-03-08 10:58:23', 'Érdekes, phpMyAdmin-ból szerkesztve is hibát ad!', 0),
(61, 23, 1, '2017-03-08 21:42:28', 'Umán én lo cházáká, talán benne van. Érdekessége, hogy Rámbám Toén VeNitán 9:1-ben azt mondja: „din ze pele beénáj”.', 0),
(62, 2, 1, '2017-03-10 10:59:46', 'Lezárom, mert teleszemeteltem a kommentjeit, és törlés funkciót még nem írtam. Újranyitottam másik számmal.', 1),
(63, 29, 1, '2017-03-10 11:00:25', 'R. Keletivel készült interjúk külön kiemelt fejezetbe.', 0),
(64, 15, 1, '2017-03-10 11:01:07', 'Egyel?re lezárom. A következ? ticket ugyanitt „Ima meditációk”, abban él tovább, meg a zenében.', 1),
(65, 30, 1, '2017-03-10 11:02:55', 'Mai téma: gedolé Jiszráél. Áchdut. Nem lennénk mefuzár (Purim), ha rájuk hallgatnánk. Az ? érdemükben nem vagyunk azok. Mindnyájan felnézük rájuk és büszkék vagyunk rájuk. És megvalósul a málchut sámájim, mindig, amikor a nem zsidók is felnéznek rájuk.', 0),
(66, 4, 1, '2017-03-10 11:03:20', 'M?ködik.', 1),
(67, 19, 1, '2017-03-10 11:06:06', 'M?ködik.', 0),
(68, 19, 1, '2017-03-10 11:06:08', '', 1),
(69, 31, 1, '2017-03-10 11:06:41', 'A binjomin.hu-n egyel?re nincsen phpmyadmin, els? körb?l azt lehetne tenni fel.', 0),
(70, 31, 1, '2017-03-10 11:22:30', 'OK, fent van, pma könyvtárban. Nincs privilege, prefixelni kell a db-t.', 0),
(71, 31, 1, '2017-03-10 11:23:40', 'Nem tud ilyet a mysqli könyvtár, érdekes.', 0),
(72, 31, 1, '2017-03-10 11:36:43', 'Úgy néz ki, hogy megy alapvet?en.', 0),
(73, 31, 1, '2017-03-10 11:37:45', 'j', 0),
(74, 31, 1, '2017-03-10 11:37:47', '', 0),
(75, 31, 1, '2017-03-10 11:38:00', '', 0),
(76, 32, 1, '2017-03-10 11:40:49', 'g', 0),
(77, 32, 1, '2017-03-10 11:40:51', 'g', 0),
(78, 32, 1, '2017-03-10 11:40:52', '', 1),
(79, 33, 1, '2017-03-10 11:41:35', 'j', 0),
(80, 33, 1, '2017-03-10 11:43:33', 'j', 0),
(81, 33, 1, '2017-03-10 11:45:12', 'ez az', 0),
(82, 33, 1, '2017-03-10 11:45:29', 'm?Ködik, lezárom.', 1),
(83, 31, 1, '2017-03-10 11:51:00', 'Megy! Megjöttem!', 0),
(84, 31, 1, '2017-03-10 11:51:04', 'M?ködik.', 0),
(85, 31, 1, '2017-03-10 11:51:08', '', 1),
(86, 31, 1, '2017-03-10 11:52:29', 'Akkor most már csak itt megy. Belépésnél ne feledkezzünk meg az y-ról.', 0),
(87, 14, 1, '2017-03-10 12:48:48', 'Projektek / tagek látványterve: (X/Y), ahol X a nyitottak, Y a lezártak száma.', 0),
(88, 8, 1, '2017-03-10 12:49:14', 'Itt egy egyszer?bb:\r\n\r\nwget-alapú, mint egy ls. Miket lehessen kérdezni t?le: projektek, projekteken belüli ticketek, ticketeken belüli kommentek. Feltölteni ne lehessen rá, de nem is szükséges egyel?re a kis gépen. Például: lstxt.php?op=proj&id=5. wget -qO-, egyb?l. Egyel?re nem túl feltörhet?, mert mit is kezdenének vele mások? Kis biztonság lehetne: mindig legyen egy közös jelszavuk, amit az els? csere után megváltoztatnak. Szóval minden query kezd?dhet a köv. új jelszóval, és akkor mindkét oldalon tárolódik 1-1 jelszó. Egyszer? esetben ez lehet a user mellé írva (feltéve, hogy csak egy helyr?l böngészik, ami egyébként nem igaz, ha van 1 laptopja és 1 telefonja).', 0),
(89, 24, 1, '2017-03-10 12:50:00', 'Várjunk csak, most a markdown a kommentben nem m?ködik?\r\n\r\nKellene neki...\r\n\r\n- Egyik\r\n- Másik\r\n- **Harmadik**', 0),
(90, 5, 1, '2017-03-10 12:51:09', 'Újból meg kellene nyitni: függjön a legújabb módosítástól, kommentt?l. Kell hozzá egy új mez?. (Lehetne a legújabb komment is a ticketen kívülr?l látható.)', 0),
(91, 34, 1, '2017-03-10 12:57:18', 'most megy vajon?', 0),
(92, 34, 1, '2017-03-10 12:57:23', 'becsuk...', 1),
(93, 34, 1, '2017-03-10 12:57:30', 'újra nyit...', 1),
(94, 34, 1, '2017-03-10 12:57:35', 'megint csuk', 1),
(95, 34, 1, '2017-03-10 12:57:39', 'ez semmi', 0),
(96, 34, 1, '2017-03-10 12:57:50', 'és most kinyit', 1),
(97, 34, 1, '2017-03-10 12:58:03', 'ez jó, most megy, csak a checkboxot javítom még', 0),
(98, 34, 1, '2017-03-10 12:58:08', '', 1),
(99, 34, 1, '2017-03-10 12:59:19', '', 1),
(100, 34, 1, '2017-03-10 12:59:52', '', 1),
(101, 34, 1, '2017-03-10 12:59:54', '', 1),
(102, 34, 1, '2017-03-10 12:59:58', '', 1),
(103, 5, 1, '2017-03-10 13:00:10', '', 1),
(104, 18, 1, '2017-03-10 13:00:50', '', 1),
(105, 16, 1, '2017-03-10 13:03:10', 'Inkább: http://binjomin.hu/chovato/tickets.php?id=5', 1),
(106, 8, 1, '2017-03-10 13:13:01', 'Alapvet?en megvan lstxt.php.', 0),
(107, 37, 1, '2017-03-13 20:03:23', 'Ardour alatt nem m?ködnek a VST-k.\r\n\r\nÉrdekes módon az LMMS is azt írja ki, hogy ismeretlen ok miatt nem tudja betölteni, hiába megígérték, hogy kipróbálták.', 0),
(108, 36, 1, '2017-03-13 20:03:30', '', 1),
(109, 35, 1, '2017-03-13 20:03:40', '', 1),
(110, 18, 1, '2017-03-13 20:03:46', '', 1),
(111, 17, 1, '2017-03-13 20:03:51', '', 1),
(112, 30, 1, '2017-03-13 20:06:19', 'Királyság. Ros Hásáná. Amikor az Örökkévaló lesz a Király. Minden másképpen fog m?ködni. Fantasztikus lesz, óriási világosság. Több megértés, kevesebb szenvedés, alázat és odafigyelés. Az imában kett?t tehetek: kérhetem, hogy jöjjön el, és mikrokozmoszban megvalósíthatom, lélekben ott lehetek.', 0),
(113, 30, 1, '2017-03-13 20:06:26', 'Rohanó világ. Chovot Hálevávot siur. Hogy szerette az esti hitbodedutokat! Akkor még nem volt technológiai ártalom. Ma R. Feuer kéri a cházánáját, hogy dávke ne várja meg, mert szegény híveinek tájnéi lennének ellene. Imádkozzunk, hogy mi se rohanjuk, hogy ráérezhessünk, és másoknak is megmutathassuk, hogyan kell nem-rohanni. Mekkora dolog lenne! Mennyire hiányzik a mai korból! Mekkorát változtatna rajta!', 0);

-- --------------------------------------------------------

--
-- Table structure for table `chovato_projects`
--

CREATE TABLE `chovato_projects` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(63) NOT NULL,
  `description` text NOT NULL,
  `created` datetime NOT NULL,
  `color` varchar(11) NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chovato_projects`
--

INSERT INTO `chovato_projects` (`id`, `name`, `description`, `created`, `color`, `closed`) VALUES
(1, 'Zene', '', '2017-03-01 22:01:00', 'ff9c33', 0),
(2, 'Weboldal', '', '2017-03-01 22:01:00', '599cec', 0),
(3, 'Halacha', '', '2017-03-01 22:02:08', '59eca0', 0),
(4, 'Könyv', '', '2017-03-01 22:02:08', '9f3ea0', 0),
(5, 'Chovato', '', '2017-03-01 22:02:49', '6cb09f', 0),
(6, 'Háztartás', '', '2017-03-01 22:02:49', 'f75f7d', 0),
(7, 'Ávodá', 'Járni a Meszilát Jesárimon.', '2017-03-05 00:37:53', '5CFF5C', 0),
(8, 'Szugja', 'Miket szeretnénk kidolgozni. Halacha, Gemárá.', '2017-03-07 10:29:38', 'CFC9FF', 0),
(9, 'teszt', 'migr', '2017-03-10 11:40:37', '36FFF8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chovato_tags`
--

CREATE TABLE `chovato_tags` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `project` bigint(11) UNSIGNED NOT NULL,
  `tag` varchar(63) NOT NULL,
  `color` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chovato_tags`
--

INSERT INTO `chovato_tags` (`id`, `project`, `tag`, `color`) VALUES
(5, 2, 'Írás', 'A2FF38'),
(7, 1, 'Ne tégy', 'FF3819'),
(8, 1, 'Nem akarom tudni', 'FFFF0F'),
(9, 1, 'Kicsinek lenni jó', '6B66FF'),
(10, 1, 'Purimi dal', 'E2D1FF'),
(11, 5, 'Nehéz', '38FFA9'),
(12, 5, 'Könny?', '2164FF'),
(13, 1, 'Something is burning', '29FF45'),
(14, 5, 'Mihamarabb', 'FF0A0A'),
(15, 6, 'Költeni', 'FFFF69');

-- --------------------------------------------------------

--
-- Table structure for table `chovato_tickets`
--

CREATE TABLE `chovato_tickets` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `project` bigint(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `owner` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(127) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `open` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chovato_tickets`
--

INSERT INTO `chovato_tickets` (`id`, `project`, `created`, `updated`, `owner`, `name`, `description`, `open`) VALUES
(1, 1, '2017-03-01 22:15:02', '2017-03-01 22:15:02', 1, 'Ne tégy – gitárkíséret', '', 0),
(2, 2, '2017-03-01 22:15:02', '2017-03-01 22:15:02', 1, 'Új Élet cikkek felvitele', '', 0),
(3, 5, '2017-03-02 23:04:36', '2017-03-02 23:04:36', 1, 'Szebb', 'Legyen sokkal szebb.', 1),
(4, 5, '2017-03-02 23:05:33', '2017-03-02 23:05:33', 1, 'Tag-ek applikálása', '', 0),
(5, 5, '2017-03-02 23:05:52', '2017-03-02 23:05:52', 1, 'Ticket-ek időrendje mi legyen?', '', 1),
(6, 5, '2017-03-02 23:06:44', '2017-03-02 23:06:44', 1, 'Mázl tov! Szépen fut!', 'Misenichnász Ádár, márbim beszimchá.', 0),
(7, 5, '2017-03-02 23:07:02', '2017-03-02 23:07:02', 1, 'Ticket-ek lezárása', 'És a lezártak külön böngészési lehet?sége.', 0),
(8, 5, '2017-03-02 23:08:11', '2017-03-02 23:08:11', 1, 'Text alapú support', 'Specifikáció ld. Ocár #320.', 1),
(9, 3, '2017-03-02 23:10:53', '2017-03-02 23:10:53', 1, 'Kidusin biával bizmán háze', 'Átem édáj vs. én ádám osze beiláto beilát zenut (pl. Ketuvot 73a. Ott amúgy csak Rási érti ezt így, Rámbám máris nem. Még: Jevámot 107a, Gitin 81b). Akkor most kell ahhoz a tanú vagy sem? Szerintem nem, hanem más a baj azzal: hogy nem paszkenolunk R. Meir szerint, és m?ködne, ha kávánázna. Mégsem szokunk valamiért erre támaszkodni. R. Keleti szerint lo tihje kedésá probléma is lehet vele.', 1),
(10, 1, '2017-03-02 23:11:26', '2017-03-02 23:11:26', 1, 'Zenei blog', 'Binjomin.blog.hu. Zenei blog. Képpel kommunikáljuk a koncepciót. A webes médiában sokkal otthonosabban mozgok mint a zeneiben. A Music Habits könyvb?l az jött ki (bár explicit nem mondta), hogy kezd?ként nem az album az els? cél, hanem a folyamatos publikus, dalonkénti improvement. És az, hogy rendszeresen csináljunk „szijumot”. A médiához vizualizmus is kell, egy id? után megkérdezhetjük Tausz Gábort vagy Abrahamovicsot (Belz).', 0),
(11, 1, '2017-03-02 23:11:40', '2017-03-02 23:11:40', 1, 'Befejezni, kitalálni: Something', '', 1),
(12, 3, '2017-03-03 13:42:13', '2017-03-03 13:42:13', 1, 'Rámbám szerint a Szánhedrin tagja', 'Hilchot Meláchimban. R. Kahn siurjában említi, hogy R. Lichtenstein éppen ilyen ember volt. Olvassuk el.', 0),
(13, 5, '2017-03-04 23:54:01', '2017-03-04 23:54:01', 1, 'Magyar ékezetek: ő, ű – kezelése', 'Sajnos a kommentben nagyon gyenge. Viszont volt, ahol m?ködött! Azzal hasonlítsuk össze.', 1),
(14, 5, '2017-03-05 00:24:24', '2017-03-05 00:24:24', 1, 'Mindenféle COUNT, GROUP BY, és JOIN', 'SQL-hez kell érteni hozzá. Kommentek száma a ticket-ekhez, tag-ekhez a releváns ticket-ek száma.', 1),
(15, 7, '2017-03-05 00:38:30', '2017-03-05 00:38:30', 1, 'Ima-30', 'R. Feuer „Rámbán levele” könyvéhez hasonlóan egy havi cházerolásra írt gy?jtemény korábbi jegyzeteim alapján. Chizuk bátefilá.', 0),
(16, 5, '2017-03-05 00:40:14', '2017-03-05 00:40:14', 1, 'Prioritizálás', 'Talán a Stack Overflow-hoz hasonló módon lenne jó. Sorrendet állítani, hogy mit tartok éppen fontosnak. De lehet, hogy semmi szükség rá, hanem a tag-ek alapján kellene.', 0),
(17, 6, '2017-03-05 00:45:57', '2017-03-05 00:45:57', 1, 'Szelektív szemetet szelektálni', '', 0),
(18, 6, '2017-03-05 00:46:06', '2017-03-05 00:46:06', 1, 'Mosogatni', '', 0),
(19, 5, '2017-03-05 01:03:07', '2017-03-05 01:03:07', 1, 'Projekten belüli tooltip', 'Apróság, de zavaró, hogy ha ráhúzom, miért írja ki projects.php is. (Lehet, hogy annyira megszokjuk a színeket, hogy végül az index.php-ban sem fog kelleni.)', 0),
(20, 3, '2017-03-06 21:47:43', '2017-03-06 21:47:43', 1, 'Meggyleves', 'Szeudá közben kap áldást?', 1),
(21, 3, '2017-03-06 21:47:56', '2017-03-06 21:47:56', 1, 'Áser jácár szeudá közben', 'Utána vassolunk áldással?', 1),
(22, 8, '2017-03-07 10:30:10', '2017-03-07 10:30:10', 1, 'Gyümölcsök áldásai', 'Szisztematikusan összegy?jteni és rendszerezni az összes fontos szabályt, elvet.', 1),
(23, 8, '2017-03-07 10:34:55', '2017-03-07 10:34:55', 1, 'Valami a „Biuré Szugjot” könyvből', 'Smulik ajánlotta. R. Honigsberg. Sajnos nincs mindenre: Bécá, Szuká, Peszáchim, Nedárim, Kidusin, Sábát, Bává Bátrá, sibudos témák. Talán a Kidusin lehetne érdekes.', 1),
(24, 3, '2017-03-07 10:51:03', '2017-03-07 10:51:03', 1, 'Mátánot leEvjonim', 'http://halachipedia.com/index.php?title=Matanot_LeEvyonim\r\n\r\nLegjobb az étel, de pénzt is lehet. Korábban akkor, ha a sliách vállalja, hogy aznap adja. Nekik is adhatunk:\r\n\r\n* Szabó Mihály\r\n* Ligeti László\r\n* R. Mansour is küld\r\n\r\nMinimum mértéke: 3 kebécányi kenyér (Cházon Is szerint 1 kebécá 100 cm^3, de 1 kg-nyi ár megfelel?). R. Mansour honlapján $20 áll, ami 5000 Ft.', 0),
(25, 8, '2017-03-08 10:55:31', '2017-03-08 10:55:31', 1, 'Idegen vallások és filozófiák', 'Mennyire tilos ?ket tanulmányozni és miért? Szerintem nekem van erre indíttatásom, talán nem jécer hárá. Szeretném kristálytisztán megérteni, hogy miért a miénk a legjobb. Az átlagosnál er?sebb bels? igényem van erre.  A keresztény hitvita nagyon meger?sítette az emunámat, lehet, hogy ki kellene általánosítani.', 1),
(26, 6, '2017-03-08 21:42:58', '2017-03-08 21:42:58', 1, 'Satnézőt hívni', '', 1),
(27, 6, '2017-03-08 21:43:08', '2017-03-08 21:43:08', 1, 'Máászer pénzek', '', 1),
(28, 2, '2017-03-10 10:59:22', '2017-03-10 10:59:22', 1, 'Új Élet cikkek felvitele', 'A weboldalra, er?s kapcsolatban a könyvvel.', 1),
(29, 4, '2017-03-10 11:00:12', '2017-03-10 11:00:12', 1, 'Új Élet és Forrás cikkekből egy Best Of Eddig antológia', '', 1),
(30, 7, '2017-03-10 11:01:35', '2017-03-10 11:01:35', 1, 'Ima meditációk', 'Mindig ima el?tt átgondolni egy témát. R. Keleti Peszách-hitchádsut cikke nyomán.', 1),
(31, 5, '2017-03-10 11:03:58', '2017-03-10 11:03:58', 1, 'Migrálás ingolára', 'Egyel?re. Vagy binjomin.hu-ra.', 0),
(32, 9, '2017-03-10 11:40:46', '2017-03-10 11:40:46', 1, 'tes1', '2', 0),
(33, 9, '2017-03-10 11:41:01', '2017-03-10 11:41:01', 1, 'nu', 'nu', 0),
(34, 5, '2017-03-10 11:52:52', '2017-03-10 11:52:52', 1, 'Ticket újbóli megnyitása', 'Nagyon könny? lenne, mondjuk use case még nem volt egyel?re.', 0),
(35, 6, '2017-03-10 13:01:07', '2017-03-10 13:01:07', 1, 'Dirsu vizsga + ford.', '', 0),
(36, 6, '2017-03-10 13:01:14', '2017-03-10 13:01:14', 1, 'Ráv Keleti interjú', '', 0),
(37, 6, '2017-03-10 13:02:31', '2017-03-10 13:02:31', 1, 'LMMS VirtualBox', 'Igazából azon vagyok VST ügyben elakadva, hogy a csoportos mozgatás m?ködik-e a régi verzióban. Ha igen, akkor örömmel downgrade-elném. VST-re láttam a m?köd?k között rakarrack jelleg?t (CamelCrusher), ami nagyban megkönnyítené a színezési feladataimat.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chovato_ticket_tags`
--

CREATE TABLE `chovato_ticket_tags` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `ticket` bigint(11) UNSIGNED NOT NULL,
  `tag` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chovato_ticket_tags`
--

INSERT INTO `chovato_ticket_tags` (`id`, `ticket`, `tag`) VALUES
(6, 13, 14),
(7, 11, 13),
(8, 19, 12),
(9, 14, 14),
(10, 26, 15),
(11, 27, 15),
(12, 31, 12),
(13, 34, 12),
(14, 5, 14),
(15, 5, 12),
(16, 8, 14),
(17, 13, 11);

-- --------------------------------------------------------

--
-- Table structure for table `chovato_users`
--

CREATE TABLE `chovato_users` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(63) NOT NULL,
  `description` text NOT NULL,
  `password` varchar(127) NOT NULL,
  `email` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chovato_users`
--

INSERT INTO `chovato_users` (`id`, `name`, `description`, `password`, `email`) VALUES
(1, 'binyomin', '', '*7AA9E049137958E59EEB6936F429BA3EA7B629F0', 'szvbinjomin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `chovato_user_rights`
--

CREATE TABLE `chovato_user_rights` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `user` bigint(11) UNSIGNED NOT NULL,
  `project_ticket` bigint(11) UNSIGNED NOT NULL,
  `type` enum('project','ticket') NOT NULL DEFAULT 'project'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chovato_user_rights`
--

INSERT INTO `chovato_user_rights` (`id`, `user`, `project_ticket`, `type`) VALUES
(1, 1, 1, 'project'),
(2, 1, 2, 'project'),
(3, 1, 3, 'project'),
(4, 1, 4, 'project'),
(5, 1, 5, 'project'),
(6, 1, 6, 'project');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chovato_comments`
--
ALTER TABLE `chovato_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chovato_projects`
--
ALTER TABLE `chovato_projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_2` (`name`);

--
-- Indexes for table `chovato_tags`
--
ALTER TABLE `chovato_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chovato_tickets`
--
ALTER TABLE `chovato_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chovato_ticket_tags`
--
ALTER TABLE `chovato_ticket_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chovato_users`
--
ALTER TABLE `chovato_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chovato_user_rights`
--
ALTER TABLE `chovato_user_rights`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chovato_comments`
--
ALTER TABLE `chovato_comments`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT for table `chovato_projects`
--
ALTER TABLE `chovato_projects`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `chovato_tags`
--
ALTER TABLE `chovato_tags`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `chovato_tickets`
--
ALTER TABLE `chovato_tickets`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `chovato_ticket_tags`
--
ALTER TABLE `chovato_ticket_tags`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `chovato_users`
--
ALTER TABLE `chovato_users`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `chovato_user_rights`
--
ALTER TABLE `chovato_user_rights`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
