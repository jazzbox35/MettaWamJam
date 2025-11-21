import requests

url = "http://localhost:5000/metta"
headers = {"Content-Type": "text/plain"}
data = "!(let $a (is fun!) (cons-atom MeTTa $a))"

response = requests.post(url, headers=headers, data=data)

print("Status:", response.status_code)
print("Response:", response.text)
print("type:", type(response.text))
