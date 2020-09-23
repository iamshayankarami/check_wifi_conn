import sys
def get_ip_address():
    input_format = sys.argv[1:] 
    r=' '.join([text for text in input_format])
    return r[r.find('192.168.1'):r.find('192.168.1')+11]

print(get_ip_address())
