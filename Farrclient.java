import java.io.*;
import java.net.*;

public class Farrclient
{
	public static void main(String args[]) throws UnknownHostException, IOException
	{
		Socket s = new Socket("localhost",2222);
		int n = 0;

		System.out.println("Enter how many files you want to see :");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		DataInputStream dir = new DataInputStream(s.getInputStream());

		DataOutputStream dor = new DataOutputStream(s.getOutputStream());

		n = Integer.parseInt(br.readLine());
		dor.writeUTF(String.valueOf(n));


		System.out.println("Enter the File names below:");

		String[] farray = new String[n];

		for(int i=0;i<n;i++)
		{
			farray[i] = br.readLine();
			dor.writeUTF(farray[i]);
		}

	String smsg = dir.readUTF();
	System.out.println("From the above list:"+smsg);
	s.close();
	dor.close();
	dir.close();
	}

}
