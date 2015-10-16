require 'socket'
require 'json'

host = 'localhost'
port = 2000

input = ''
puts "What type of request do you want to send, GET or POST?"
params = Hash.new { |hash, key| hash[key] = Hash.new }

input = gets.chomp
until input == "GET" || input == "POST"
	puts "What type of request do you want to send, GET or POST?"
	input = gets.chomp
end

if input.upcase == "GET"
	request = "GET /index.html HTTP/1.0\r\n\r\n"
elsif input.upcase == "POST"
	puts "What is your name?"
	name = gets.chomp
	puts "What is your email?"
	email = gets.chomp
	params[:person][:name] = name
	params[:person][:email] = email
	request_body = params.to_json
	request_header = "POST /thanks.html HTTP/1.0\r\nContent-Length: #{request_body.size}\r\n\r\n"
	request = request_header + request_body
end

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read


header, body = response.split("\r\n\r\n", 2)
print header + body