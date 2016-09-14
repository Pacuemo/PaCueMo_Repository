package _59_task_routine;

import javax.ws.rs.GET;
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
}
