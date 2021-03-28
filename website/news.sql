-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2020 at 07:15 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(10) NOT NULL,
  `news_title` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `news_perex` text COLLATE utf8_unicode_ci NOT NULL,
  `news_text` text COLLATE utf8_unicode_ci NOT NULL,
  `news_source` varchar(120) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `news_perex`, `news_text`, `news_source`) VALUES
(1, 'Spor Babiše a Adámka může ohrozit dotace pro Zlín, ve hře je stadion i kino', 'Rozepře mezi náměstkem zlínského primátora Miroslavem Adámke', 'Když začátkem února přijel do Zlína premiér Andrej Babiš, zastavil se v opraveném Památníku Tomáše Bati i na nedalekém zimním stadionu, který chce město zrekonstruovat za více než 400 milionů korun.„Premiér byl pozorný. Myslím, že ho naše prezentace zaujala,“ říká Radomír Zbožínek, viceprezident hokejového klubu a předseda představenstva spolku HC Berani Zlín, který stadion vlastní. „Představili jsme mu vizualizace a základní parametry: zahájení na jaře 2022, náklady 434 milionů korun bez DPH,“ upřesnil.', 'https://www.idnes.cz/zlin/zpravy/babis-adamek-zlin-dotace-batuv-pamatnik-spor-dopady.A200221_534450_zlin-zpravy_ras'),
(2, 'Významné valašské trasy získají spojnici, cykloturistiku víc podpoří i kraj', 'Zlínský kraj čeká další cykloturistický boom. V jihových', 'Úsek možná vypadá nenápadně, ale pro cyklistickou mapu Zlínského kraje jde o jedno z nejdůležitějších rozšíření za poslední dobu. Nejde jen o to, že jde o stomilionovou akci, která nabídne mimořádně atraktivní projížďku valašskou krajinou podél řeky Senice. Jde o propojení dvou rozsáhlých tras nadregionálního významu.„Po lávce přes Bečvu v Ústí se napojíme až na cyklostezku Bečva, která pokrývá rozsáhlé území na Valašsku. Po úsecích, které připravujeme, odtud budou moct cyklisté cestovat na Slovensko,“ potvrdil Josef Daněk, starosta Valašské Polanky a předseda Mikroregionu Hornolidečsko. Právě obce z tohoto sdružení se už dlouhé roky zabývají částí cyklostezky Bečva–Vlára–Váh (Bevlava) vedoucí z Ústí u Vsetína přes Valašské Klobouky a Brumov-Bylnici až na slovenské hranice. Povedlo se jim získat dotace, vykoupit pozemky a nyní je čekají stavební práce.', 'https://www.idnes.cz/zlin/zpravy/bystrice-pod-hostynem-chvalcov-cyklostezka-cyklopoint.A200212_532526_zlin-zpravy_ras'),
(3, 'Plocha v centru Valašského Meziříčí leží roky ladem, město hledá využití', 'Z místa sice už zmizely dřevěné budky a travnaté plochy jsou částečně upravené.', '„Před dvaceti lety zde město plánovalo společný projekt se společností CTP. Ten se nakonec nezrealizoval a od té doby se toho moc nezměnilo. Pro mě osobně je to poslední nevyřešený historický delikt našeho města,“ podotkl starosta Robert Stržínek.Ve hře jsou celkem tři varianty. CTP nabízí prodej svých pozemků radnici, za zhruba 3 500 metrů čtverečních žádá 36,5 milionu korun. To se však městu zdá jako velmi vysoká částka, byť dříve radnice od firmy získala téměř 9 milionů korun na nájmu.', 'https://www.idnes.cz/zlin/zpravy/valasske-mezirici-masarykova-sverakova-ulice-proluka-vyuziti.A200219_533957_zlin-zpravy'),
(4, 'Skateparky nabírají na popularitě, města do nich dávají miliony', 'Nový skatepark nedávno představily Luhačovice a stavět chtějí i další města. Tato sportoviště jsou stále populárnější a už neplatí, že by sdružovala jen úzkou komunitu.', 'Ve městě proto koncem loňského roku otevřeli novou plochu plnou ramp, skokánků a překážek. Hřiště se speciálním povrchem v Zahradní čtvrti stálo 2,5 milionu korun, splňuje vše potřebné a uspokojí začátečníky i zkušenější vyznavače skateboardingu. „Těší mě to hlavně kvůli dětem, protože od nich šla iniciativa a takové hřiště jich ocení celá řada,“ poznamenala Jolana Kozubíková, která se kvůli skateparku už dříve obrátila na zastupitele. Investice do budování či modernizace skateparků jsou trendem v celé zemi. Zatímco dříve platilo, že tato místa jsou spíše opomenutá a překážky si svépomocí upravují skupinky mladých, v dnešní době se o tento typ sportovišť radnice zajímají mnohem více.', 'https://www.idnes.cz/zlin/zpravy/skateparky-stavba-luhacovice-roznov-uherske-hradiste-zlin.A200217_533498_zlin-zpravy_ra'),
(5, 'Napajedelsko oživí přírodní stezky, podobně rozsáhlý projekt v Česku není', 'Výjimečnou síť tras, které budou sloužit místním i turistům, chystají letos Napajedla na Zlínsku a osm okolních obcí.', '„Půjde většinou o zaužívané polní cesty a pěšiny. Jen v některých případech je potřeba je vyčistit či upravit,“ přiblížil napajedelský místostarosta Zbyněk Ohnoutek, který se na projektu podílí. Záměr je, aby stezky byly co nejschůdnější, nenáročné a některé byly vhodné i pro rodiny s kočárky. Zároveň se budou vyhýbat silničním tahům.', 'https://www.idnes.cz/zlin/zpravy/stezka-napajedelskych-emiratu-znaceni-trasy.A200213_532748_zlin-zpravy_ras'),
(6, 'Zlín řeší další zkratku mezi domy, plánuje jednosměrku v části Vršava', 'Ve Zlíně se schyluje k další změně dopravního značení. Tentokrát radnice na žádost občanů nespokojených s nárůstem dopravy plánuje udělat z oboustranně průjezdné silnice ve Vršavě jednosměrku.', 'V okrajové části Zlína se naplnily obavy zdejších obyvatel, že po rozšíření hromadné dopravy do Kostelce a Štípy, kvůli němuž přibyly na přilehlé hlavní cestě semafory, si tudy budou někteří řidiči krátit cestu. Nespokojení občané se obrátili na radnici, která jim chce vyjít vstříc a pracuje na zjednosměrnění části ulice Vršava I. „Doprava je hustší a ráno je to docela nepříjemné. Budeme rádi, když z cesty bude jednosměrka ve směru od centra,“ popsal jeden z obyvatel Vršavy.', 'https://www.idnes.cz/zlin/zpravy/zlin-vrsava-ulice-jednosmerka-doprava.A200217_533502_zlin-zpravy_ras'),
(7, 'Zloděj si spletl svědka vykrádání trafiky s kumpánem a podal mu lup', '„Vezmi tu krabici.“ S těmito slovy podával v noci na Uherskohradišťsku zloděj dírou ve zdi trafiky cigarety domnělému parťákovi.', 'Vloupání se odehrálo v noci z pátku na sobotu v obci Pitín. Tam se totiž zlodějům zalíbil novinový stánek. „Ze zadní strany vytvořili do stěny malou díru, kterou se jeden z nich protáhl dovnitř. Zatímco druhý komplic hlídal venku, naházel do igelitového pytle všechny tabákové výrobky, které mu přišly pod ruku,“ uvedla policejní mluvčí Simona Kyšnerová. Zloděj uviděl také krabici s kartony cigaret. Tu chtěl podat dírou ven svému kumpánovi. Ten ale mezitím zaslechl nějaký hluk a z místa utekl.', 'https://www.idnes.cz/zlin/zpravy/zlodeji-stanek-trafika-pitin-prekvapeni-dopadeni.A200217_140717_zlin-zpravy_ras');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
