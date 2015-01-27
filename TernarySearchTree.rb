class TSTNode
	attr_accessor :size
	attr_accessor :c
	attr_accessor :val
	attr_accessor :left
	attr_accessor :mid
	attr_accessor :right
end

class TernarySearchTree
	attr_accessor :root
	attr_accessor :size
	
	def initialize
		@root = nil
		@size = 0
	end
	
	def isEmpty?
		return @size == 0
	end
	
	def size
		return @size
	end
	
	def put(key, val)
		@root = put_recur(@root, key, val, 0);
	end
	
	def put_recur(x, key, val, cur)
		c = key[cur]
		if !x then
			x = TSTNode.new
			x.c = key[cur]
		end
		if (c < x.c) then 					x.left = put_recur(x.left, key, val, cur)
		elsif (c > x.c) then 				x.right = put_recur(x.right, key, val, cur)
		elsif (cur < key.size - 1) then		x.mid = put_recur(x.mid, key, val, cur+1)
		else
			if x.val then @size+=1 end
			x.val = val
		end
		return x
	end
	
	def get(key)
		x = get_recur(@root, key, 0)
		if !x then return x end
		return x.val
	end
	
	def get_recur(x, key, cur)
		if !x then return x end
		c = key[cur]
		if (c < x.c) then					return get_recur(x.left, key, cur)
		elsif (c > x.c) then 				return get_recur(x.right, key, cur)
		elsif (cur < key.size - 1) then		return get_recur(x.mid, key, cur+1)
		else 								return x end
	end
	
	def contains?(key)
		return !get(key)
	end
	
	def remove(key)
		stack = []
		getPath(@root, key, 0, stack)
		cur = stack.pop
		if !cur then return cur end
		res = cur.val
		cur.val = nil
		@size -= 1
		if cur.mid then return res end
		while (stack.size > 0 && cur)
			cur.mid = nil
			cur = stack.pop
		end
		return res
	end
	
	def getPath(x, key, cur, stack)
		stack.push(x)
		if !x then return end
		c = key[cur]
		if (c < x.c) then					getPath(x.left, key, cur, stack)
		elsif (c > x.c)	then				getPath(x.right, key, cur, stack)
		elsif (cur < key.size - 1) then	getPath(x.mid, key, cur+1, stack) end
	end
	
	def each
		keys = []
		vals = []
		str = String.new("")
		fill(@root, keys, vals, str, ' ', false)
		while (keys.size > 0)
			yield(keys.pop, vals.pop)
		end
	end
	
	def fill(x, keys, vals, str, last, mid)
		if !x then return end
		if mid then str<<last end
		if x.val then
			keys.push(str+x.c)
			vals.push(x.val)
		end
		fill(x.left, keys, vals, str, x.c, false)
		fill(x.right, keys, vals, str, x.c, false)
		fill(x.mid, keys, vals, str, x.c, true)
		if mid then str.chop! end
	end
	
	def toString
		self.each{|k, v| print "#{k} --> #{v}\n"}
	end
	
end