# https://man7.org/linux/man-pages/man5/firejail-profile.5.html
# Ativa o modo de rastreamento, que registra todas as chamadas de sistema (syscalls)
tracelog

# Bloqueia o acesso à rede
dns 9.9.9.9

# impede execucao em superuser
noroot

# Não permite o uso de capacidades adicionais do kernel
caps.drop all

# Impede a obtenção de novos privilégios
nonewprivs

# Desabilita o uso de dispositivos de armazenamento removíveis
nodvd
noinput
nou2f


# Bloqueia o acesso ao sistema de arquivos raiz
blacklist /boot
blacklist /root
blacklist /sbin
blacklist /srv
blacklist /var

# Torna diretórios críticos somente leitura (caso necessário)
read-only /bin
read-only /var/lib
read-only /lib
read-only /lib64
read-only /opt
read-only /usr
read-only /etc
read-only /sys
