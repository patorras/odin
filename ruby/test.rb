
def request_http(&on_complete)


  on_complete.call
end

request_http { puts "Done!" }
