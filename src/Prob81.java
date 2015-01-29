import java.io.File;
import java.io.FileNotFoundException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Scanner;

public class Prob81 {

    public Prob81() throws FileNotFoundException {
        Scanner in = new Scanner(new File("matrix.txt"));
        in.useDelimiter("[,\n]");
        
        GraphNode[][] matrix = new GraphNode[80][80];
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                matrix[i][j] = new GraphNode(in.nextInt());
            }
            in.nextLine();
        }
        in.close();
        System.out.println("Read file");
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[i].length; j++) {
                GraphNode g = matrix[i][j];
                if (i + 1 != matrix.length)
                    g.down = matrix[i + 1][j];
                if (j + 1 != matrix.length)
                    g.right = matrix[i][j + 1];
                if (i - 1 > -1)
                    g.up = matrix[i - 1][j];
                if (j - 1 > -1)
                    g.left = matrix[i][j - 1];
            }
        }
      /*  int min = Integer.MAX_VALUE;
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix.length; j++) {*/
                for (GraphNode[] m : matrix) {
                    for (GraphNode g : m) {
                        g.dist = Integer.MAX_VALUE;
                        g.visited = false;
                        g.previous = null;
                    }
                }
                LinkedList<GraphNode> q = new LinkedList<GraphNode>();
                GraphNode goal = matrix[matrix.length-1][matrix.length - 1];
                GraphNode start = matrix[0][0];
                q.add(start);
                start.dist = start.num;
                boolean reached = false;
                
                while (!q.isEmpty()) {
                    Collections.sort(q);
                    GraphNode u = q.pop();
                    u.visited = true;
                    if (u == goal) {
                        reached = true;
                        break;
                    }
                    // add up and left for 83
                    GraphNode[] neighbours = new GraphNode[] { 
                    		//u.up,
                    		u.right,
                    		u.down,
                    		//u.left
                    };
                    for (GraphNode v : neighbours) {
                        if (v == null || v.visited)
                            continue;
                        int alt = u.dist + v.num;
                        if (alt < v.dist) {
                            v.dist = alt;
                            v.previous = u;
                            q.add(v);
                        }
                    }
                }
                if (reached)
                	System.out.println(goal.dist);
                    //min = Math.min(min, goal.dist);
          /*  }
        }*/
       // System.out.println("min=" + min);
    }

    public static void main(String[] args) throws FileNotFoundException {
        long start = System.nanoTime();
        new Prob81();
        System.out.println("Took:" + (System.nanoTime() - start) / 1e9f);
    }

    private class GraphNode implements Comparable<GraphNode> {
        int num, dist = 0;
        boolean visited = false;
        GraphNode up, left, right, down, previous;

        GraphNode(int num) {
            this.num = num;
        }

        public int compareTo(GraphNode g) {
            return this.dist - g.dist;
        }

        public String toString() {
            return num + "";
        }
    }
}