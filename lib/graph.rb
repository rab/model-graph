# An internal class to collect abstract nodes and edges and deliver them
# back when needed.
class Graph
  attr_reader :name

  # Holds information about nodes and edges that should be depicted on the
  # UML-ish graph of the ActiveRecord model classes.  The +name+ is optional
  # and only serves to give the graph an internal name.  If you had an
  # application to combine model graphs from multiple applications, this
  # might be useful.
  def initialize(name="model_graph")
    @name = name
    @nodes = Hash.new          # holds simple strings
    @edges = Hash.new { |h,k| h[k] = Hash.new { |h2,k2| h2[k2] = Hash.new } }

    # A hm B :as => Y    gives edge A->B and implies B bt A
    # C hm B :as => Y    gives edge C->B and implies B bt A
    # B bt Y :polymorphic => true       no new information
  end

  # Create an unattached node in this graph.
  def add_node(nodename, options="")
    @nodes[nodename] = options
  end

  # Iterates over all the nodes previously added to this graph.
  def nodes                   # :yields: nodestring
    @nodes.each do |name,options|
      yield "#{name} #{options}"
    end
  end

  # Create a directed edge from one node to another.  If an edge between
  # nodes already exists in the opposite direction, the arrow will be
  # attached to the other end of the existing edge.
  def add_edge(fromnode, tonode, options={})
    unless @edges[tonode].has_key? fromnode
      options.each do |k,v|
        @edges[fromnode][tonode][case k.to_s
                                 when 'label' : 'taillabel'
                                 when 'midlabel' : 'label'
                                 when /^arrow(?:head|tail)?$/ : 'arrowhead'
                                 else k
                                 end] = v
      end
    else
      # reverse sense and overload existing edge
      options.each do |k,v|
        @edges[tonode][fromnode][case k.to_s
                                 when 'label' : 'headlabel'
                                 when 'midlabel' : 'label'
                                 when /^arrow(?:head|tail)?$/ : 'arrowtail'
                                 else k
                                 end] = v
      end
    end
  end

  # Iterates over all the DOT formatted edges with nodes having the most
  # edges first and the edges without a constraint attribute before those
  # that do.
  def edges(options={}) # :yields: edgestring
    @edges.sort { |a,b| b[1].length <=> a[1].length }.each do |(fromnode,nh)|
      nh.sort_by { |(t,a)| (a.has_key?('constraint') ^ options[:constraints_first]) ? 1 : 0 }.each do |tonode,eh|
        e = "#{fromnode} -> #{tonode} "
        e << eh.inspect(options) unless eh.nil?
        yield e
      end
    end
  end
end
