import java.net.*;
import java.io.*;

public class Farrserver
{
	public static void main(String args[]) throws IOException, UnknownHostException
	{
		ServerSocket ss = new ServerSocket(2222);
		Socket s = ss.accept();
		int exist = 0;
		int notexist = 0;

		DataInputStream dir = new DataInputStream(s.getInputStream());
		DataOutputStream dor = new DataOutputStream(s.getOutputStream());

		int n = Integer.parseInt(dir.readUTF());
		String[] farray = new String[n];
		File[] f = new File[n];
		for(int i=0; i<n; i++)
		{
			farray[i] = dir.readUTF();
			f[i] = new File(farray[i]);
			if(f[i].exists())
			{
				exist++;
			}
			else
			{
				notexist++;
			}
		}
		String msg = "Total "+exist+" files are exist and "+notexist+" are not exist the current directory.";
		dor.writeUTF(msg);
		ss.close();
		s.close();
		dor.close();
		dir.close();
	}
}


