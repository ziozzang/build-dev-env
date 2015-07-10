# listening port or port with binding ip , destination
export PORT_PROXY_LISTS="80,localhost:8080|127.0.0.1:82,www.naver.com:80"
wget -qO- https://raw.githubusercontent.com/ziozzang/port-proxy/master/src/install.sh | bash
