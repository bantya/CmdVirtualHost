# 💻 CmdVirtualHost
Create Apache virtual host using command line for Laragon.

### ⬇ Installation:

Download the raw `apvh.bat` file [from here](https://raw.githubusercontent.com/bantya/CmdVirtualHost/master/apvh.bat) and add it to the system path.

### 📝 Before use:
Change the SSL files directory `on line 9` according to yours.

i.e. `set SSL_PATH=F:/laragon/etc/ssl/` -> `set SSL_PATH=Your/Laragon/installation/path/etc/ssl/`

### 🔨 Usage:

Open the Terminal and cd into the directory where all your virtual hosts are stored. (for me: `F:\laragon\etc\apache2\sites-enabled`)

`apvh {sitename} {directory} {ssl}`

### ⚙ Where:

1. sitename: Sitename containing the .domain name.
2. directory: The full (absolute) path to the site directory.
3. ssl: Use `ssl` to have the virtual host for SSL else empty.

### 🧠 Remember:

1. The site directory name must not contain trailing slahes (\ or /).
2. This script assumes that you have added the virtual host entry to hosts (`C:\Windows\System32\drivers\etc`) file and in `alt_names` section in the openssl template file (for me: `F:\laragon\usr\tpl\openssl.conf.tpl`)

### 📃 Acronyms:

1. apvh === Apache virtual host.
2. India == Indians never delay in anything.

#### 😊 Happy coding!

🙏
