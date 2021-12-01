import socket
import threading

def get_server_messages_handler(client_socket):
    def read_sok():
        print("Start listening server")
        while True:
            data = client_socket.recv(1024)
            print(data.decode('utf-8'))
    
    return read_sok


if __name__ == "__main__":
    server = '127.0.0.1', 5050  # Данные сервера
    alias = input() # Вводим наш псевдоним
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    client_socket.bind(('', 0)) # Задаем сокет как клиент
    client_socket.sendto((alias + ' connects to server').encode('utf-8'), server)# Уведомляем сервер о подключении
    potok = threading.Thread(target = get_server_messages_handler(client_socket))
    potok.start()
    while True:
        print("Send message: ")
        mensahe = input()
        client_socket.sendto(('[' + alias + '] ' + mensahe).encode('utf-8'), server)