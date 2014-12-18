import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Random;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.commons.lang3.ArrayUtils;

public class Prob96 {
	private static Random rand = new Random();
	private static AtomicInteger sum = new AtomicInteger(0);
	private static int countErrors(int[][] board) {
		int count = 0;
		// check rows and columns for errors only
		for (int i = 0; i < board.length; i++) {
			if(!validRow(board[i]))
				count++;
			if (!validRow(arrayColumn(board, i)))
				count++;
		}
		return count;
	}

	private static boolean validRow(int[] row) {
		int s=0,product=1;
		for (int j = 0; j < row.length; j++) {
			s += row[j];
			product *= row[j];
		}
		return s == 45 && product == 362880;
	}

	private static int[] arrayColumn(final int[][] arr, final int col) {
		int[] column = new int[arr.length];
		for (int i = 0; i < arr.length; i++) {
			column[i] = arr[i][col];
		}
		return column;
	}

	private static int[] quad(final int[][] arr, final int x, final int y) {
		int[] out = new int[9];
		int c = 0;
		for (int i = x * 3; i < x * 3 + 3; i++) {
			for (int j = y * 3; j < y * 3 + 3; j++) {
				out[c++] = arr[i][j];
			}
		}
		return out;
	}

	private static void setQuad(int[] quad, int[][] newSolution, int x, int y) {
		for (int i = 0; i < quad.length; i++) {
			newSolution[x * 3 + i / 3][y * 3 + i % 3] = quad[i];
		}
	}
	
	private static int count(int[] arr, int needle) {
		int count=0;
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] == needle)count++;
		}
		return count;
	}
	/***
	 * Initialise so that all 3x3 subgrids contains [1..9]
	 * 
	 * @param board
	 * @return
	 */
	private static int[][] setupSudoku(final int[][] board) {
		int[][] newSolution = new int[9][9];
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				newSolution[i][j] = board[i][j];
			}
		}
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				int[] quad = quad(newSolution, i, j);
				int zeroes = count(quad,0);
				for (int c = 1; c <= 9; c++) {
					if (!ArrayUtils.contains(quad, c)) {
						quad[ArrayUtils.indexOf(quad, 0)] = c;
					}
				}
				if(zeroes == 1) {
					setQuad(quad, board, i, j);
				}
				setQuad(quad, newSolution, i, j);
			}
		}
		return newSolution;
	}
	private static int[][][] candidates(final int[][] board) {
		int[][][] cand = new int[9][9][10];
		while(true) {
			int solved = 0;
			for (int i = 0; i < board.length; i++) {
				for (int j = 0; j < board[i].length; j++) {
					if(board[i][j] == 0) {
						int[] row = board[i];
						int[] col = arrayColumn(board, j);
						int[] qad = quad(board,i/3,j/3);
						for (int k = 1; k < cand[i][j].length; k++) {
							if(ArrayUtils.contains(qad, k) || ArrayUtils.contains(col, k) || ArrayUtils.contains(row,k))
								cand[i][j][k]=1;
						}
						if(count(cand[i][j],0) == 2) {
							board[i][j] = ArrayUtils.lastIndexOf(cand[i][j], 0);
							solved++;
						}
					}
				}
			}
			if(solved ==0) {
				break;
			}
		}
		return cand;
	}

	private static LinkedList<Integer> indexesOf(int[] arr, int needle) {
		LinkedList<Integer> l = new LinkedList<Integer>();
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == needle) {
				l.add(i);
			}
		}
		return l;
	}

	/**
	 * Swap 2 non-given elements within the 3x3 grid
	 * 
	 * @param arr
	 * @param x
	 * @param y
	 */
	private static void swap(int[][] arr, int[][] board,int[][][] cands, int x, int y) {
		int[] quad = quad(board, x, y);
		int[] quadNew = quad(arr, x, y);
		LinkedList<Integer> zeroes = indexesOf(quad, 0);
		while(true) {
			if(zeroes.size() >= 2) {
				Collections.shuffle(zeroes);
				int i = zeroes.pop();
				int j = zeroes.pop();
				
				// check if this swap is a valid one
				// given the candidates
				int[] candsij = cands[x*3 + i/3][y*3 + j%3];
				if(candsij[i] == 0 || candsij[j]==0) {
					int t = quadNew[i];
					quadNew[i] = quadNew[j];
					quadNew[j] = t;
					setQuad(quadNew, arr, x, y);
					break;
				}
			} else {
				break;
			}
		}
	}

	private static int[][] solve(final int[][] board,String grid) {
		boolean solved = false;
		int retries = 0;
		int[][][] cands =  candidates(board);
		while(retries < 200) {
			int[][] newSolution = setupSudoku(board);	
			int[][] bestSolution = arrayCopy2D(newSolution);
			int numErrors = countErrors(newSolution);
			if(numErrors ==0) {
				System.out.println(grid+ " Solved by deduction");
				return board;
			}
			int bestErrors = numErrors;
			double temp = 0.4 + retries/1000d;
			double coolingRate = 0.9999;
			long count = 0;
			while (count < 500000) {
				int[][] candidateSolution = arrayCopy2D(newSolution);
				swap(candidateSolution, board,cands, rand.nextInt(3), rand.nextInt(3));
				int candidateErrors = countErrors(candidateSolution);
				double scoreDelta = (double)(numErrors - candidateErrors);
				
				if(Math.exp(scoreDelta/temp) - rand.nextDouble() > 0) {
					newSolution = arrayCopy2D(candidateSolution);
					numErrors = candidateErrors;
				}
				if(candidateErrors < bestErrors) {		
					bestSolution  = arrayCopy2D(newSolution);
					bestErrors = countErrors(bestSolution);
				}
				if (numErrors == 0) {
					newSolution = candidateSolution;
					System.out.println(grid + " Solved in "+count+" iterations and "+ retries + " retries");
					solved = true;
					return newSolution;
				}
				temp *= coolingRate;
				count++;
			}
			if(!solved)
				retries++;
			else 
				break;
		}
		if(!solved)
			System.out.println(grid+ " failed in "+retries+" retries");
		return board;
	}
	private static int[][] arrayCopy2D(final int[][] arr) {
		int[][] copy = new int[arr.length][arr[0].length];
		for (int i = 0; i < arr.length; i++) {
			System.arraycopy(arr[i], 0, copy[i], 0, arr[i].length);
		}
		return copy;
	}
	private static void printArr(int[][] arr) {
		for (int i = 0; i < arr.length; i++) {
			System.out.println(Arrays.toString(arr[i]));
		}
		System.out.println("--------");
	}
	private static class Solver implements Runnable {
		private int[][] board;
		private String grid;
		public Solver(int[][] board,String grid) {
			this.board = board;
			this.grid = grid;
		}
		@Override
		public void run() {
			board = solve(board,grid);
			sum.addAndGet(board[0][0] * 100 + board[0][1] * 10 + board[0][2]);
			printArr(board);
		}
		
	}
	public static void main(String[] args) throws FileNotFoundException, InterruptedException {
		Scanner s = new Scanner(new File("p096_sudoku.txt"));
		ExecutorService exec = Executors.newWorkStealingPool();
		long started = System.nanoTime();
		for (int i = 0; i < 50; i++) {
			String grid = s.nextLine();
			int[][] board = new int[9][9];
			for (int j = 0; j < 9; j++) {
				char[] line = s.nextLine().toCharArray();
				for (int k = 0; k < line.length; k++) {
					board[j][k] = Integer.parseInt(Character.toString(line[k]));
				}
			}
			exec.execute(new Solver(board,grid));
		}
		exec.shutdown();
		exec.awaitTermination(Long.MAX_VALUE, TimeUnit.DAYS);
		s.close();
		System.out.println(sum);
		long fin = System.nanoTime();
		System.out.println("Took: " + ((fin - started) / 1000000000f) + "s");
	}

}
