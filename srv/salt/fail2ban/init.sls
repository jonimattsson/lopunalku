fail2ban:
  pkg.installed

/etc/fail2ban/jail.local:
  file.managed:
    - source: salt://fail2ban/jail.local

/etc/fail2ban/filter.d/nginx-http-auth.conf:
  file.managed:
    - source: salt://fail2ban/nginx-http-auth.conf

/etc/fail2ban/filter.d/nginx-badbots.conf:
  file.managed:
    - source: salt://fail2ban/nginx-badbots.conf

/etc/fail2ban/filter.d/nginx-noproxy.conf:
  file.managed:
    - source: salt://fail2ban/nginx-noproxy.conf

fail2banservice:
  service.running:
    - name: fail2ban
    - watch:
      - file: /etc/fail2ban/jail.local
      - file: /etc/fail2ban/filter.d/nginx-http-auth.conf
      - file: /etc/fail2ban/filter.d/nginx-badbots.conf
      - file: /etc/fail2ban/filter.d/nginx-noproxy.conf
