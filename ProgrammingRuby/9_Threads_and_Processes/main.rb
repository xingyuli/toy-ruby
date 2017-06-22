require 'net/http'

pages = %w( www.baidu.com www.awl.com www.oschina.net )

threads = []

for page in pages
  threads << Thread.new(page) { |myPage|
    h = Net::HTTP.new(myPage, 80)
    puts "Fetching: #{myPage}"
    resp, data = h.get('/', nil)
    puts "Got #{myPage}: #{resp.code} #{resp.message}"
  }
end

threads.each { |aThread| aThread.join }

count = 0
arr = []
10.times do |i|
  arr[i] = Thread.new {
    sleep(rand(0) / 10.0)
    Thread.current["myCount"] = count
    count += 1
  }
end
arr.each { |t| t.join; print t["myCount"], ", " }
puts "count = #{count}"

threads = []
Thread.abort_on_exception = true
6.times { |i|
  threads << Thread.new(i) {
    raise "Boom!" if i == 3
    puts i
  }
}
threads.each { |t| t.join }
