require 'socket'
require 'json'

server = TCPServer.open(2000)
puts "Server starting..."
loop {
	client = server.accept
	request = client.read_nonblock(256)
	req_header, req_body = request.split("\r\n\r\n", 2)

	path = req_header.split[1][1..-1]
	method = req_header.split[0]

	if File.exist?(path)
		resp_body = File.read(path)
		client.puts "HTTP/1.0 200 OK\r\nContent-Type: text/html\r\nContent-Length: #{resp_body.size}\r\n\r\n"
		if method == "GET"
			client.puts resp_body
		elsif method == "POST"
			params = JSON.parse(req_body)
			user_data = "<li>Name: #{params['person']['name']}</li><li>Email: #{params['person']['email']}</li>"
			client.puts resp_body.gsub('<%= yield %>', user_data)
		end
	else
		client.puts "HTTP/1.0 404 File not found\r\n\r\n"
	end
	client.close
}