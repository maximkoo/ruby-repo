#require './vertex.rb'
#require './edge.rb'
UNVISITED='unvisited'
VISITED='visited'
DONE='done'
class Dijkstra1
	attr_accessor :vertices, :edges
	def initialize
		@vertices=[]
		@edges=[]
		# p1=Vertex.new(1,0,0);
		# p2=Vertex.new(2,0,0);
		# p3=Vertex.new(3,0,0);
		# p4=Vertex.new(4,0,0);
		# p5=Vertex.new(5,0,0);
		# p6=Vertex.new(6,0,0);
		# p7=Vertex.new(7,0,0);
		# @vertices=[p1,p2,p3,p4,p5,p6,p7];

		# e1=Edge.new(1,p1,p2, 10);
		# e2=Edge.new(2,p1,p3, 14);
		# e3=Edge.new(3,p1,p4, 12);
		# e4=Edge.new(4,p2,p3, 6);
		# e5=Edge.new(5,p3,p4, 1);
		# e6=Edge.new(6,p2,p5, 7);
		# e7=Edge.new(7,p3,p7, 4);
		# e8=Edge.new(8,p3,p6, 9);
		# e9=Edge.new(9,p4,p6, 8);
		# e10=Edge.new(10,p5,p7, 5);
		# e11=Edge.new(11,p6,p7, 11);
		# @edges=[e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11];		
		# startVertex=p1;
		# endVertex=p7;
		p1=Vertex.new(1,0,0);
		p2=Vertex.new(2,0,0);
		p3=Vertex.new(3,0,0);
		p4=Vertex.new(4,0,0);
		p5=Vertex.new(5,0,0);
		p6=Vertex.new(6,0,0);
		p7=Vertex.new(7,0,0);
		p8=Vertex.new(8,0,0);
		p9=Vertex.new(9,0,0);
		p10=Vertex.new(10,0,0);
		p11=Vertex.new(11,0,0);
		p12=Vertex.new(12,0,0);
		p13=Vertex.new(13,0,0);
		p14=Vertex.new(14,0,0);
		p15=Vertex.new(15,0,0);
		p16=Vertex.new(16,0,0);
		@vertices=[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16];
		
		@edges<<Edge.new(1,p1,p2, 20);
		@edges<<Edge.new(2,p2,p3, 20);
		@edges<<Edge.new(3,p1,p4, 10);
		@edges<<Edge.new(4,p2,p6, 5);
		@edges<<Edge.new(5,p3,p13, 10);

		@edges<<Edge.new(6,p4,p8, 10);

		@edges<<Edge.new(7,p8,p5, 5);
		@edges<<Edge.new(8,p5,p6, 10);
		@edges<<Edge.new(9,p6,p7, 10);
		@edges<<Edge.new(10,p7,p9, 5);

		@edges<<Edge.new(11,p8,p10, 5)
		@edges<<Edge.new(12,p10,p11, 10);
		@edges<<Edge.new(13,p11,p12, 10);
		@edges<<Edge.new(14,p9,p12, 5);

		@edges<<Edge.new(15,p9,p13, 10);

		@edges<<Edge.new(16,p4,p14, 10);
		@edges<<Edge.new(17,p11,p15, 5);
		@edges<<Edge.new(18,p14,p15,20);
		@edges<<Edge.new(19,p13,p16, 10);	
		@edges<<Edge.new(18,p15,p16, 20);
			
	end;

	def vertexById(i)
		@vertices.select{|v| v.id==i}.first
	end;

	def vertexRateById(i)
		a=@vertices.select{|v| v.id==i}.first
		a.rate if !a.nil?
	end;	

	def setRates(src)		
		@edges.select{|e| e.hasVertex(src)}.sort{|a,b| a.weight<=>b.weight}.each do |e|
			dest=e.endVertex(src);
			# puts v.id, v.status;
			if (dest.rate>e.weight+src.rate && dest.status==VISITED)|| dest.status==UNVISITED;
				dest.rate=e.weight+src.rate;
				dest.from=src.id;
				dest.status=VISITED;
			end;	
		end;
	end;

	def printVertices
		@vertices.each do |v| 
			puts "#{v.id}. rate=#{v.rate}, from=#{v.from}(#{vertexRateById(v.from)}), status=#{v.status}";
		end;	
	end;	

	def process
		# startVertex.status=VISITED if !startVertex.nil?;
		@vertices.select{|v| v.status==VISITED}.sort{|v1,v2| v1.rate<=>v2.rate}.each do |p|
			puts "Processing vertex #{p.id} with rate #{p.rate}";
			setRates(p);
			p.status=DONE;
		end;
	end;	

	def findPath(src, dest)
		path=[]
		#path<<dest
		#a=vertexById(dest.from);
		a=dest;
		while a!=src
			path<<a
			a=vertexById(a.from)
		end;	
		path<<a;
	end;	
end;	

class Vertex
	attr_accessor :id, :x,:y, :from, :rate, :status
	def initialize(id, x,y)
		@id, @x,@y=id, x,y;
		@from=nil;
		@rate=0;
		@status=UNVISITED;
	end;
end;

class Edge
	attr_accessor :id,:v1,:v2,:x1,:x2,:y1,:y2,:weight
	def initialize(id, v1,v2, weight)
		@id, @v1,@v2, @weight=id, v1,v2, weight 
	end;

	def hasVertex(p)
		return (v1==p || v2==p)
	end;

	def endVertex(p) #returns the other end of an edge, not p
		return [@v1,@v2].select{|v| v!=p}.first
	end;	
end;		

d=Dijkstra1.new;
# d.edges.select{|e| e.hasVertex(d.vertices.first)}.sort{|a,b| a.weight<=>b.weight}.each{|e| puts "id=#{e.id}, weight=#{e.weight}"};
# d.setRates(d.vertices[0]);
# d.vertices[0].status=DONE
# d.printVertices
# d.setRates(d.vertices[1]);
# d.printVertices

# d.process(d.vertices[0]);
# d.printVertices;
# d.process(nil);
# d.printVertices;

startVertex=d.vertices[1]
endVertex=d.vertices[14]
startVertex.status=VISITED
while d.vertices.select{|v| [VISITED,UNVISITED].include?(v.status)}.count>0 do
	d.process();
	d.printVertices;
end;	

path=d.findPath(startVertex,endVertex);
puts "\n*** Path found ***"
path.reverse.each do |p|
	puts p.id;
end;
