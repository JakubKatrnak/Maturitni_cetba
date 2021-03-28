****************************************************************************
NÁVOD NA INSTALACI
----------------------------------------------------------------------------
Stažení souborů:
    Stáhněte si zazipovanou složku „codeigniterdb.zip“.
    Celý archiv extrahujte do složky vašeho webového serveru případně složky, kde se nachází vaše localhost projekty.
----------------------------------------------------------------------------
Nastavení:
    V souboru „...\applications\config\config.php“ upravte na řádku 27 hodnotu proměnné „$config[‘base_url‘]“ na vaši doménu případně složku v localhostu.
    Př.: 
    $config['base_url'] = 'https://www.vase-domena.cz/';
    o	V případě localhostu: 
    $config['base_url'] = 'https://localhost/vas-nazev-slozky-s-projektem';
----------------------------------------------------------------------------
Nastavení databáze:
    Na adrese localhost/phpMyAdmin vytvořte databázi s názvem 'news'
        Pokud si vytvoříte databázi s jiným názvem, budete muset změnit hodnotu proměnné v souboru „...\applications\config\database.php“ na řádku 81 'database' = 'nazev_vasi_databaze'
    V horním menu klikněte na záložku 'import'
    Klikněte na tlačítko 'Procházet'
    Vyberte soubor news.sql a klikněte na tlačítko 'Proveď' v levém dolním rohu
    V souboru „...\applications\config\database.php“ změnte hodnoty proměnných (pokud je nutné) na řádcích 77 - 96
****************************************************************************
