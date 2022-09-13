
# Allgemeine Konfiguration
DOMAIN=test.domain.com
LETSENCRYPTEMAIL=domainmail.maildomain.com


# Zugangsdaten FTP Server (Backup)
FTP_URL=ftp.domain.com
FTP_USER=ftp_user
FTP_PASS=ftp_pass


# Landingpage
REDIRECT_ACTIVE=1
REDIRECT_URL=www.google.de


#Shell in a Box
SHELL_SUBDOMAIN=shell
SHELL_USER=siab_user
SHELL_PASS=siab_pass


# OnlyOffice
OFFICE_SUBDOMAIN=office


# High Performance Signaling Server / Coturn
COTURN_SUBDOMAIN=coturn
COTURN_BACKEND1=https://nextcloud.example.com



# Please do not edit anything below!!!!

# Keys - OnlyOffice
OFFICE_SECRET="office11111"

# Keys - High Performance Signaling Server / Coturn
SIGNALING_STATIC_SECRET="signaling11111"
SIGNALING_HASHKEY="signaling22222"
SIGNALING_BLOCKKEY="signaling33333"
NEXTCLOUD_SHARED_SECRET1="signaling44444"
NEXTCLOUD_API_KEY="signaling55555"

# Farben
NC='\033[0m'       # Text Reset
RED='\033[0;31m'   # Red
GRE='\033[0;32m'   # Green
YEL='\033[0;33m'   # Yellow
BLU='\033[0;34m'   # Blue
PUR='\033[0;35m'   # Purple
CYA='\033[0;36m'   # Cyan
WHI='\033[0;37m'   # White
