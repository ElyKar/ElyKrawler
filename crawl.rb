class Vertex
	attr_accessor :id
	attr_accessor :links
	attr_accessor :marked
	
	def initialize(v)
		@id = v
		@links = 0
	end
end

class Edge
	attr_accessor :from
	attr_accessor :to
	
	def initialize(v, w)
		@from = v
		@to = w
	end
end

require 		 "net//http"
require_relative "Queue.rb"
require_relative "TernarySearchTree.rb"
require_relative "gexf.rb"

entries = ARGV[0]
$_NMAX = ARGV[1].to_i
puts $_NMAX
$_V = 0
edges = {}
q = Queue.new
tree = TernarySearchTree.new

File.open(entries, "r") {|f|
	f.each {|url|
		q.enqueue(url)
		v = Vertex.new($_V)
		$_V+=1
		tree.put(url, v)
	}
	f.close
}
puts q.size
while ((!q.isEmpty?) && $_V < $_NMAX)
	site = q.dequeue
	v = tree.get(site)
	if (!v.marked) then
		v.marked = true
		edges[v.id] = []
		url = URI.parse(site)
		req = Net::HTTP::Get.new(url.to_s)
		begin
			res = Net::HTTP.start(url.host, url.port) {|http|
				http.request(req)
			}
		rescue
		end
		res.body.scan(/https?:\/\/[[\w]+.]+[\/[\w]+\/]*/).each {|match| #complément :[\/[\w]+\/]*
			if (match !~ /facebook|youtube|linkedin|google|github|twitter|reddit|\.edu|wiki/) then
				w = tree.get(match)
					if !w then
						w = Vertex.new($_V)
						$_V+=1
						tree.put(match, w)
						if ($_V%100==0) then puts $_V end
					end
				if (!edges[v.id].include?(w.id)) then edges[v.id].push(w.id) end
				v.links+=1
				q.enqueue(match)
			end
		}
	end
end


g = Gexf.new("E:\\Tristan\\Ruby\\output.gexf")
g.header
tree.each{|url, line|
	g.node(url, line)
}
g.swap
edges.each{|v, array|
	array.each{|w|
		g.edge(Edge.new(v, w))
	}
}
g.foot
g.close