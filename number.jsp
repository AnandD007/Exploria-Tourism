<html>
<body>

	<% int n = Integer.parseInt(request.getParameter("n1"));
	   int t = n, sum = 0, rem = 0;

	   out.println("The number is : "+n+" number");
	   out.println("n words:");

	   while(t>0)
	   {
	   	sum = sum*10+t%10;
	   	t =t/10;
	   }
	   while(sum>0)
	   {
	   	rem = sum%10;
	   	sum = sum/10;
	   	switch(rem)
	   	{
	   	
	   	case 0: out.println("<br><h4>Zero</h4>");
	   		break;
		case 1: out.println("<br><h4>One</h4>");
			   		break;
		case 2: out.println("<br><h4>Two</h4>");
			   		break;
		case 3: out.println("<br><h4>Three</h4>");
			   		break;
		case 4: out.println("<br><h4>Four</h4>");
			   		break;
		case 5: out.println("<br><h4>Five</h4>");
			   		break;
		case 6: out.println("<br><h4>Six</h4>");
			   		break;
		case 7: out.println("<br><h4>Seven</h4>");
			   		break;
		case 8: out.println("<br><h4>Eight</h4>");
			   		break;
		case 9: out.println("<br><h4>Nine</h4>");
			   		break;
		}
	} %>
</body>
</html>

