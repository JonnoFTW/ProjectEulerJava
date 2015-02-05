import java.util.Arrays;
import java.util.InputMismatchException;
import java.util.Scanner;

public class TTT {

	private enum State{XWIN,OWIN,DRAW,NOWIN}
	private enum Play{E,X,O}
	public TTT() {
		Play[][] board = new Play[3][3];
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				board[i][j] = Play.E;
			}
		}
		
		System.out.println("Welcome to tic-tac-toe"+System.lineSeparator()+"----------------------");
		showBoard(board);
		State state = State.NOWIN;
		boolean xTurn = true;
		Scanner in = new Scanner(System.in);
		while(state == State.NOWIN) {
			System.out.println((xTurn?"X":"O")+ "'s turn to play");
			
			
			int x,y;
			while(true) {
				System.out.println("Please enter a valid play between 1 and 3");
				try{
					x = in.nextInt();
					y = in.nextInt();
					if(board[x-1][y-1] != Play.E) {
						continue;
					}
					board[x-1][y-1] = (xTurn?Play.X:Play.O);
					break;
				} catch(InputMismatchException e) {
				} catch(ArrayIndexOutOfBoundsException ee) {
				}
			}
		    xTurn = !xTurn;
			state = checkWinner(board);
			showBoard(board);
			switch (state) {
			case XWIN:
				System.out.println("X wins!");
				return;
			case OWIN:
				System.out.println("O wins!");
				return;
			case DRAW:
				System.out.println("Game is a draw!");
				return;
			case NOWIN:
			default:
				break;
			}
		}
		
	}
	private void showBoard(Play[][] board) {
		for (Play[] is : board) {
			System.out.print ("| ");
			for (Play i : is) {
				System.out.print((i!=Play.E?i.name():" ")+" ");
			}
			System.out.println("|");
		}
	}
	private static State checkWinner(Play[][] board) {
		// if x or o has three in a row
		final Play[] xWin = {Play.X,Play.X,Play.X};
		final Play[] oWin = {Play.O,Play.O,Play.O};
		final Play[][] rowChecks = {
				// rows
				{board[0][0],board[0][1],board[0][2]},
				{board[1][0],board[1][1],board[1][2]},
				{board[2][0],board[2][1],board[2][2]},
				//columns
				{board[0][0],board[1][0],board[2][0]},
				{board[0][1],board[1][1],board[2][1]},
				{board[0][2],board[1][2],board[2][2]},
				// diagonals
				{board[0][0],board[1][1],board[2][2]},
				{board[0][2],board[1][1],board[2][0]}
		};
		int emptyCount = 0;
		for (Play[] plays : rowChecks) {
			if(Arrays.equals(plays, xWin))
				return State.XWIN;
			if(Arrays.equals(plays, oWin))
				return State.OWIN;
			if(Arrays.toString(plays).contains("E"))
				emptyCount++;
		}
		
		//if all spaces are taken or there are no possible winning moves
		if(emptyCount == 0)
			return State.DRAW;
		return State.NOWIN;
	}
	
	public static void main(String[] args) {
		new TTT();
	}

}
