Projekt im gewünschten Ordner klonen

Ins Verzeichnis wechseln 

Unerlaubte Zeichen entfernen.

include.sh Datei im Variablenteil anpassen

Menü aufrufen

Beispiel:

git clone https://github.com/buerodigital/VServer /opt/VServer
cd /opt/VServer
sed -i 's/\r//' *
nano /opt/VServer/include.sh
bash /opt/VServer/start.sh

