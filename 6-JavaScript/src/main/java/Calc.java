
public class Calc {
	int x, y;
	
	public void setValue(int p1, int p2) {
		this.x = p1;
		this.y = p2;
	}
	
	public int plus() {
		return this.x + this.y;
	}
	
	public int minus() {
		return this.x - this.y;
	}
	
	public void result() {
		int val1 = plus();
		int val2 = minus();
		System.out.println("덧셈결과 : " + val1);
		System.out.println("뺄셈결과 : " + val2);
	}
}
