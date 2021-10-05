
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Scanner;

public class HVM06X_6 implements Serializable {

	public static void main(String[] args) {

		hf4();
		try {
			visszaolvas();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}

	private static final long serialVersionUID = 1L;
	String rendszam;
	String tipus;
	int ar;

	public HVM06X_6(String r, String t, int a) {
		this.rendszam = r;
		this.tipus = t;
		this.ar = a;
	}

	public static int hf4() {
		HVM06X_6[] autok = { new HVM06X_6("IUP-232", "Opel", 600000), new HVM06X_6("PZL-434", "Ford", 5000000),
				new HVM06X_6("RPL-544", "Suzuki", 4000000) };

		try {
			ObjectOutputStream kifile = new ObjectOutputStream(new FileOutputStream("Autok.dat"));
			for (HVM06X_6 auto : autok) {
				kifile.writeObject(auto);
			}
			kifile.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl megnyitása során!\n");
		}

		return autok.length;
	}

	public static void visszaolvas() throws FileNotFoundException {

		Scanner sc = new Scanner(System.in);
		System.out.println("Melyik rekordot szeretné visszaolvasni? Eddig " + hf4() + " rekord van.\n");
		boolean ok = true;
		int olvas = 0;
		do {
			try {
				ok = true;
				olvas = sc.nextInt();
				if (olvas <= 0 || olvas > 10) {
					System.out.println("Nem jó számot adott meg!\n");
					ok = false;
				}
			} catch (NumberFormatException e) {
				System.out.println(e);
				ok = false;
			}
		} while (!ok);

		sc.close();

		int sor = 1;
		HVM06X_6 ma;
		try {
			File fn = new File("Autok.dat");
			if (fn.exists()) {
				ObjectInputStream kifile = new ObjectInputStream(new FileInputStream("Autok.dat"));
				try {
					while (true) {
						ma = (HVM06X_6) kifile.readObject();
						if (sor == olvas) {
							System.out.println("Rendszam:  " + ma.rendszam);
							System.out.println("Tipus: " + ma.tipus);
							System.out.println("Ár: " + ma.ar);
						}
						sor++;
					}
				} catch (EOFException ee) {
					ma = null;
				}
				kifile.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Hiba a fájl nyitása során!\n");
		}

		sc.close();

	}

}