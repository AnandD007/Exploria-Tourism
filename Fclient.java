import java.io.*;
import java.net.*;


public class Fclient
{
	public static void main(String args[]) throws UnknownHostException, IOException
	{
		Socket s = new Socket("localhost",2222);

		System.out.println("Write Any Text File Name Below:");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String rb = br.readLine();
		DataInputStream dir = new DataInputStream(s.getInputStream());

		DataOutputStream dor = new DataOutputStream(s.getOutputStream());

		dor.writeUTF(rb);
		String msg = dir.readUTF();

		System.out.println(msg);

	s.close();
	dir.close();
	dor.close();
	}

}