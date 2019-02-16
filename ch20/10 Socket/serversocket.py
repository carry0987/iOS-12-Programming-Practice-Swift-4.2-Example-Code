#-*- coding: utf-8 -*-
import socket, threading

# 設定 port number
PORT = 12345

class OneClient (threading.Thread):
    # 初始化
    def __init__(self, conn, addr):
        threading.Thread.__init__(self)

        self._conn = conn
        self._addr = addr
   
    # 送資料出去     
    def send(self, data):
        try:    
            self._conn.sendall(data)
        except socket.error as msg:
            self.close()
    
    # 關閉 socket 連線    
    def close(self):
        self._conn.close()
        print 'Disconnected by', self._addr

    # 此執行續負責接收資料
    def run(self):
        while True:
            data = self._conn.recv(1024)
            if not data:
                self.close()
                break
             
            # 如果收到 byebye 字串，就關閉連線   
            if data.startswith('byebye'):
                self.close()
                break                

            # 原封不動再傳回給 client 端
            print data
            self.send('[echo] ' + data)

# 開啟 socket            
s = socket.socket()
s.bind(('', PORT))
# 開始監聽，並且設定最大等待連線數為 5
s.listen(5)
print '開始監聽 ' + str(PORT)

while True:
    conn, addr = s.accept()
    print 'Connected by', addr
    OneClient(conn, addr).start()
