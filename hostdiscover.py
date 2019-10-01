import scapy.all as scapy
import argparse

def scan(ip):
    arp_request = scapy.ARP(pdst=ip)
    broadcast = scapy.Ether(dst="FF:FF:FF:FF:FF:FF:FF:FF")

arp_request_broadcast = broadcast/arp_request_broadcast
answered_list = scapy.srp(arp_request_broadcast, timeout=1, verbose=False) [0]
clients_list = []
for element in answered_list:
    client_dict = {"ip": element[1].psrc, "mac": element[1].hwsrc}
    clienst_list.append(client_dict)
    return clients_list

def print_result(results_list):
    print("IP\t\t\tMAC Address")
    print("+------------------------------------------------------+")
    for client in results_list:
        print(client["ip"] + "\t\t" + client["mac"])

def get_arguments():
    parser= argparse.ArgumentParser()
    parser.add_argument("-t", "--target", dest="target", help="Target IP/IP Range")
    options = parser.parse_args()
    return options
