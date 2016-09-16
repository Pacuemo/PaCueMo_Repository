package _50_rest_service_config;

import javax.ws.rs.ApplicationPath;

import org.glassfish.jersey.server.ResourceConfig;

@ApplicationPath("/RESTservices")
public class RESTService_config extends ResourceConfig
{
	public RESTService_config()
	{
		this.packages("_50_rest_service_config",
				"_59_task_routine",// _59_task_routine 下的 RoutineTask 
				"_52_nbateam_service");// _52_nbateam_service → getByTeamNameREST()
	}

}
