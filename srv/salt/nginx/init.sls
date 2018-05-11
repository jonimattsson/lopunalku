nginx:
  pkg.installed

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf

/var/www/html/index.php:
  file.managed:
    - source: salt://nginx/default-index.php
    - require:
      - pkg: nginx

/var/www/html/index.hmtl:
  file:
    - absent
    - require:
      - pkg: nginx
 
/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/default

nginxservice:
  service.running:
    - name: nginx
    - watch:
      - file: /etc/nginx/sites-available/default
      - file: /etc/nginx/nginx.conf      
