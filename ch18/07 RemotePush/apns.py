#-*- coding: utf-8 -*-
import socket, ssl, json, struct, binascii

# 開發用
host = ('gateway.sandbox.push.apple.com', 2195)
# 產品用
#host = ('gateway.push.apple.com', 2195)

# 換成正確的 token
token = '641fdf0bd0862da1fa6489c16898b312782398246543631148765b6523daed12'
# 換成正確的金鑰檔名與路徑
key = './key.pem'

# payload
payload = {
  "aps" : {
    "alert" : "Your message here",
    "sound" : "default",
    "badge" : 2
  }
}

#### 以下程式碼不需更改
data = json.dumps(payload)
byteToken = binascii.unhexlify(token)
format = '!BH32sH%ds' % len(data)
noti = struct.pack(format, 0, 32, byteToken, len(data), data)

ssl_sock = ssl.wrap_socket(socket.socket(), certfile = key)
ssl_sock.connect(host)
ssl_sock.write(noti)
ssl_sock.close()