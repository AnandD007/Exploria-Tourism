import java.net.*;
import java.io.*;

public class Fserver
{
	public static void main(String args[]) throws UnknownHostException, IOException
	{
		ServerSocket ss = new ServerSocket(2222);

		Socket s = ss.accept();
		int c = 0;
		String msg ="";
		DataInputStream dir = new DataInputStream(s.getInputStream());

		DataOutputStream dor = new DataOutputStream(s.getOutputStream());

		String fname = dir.readUTF();
		File f = new File(fname);
		if(f.exists())
		{
			FileInputStream f1 = new FileInputStream(f);
			while((c=f1.read())!=-1)
			{
				msg = msg+(char)c;
			}
		}
		else
		{
			msg = "File Not Found...!";
		}

		dor.writeUTF(msg);
		ss.close();
		s.close();
		dor.close();
		dir.close();
	}
}


