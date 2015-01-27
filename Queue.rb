class Queue
	attr_accessor :size
	attr_accessor :tab
	
	def initialize
		@tab = []
		@size = 0
	end
	
	def isEmpty?
		return @size == 0
	end
	
	def enqueue(x)
		@tab.push(x)
		@size+=1
	end
	
	def dequeue
		@size-=1
		return @tab.shift
	end
	
	def size 
		return @size
	end
	
	def toString
		i = 0
		printf "Queue : %d elements  -->   " %[self.size]
		@tab.each {|val| print "#{val}  "}
		print "\n"
	end
	
	def each
		@tab.each {|val| yield(val)}
	end
	
end