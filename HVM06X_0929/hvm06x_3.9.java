
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class HVM06X_9 implements Serializable {

	private static int db = 0;

	public static void main(String[] args) {

		beir();
		try {
			atlag();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			piros();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			legdragabb();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}

	private static final long serialVersionUID = 1L;
	String rendszam;
	String tipus;
	int ar;

	public HVM06X_9(String r, String t, int a) {
		this.rendszam = r;
		this.tipus = t;
		this.ar = a;
	}

	public static void beir() {
		HVM06X_9[] autok = { new HVM06X_9("IUP-232", "Opel", 600000), new HVM06X_9("PZL-434", "Ford", 5000000),
				new HVM06X_9("RPL-544", "Suzuki", 4000000) };

		db = autok.length;

		try {
			ObjectOutputStream kifile = new ObjectOutputStream(new FileOutputStream("Autok.dat"));
			for (HVM06X_9 auto : autok) {
				kifile.writeObject(auto);
			}
			kifile.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

	}

	public static void atlag() throws FileNotFoundException {

		int szum = 0;
		HVM06X_9 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				try {
					while (true) {
						ma = (HVM06X_9) kifile.readObject();
						szum = szum + ma.ar;
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

		System.out.println("Az autók átlagára: " + szum / db);

	}

	public static void piros() throws FileNotFoundException {

		int pirosak = 0;
		HVM06X_9 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				try {
					while (true) {
						ma = (HVM06X_9) kifile.readObject();
						if (ma.tipus.equalsIgnoreCase("piros")) {
							pirosak++;
						}
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

		System.out.println("Piros autók száma: " + pirosak);

	}

	public static void legdragabb() throws FileNotFoundException {

		HVM06X_9 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				HVM06X_9 max;
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				max = (HVM06X_9) kifile.readObject();
				try {
					while (true) {
						ma = (HVM06X_9) kifile.readObject();
						if (ma.ar > max.ar) {
							max = ma;
						}
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
				System.out.println("A legdrágább autó rendszáma: " + max.rendszam + " ára: " + max.ar);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

	}

}