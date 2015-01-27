class Gexf
	attr_accessor :f
	attr_accessor :E

	def initialize(name)
		if !(@f = File.open(name, "w+")) then
			raise(IOError, "Impossible de creer le fichier")
		end
		@E = 0
	end
	
	def header
		date = Time.now
		@f.print <<OUT
<gexf>
  <meta lastmodifieddate="#{date}">
    <creator>ElyKrawler</creator>
    <description>Reachable websites from text input</description>
  </meta>
  <graph defaultedgetype="directed">
    <attributes class="node">
      <attribute id="0" title="name" type="string"/>
      <attribute id="1" title="url" type="string"/> #/>
      <attribute id="2" title="links" type="int" />
      <attribute id="3" title="actor" type="string">
        <default>default_actor</default>/>
      </attribute>
    </attributes>
	<nodes>
OUT
	end
	
	def node(url, line)
		@f.print <<OUT
      <node id="#{line.id}" label="nds#{line.id}">
	    <attvalues>
		  <attvalue for="0" value="nds#{line.id}"/>
		  <attvalue for="1" value="#{url}"/>
		  <attvalue for="2" value="#{line.links}"/>
		</attvalues>
	  </node>
OUT
	end
	
	def swap
		@f.print <<OUT
	</nodes>
	<edges>
OUT
	end
	
	def edge(line)
	 @f.print "      <edge id=\"#{@E}\" source=\"#{line.from}\" target=\"#{line.to}\"/>\n"
	 @E+=1
	 end
	
	def foot
		@f.print <<OUT
	</edges>
  </graph>
</gexf>
OUT
	end
	
	def close
		@f.close
	end
	
end	