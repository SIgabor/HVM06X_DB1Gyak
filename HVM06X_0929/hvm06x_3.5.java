
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class SIGFileIr {

	public static void main(String[] args) {

		masol("szamok.txt", "szavak.txt");

	}

	public static void masol(String fnevbe, String fnevki) {
		String sor;
		String[] szamok = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
		String[] szavak = { " egy ", " ketto ", " horom ", " negy ", " ot ", " hat ", " het ", "nyolc ", "kilenc ",
				" nulla" };

		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(fnevki));
			BufferedReader br = new BufferedReader(new FileReader(fnevbe));
			while ((sor = br.readLine()) != null) {
				for (int i = 0; i < 10; i++) {
					sor = sor.replace(szamok[i], szavak[i]);
				}
				bw.write(sor);
				bw.newLine();
			}

			br.close();
			bw.close();
			System.out.println("Ok");
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

}