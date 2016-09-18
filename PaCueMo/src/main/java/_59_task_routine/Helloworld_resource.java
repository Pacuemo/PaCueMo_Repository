package _59_task_routine;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Path("/helloworld")
public class Helloworld_resource
{
	@GET
	@Produces("text/plain")
	public String getMessage()//localhost:8080/PaCueMo/services/helloworld 呼叫
	{
		return "Fuck you!!!";
	}

	@GET
	@Produces("text/plain;charset=UTF-8")
	@Path("{qStr}")
	public String getMessage(@PathParam("qStr") String str)//localhost:8080/PaCueMo/services/helloworld 呼叫
	{
		return "Fuck you!!!" + str;
	}

	@POST
	@Produces("text/plain;charset=UTF-8")
	@Path("ass")
	public String testRESTForm(@FormParam("age") Integer parm1, @FormParam("speed") String parm2, @FormParam("height") String parm3)
	{
		System.out.println("call ass : " + ++parm1 + " - " + parm2 + " - " + parm3);
		return "";
	}
}
