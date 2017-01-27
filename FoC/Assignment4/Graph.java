/*
 * Author: Agata Borkowska
 * UID: 1690550
 */

// Some initial comments:

/*
 * There are two key ways of representing graphs: adjacency matrix or adjacency lists.
 * An adjacency matrix requires storing an nxn array, even if most fields are empty,
 * which makes it very memory-inefficient. Therefore, I'll use adjacency lists, i.e.
 * for each node list the nodes that are adjacent to it.
 *
 * The data structure used for the lists themselves will be a hash set from java.util.
 * Main reasons for choosing it is fast look up time, variable size (as opposed to arrays
 * - this is particularly important, as we don't know how many nodes/edges there will be),
 * and finally, as it implements the set interface, it does not allow for repeated
 * entries, which is in line with the specification.
 *
 * It is based on a hash table, so the basic operations (add, size, remove...) are
 * assumed to be constant time. This works particularly well for a large number of
 * entries, however may not be the best choice if the number of nodes in the graph
 * is small.
 *
 * As for storing the nodes themselves, the choice is between a list (like ArrayList)
 * or a map (label -> adjacency list). Lists are good to iterate over, but have potentially
 * linear look up times. This is particularly important in adding nodes - we do not
 * want the same node to be added twice, so while hash map does this check quickly,
 * in the case of an ArrayList, we would have a very cumbersome check if the element
 * is already in the list.
 *
 * For further detail, refer to the documentation:
 * https://docs.oracle.com/javase/7/docs/api/java/util/HashSet.html
 */

import java.util.HashMap; // for storing nodes
import java.util.HashSet; // for adjacency lists
import java.util.LinkedList; // for queue in BFS and DFS
import java.util.Arrays; // for cut set

public class Graph {
    private HashMap<String, HashSet<String>> nodes;


    /*
    *  Graph Constructor
    *
    *  Initialises the Graph object such that it is ready to add vertices and edges
    *  By default is empty and does not take any initial data
    */
    public Graph() {
        this.nodes = new  HashMap<String, HashSet<String>>();
    }

    /*
    *  Adds a vertex to the graph
    *
    *  This method adds a vertex with the specified label to the graph.
    *  In the event that a vertex with that specific label already exists,
    *  no action is taken and no changes are made to the graph.
    *
    *  @param label The label string that identifies the vertex
    *
    */
    public void addVertex(String label) {
        if (!this.nodes.containsKey(label)) {
            nodes.put(label, new HashSet<String>());
        }
    }

    /*
    *  Removes a vertex from the graph
    *
    *  This method removes a vertex with the specified label from the graph.
    *  In the event that a vertex with that specic label does not exist,
    *  no action is taken and no changes are made to the graph.
    *  If a vertex is removed, any edges that connect to this vertex should
    *  also be removed.
    *
    *  @param label The label string that identifies the vertex
    *
    */
    public void removeVertex(String label) {
        if (nodes.containsKey(label)) {
            // First remove all edges incident to this node
            for (String v : nodes.get(label)) {
                nodes.get(v).remove(label);
            }

            nodes.remove(label);
        }
    }

    /*
    *  Adds an edge to the graph
    *
    *  This method adds a edge between the vertices identified by the labels
    *  vertexA and vertexB
    *  If either node does not exist, or the edge already exists,
    *  no changes are made
    *  Note - Remember this is an undirected graph
    *
    *  @param vertexA The label string that identifies the first vertex of the edge
    *  @param vertexB The label string that identifies the second vertex of the edge
    *
    */
    public void addEdge(String vertexA, String vertexB) {
        nodes.get(vertexA).add(vertexB);
        nodes.get(vertexB).add(vertexA);
    }

    /*
    *  Removes an edge from the graph
    *
    *  This method removes an edge between the vertices identified by the labels
    *  vertexA and vertexB.
    *  If either node does not exist, or the edge does not exist,no changes are made
    *  Note - Remember this is an undirected graph
    *
    *  @param vertexA The label string that identifies the first vertex of the edge
    *  @param vertexB The label string that identifies the second vertex of the edge
    *
    */
    public void removeEdge(String vertexA, String vertexB) {
        nodes.get(vertexA).remove(vertexB);
        nodes.get(vertexB).remove(vertexA);
    }

    /*
    *  Performs a depth-first search on the graph
    *
    *  This method performs a depth-first search through the graph,
    *  starting at startVertex and continuing until the graph is either
    *  fully explored or the vertex searchVertex has been found.
    *  If searchVertex is found, return true, else return false.
    *
    *  @param startVertex - The label of the start vertex of the search
    *  @param searchVertex - The label of the vertex being searched for
    *
    *  @return Returns true if found, false if not
    */
    public boolean depthFirstSearch(String startVertex, String searchVertex) {
        // Comments
        /*
         * DFS can be implemented using a stack or recursion. I opted for the former,
         * because it doesn't require an additional procedure, and the existing data
         * structures support this easily.
         *
         * Using recursion would reduce the overhead of an additional storage (stack).
         */

        HashSet<String> explored = new HashSet<String>(); // set of discovered vertices
        LinkedList<String> stack = new LinkedList<String>(); // stack of discovered vertices

        stack.push(startVertex);
        String vertex;// current vertex
        while(stack.size() != 0) {
            vertex = stack.pop();
            if (vertex == searchVertex) {
                return true;
            }
            for (String v : nodes.get(vertex)) {
                if (!explored.contains(v)) { // check only unvisited neighbours
                    stack.add(v);
                    explored.add(v);
                }
            }
        }
        return false;
    }

    /*
    *  Performs a breadth-first search on the graph
    *
    *  This method performs a breadth-first search through the graph,
    *  starting at startVertex and continuing until the graph is either
    *  fully explored or the vertex searchVertex has been found.
    *  If searchVertex is found, return true, else return false.
    *
    *  @param startVertex - The label of the start vertex of the search
    *  @param searchVertex - The label of the vertex being searched for
    *
    *  @return Returns true if found, false if not
    */
    public boolean breadthFirstSearch(String startVertex, String searchVertex) {
        LinkedList<String> queue = new LinkedList<String>(); // list of our discovered vertices
        HashSet<String> explored = new HashSet<String>(); // set of explored vertices
        
        String vertex; // current vertex we're at
        queue.add(startVertex);
        while(queue.size() != 0) {
            vertex = queue.poll();
            if (vertex == searchVertex) {
                return true;
            }
            for (String v : nodes.get(vertex)) {
                if (!explored.contains(v)) {
                    explored.add(v);
                    queue.add(v);
                }
            }
        }
        return false;
    }

    /*
    *  Computes and prints the cut set of edges between two subsets of the graph vertices
    *  For the purposes of this exercise, you may assume that the union of the two vertices sets is
    *  equal to the full vertex set of the graph (since a cut is a partition of the graph).
    *
    *  The cut set of a graph is the set of edges that traverses between the two partions represented by
    *  subVerticesA and subVerticesB. This method computes and prints this set of edges.
    *
    *  If there is an invalid input, such as a vertex does not exist or a vertex is present in both arrays, you may print "Error".
    *  Otherwise, this method should print the cut set of edges in a tuple fashion - e.g. ((A,B),(A,C),(B,C)).
    *
    *  @param subVerticesA - An array of vertex labels belonging to a subset of the graph vertices
    *  @param subVerticesB - An array of vertex labels belonging to a subset of the graph vertices, that should be disjoint from subVerticesA
    *
    */
    public void printCutSet(String[] subVerticesA, String[] subVerticesB) {
        // Check that we are given correct input
        // if the total of elements in the two arrays is equal to the size of the set of nodes
        // and if they contain precisely the same elements as nodes, then they must contain precisely each node once
        // (e.g. if the size checked, but a node was in both A and B, then some other node must be missing)
        boolean proceed = true;
        if (subVerticesA.length + subVerticesB.length != nodes.size()) {
            proceed = false;
        }
        HashSet<String> unionAB = new HashSet<String>(Arrays.asList(subVerticesA));
        unionAB.addAll(Arrays.asList(subVerticesB));
        if (!unionAB.equals(nodes)) {
            proceed = false;
        }

        if (!proceed) {
            System.out.println("Incorrect input in printCutSet() method.");
            return;
        }

        // Checks pass, so we can start listing edges
        LinkedList<String> edgeList = new LinkedList<String>();
        for (int i = 0; i < subVerticesA.length; i ++) {
            // iterate over the other array, lookup if it matches an element of the hashSet of the neighbours
            // to take advantage of a hash set lookup time
            for (int j = 0; j < subVerticesB.length; j++) {
                if (nodes.get(subVerticesA[i]).contains(subVerticesB[j])) {
                    edgeList.add("(" + subVerticesA[i] + ", " + subVerticesB[j] + ")");
                }
            }
        }

        System.out.println(Arrays.toString(edgeList.toArray()));
    }
}