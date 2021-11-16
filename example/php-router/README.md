Instruktioner
================

För att få igång det i miljön behöver vi ändra på Apache's konfigurationsfil för att få använda .htaccess där under &lt;Directory&gt;.

### Dockerfile

```
# Installera Apache och php

RUN a2enmod rewrite
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Starta Apache
```
