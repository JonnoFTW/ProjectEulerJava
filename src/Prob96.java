import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Random;
import java.util.Scanner;

import org.apache.commons.lang3.ArrayUtils;

public class Prob96 {
	private static Random rand = new Random();

	private static boolean hasDuplicates(final int[] arr) {
		final int MAXZIP = 99999;

		BitSet b = new BitSet(MAXZIP + 1);
		b.set(0, MAXZIP, false);
		for (int item : arr) {
			if (!b.get(item)) {
				b.set(item, true);
			} else
				return true;
		}
		return false;
	}

	private static int countErrors(int[][] board) {
		int count = 0;
		// check rows
		for (int i = 0; i < board.length; i++) {
			if(!validRow(board[i]))
				count++;
			if (!validRow(arrayColumn(board, i)))
				count++;
		}	
		/*
		 * // check boxes for (int i = 0; i < 3; i++) { for (int j = 0; j < 3;
		 * j++) { if (hasDuplicates(quad(board, i, j))) count++; } }
		 */
		return count;
	}

	private static boolean validRow(int[] row) {
		int sum=0,product=0;
		for (int j = 0; j < row.length; j++) {
			sum += row[j];
			product *= row[j];
		}
		return sum == 45 && product ==362880;
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

	private static double acceptanceProbability(double currentEnergy,
			double neighbourEnergy, double temperature) {
		// If the new solution is better, accept it
		if (neighbourEnergy < currentEnergy) {
			return 1.0;
		}
		// If the new solution is worse, calculate an acceptance probability
		return Math.exp(-((neighbourEnergy - currentEnergy) / temperature));
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
				for (int c = 1; c <= 9; c++) {
					if (!ArrayUtils.contains(quad, c)) {
						quad[ArrayUtils.indexOf(quad, 0)] = c;
					}
				}
				setQuad(quad, newSolution, i, j);
			}
		}
		return newSolution;
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
	private static void swap(int[][] arr, int[][] board, int x, int y) {
		int[] quad = quad(board, x, y);
		int[] quadNew = quad(arr, x, y);
		LinkedList<Integer> zeroes = indexesOf(quad, 0);
		Collections.shuffle(zeroes);
		int i = zeroes.pop();
		int j = zeroes.pop();
		int t = quadNew[i];
		quadNew[i] = quadNew[j];
		quadNew[j] = t;
		setQuad(quadNew, arr, x, y);
	}

	private static int[][] solve(final int[][] board) {
		
		int[][] newSolution = setupSudoku(board);
		int[][] bestSolution = newSolution;
		
		int numErrors = countErrors(newSolution);
		int bestErrors = numErrors;
		double temp = 0.5;
		double coolingRate = 0.99999;
		long count =0;
		
		System.out.println("Starting errors " + numErrors);
		while (count < 40000) {
			if(count %1000 == 0) {
			//	System.out.printf("Iteration: %d score=%d temp=%.5f best=%d%n",count,numErrors,temp,bestErrors);
			}
			int[][] candidateSolution = ArrayUtils.clone(newSolution);
			swap(candidateSolution, board, rand.nextInt(3), rand.nextInt(3));
			int candidateErrors = countErrors(candidateSolution);

			//if (acceptanceProbability(numErrors, newNumErrors, temp) > rand.nextDouble()) {
			if(Math.exp(((float)(numErrors-candidateErrors))/temp) - rand.nextDouble() > 0) {
				newSolution = candidateSolution;
				numErrors = candidateErrors;
				// System.out.println("new errors =" + newNumErrors);
			}
			if(candidateErrors < bestErrors) {
				bestErrors = candidateErrors;
				bestSolution  = ArrayUtils.clone(newSolution);
			}
			if (numErrors == 0) {
				break;
			}
			temp *= coolingRate;
			count++;
		}
		System.out.println("Solved in "+count+" iterations");
		return bestSolution;
	}

	public static void main(String[] args) throws FileNotFoundException {
		Scanner s = new Scanner(new File("p096_sudoku.txt"));
		int sum = 0;
		long started = System.nanoTime();
		for (int i = 0; i < 1; i++) {
			System.out.println(s.nextLine());
			int[][] board = new int[9][9];
			for (int j = 0; j < 9; j++) {
				char[] line = s.nextLine().toCharArray();
				for (int k = 0; k < line.length; k++) {
					board[j][k] = Integer.parseInt(Character.toString(line[k]));
				}
			}
			board = solve(board);
			System.out.println("Final Errors: " + countErrors(board));
			sum += board[0][0] * 100 + board[0][1] * 10 + board[0][2];
			for (int j = 0; j < board.length; j++) {
				System.out.println(Arrays.toString(board[j]));
			}
		}
		s.close();
		System.out.println(sum);
		long fin = System.nanoTime();

		System.out.println("Took: " + ((fin - started) / 1000000000f) + "s");
	}

}
