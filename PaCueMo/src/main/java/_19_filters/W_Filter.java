package _19_filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class TeamFilter
 */
@WebFilter("/W_Filter")
public class W_Filter implements Filter
{

	public W_Filter()
	{
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException
	{
		try
		{

			chain.doFilter(request, response);

		}
		catch (Exception e)
		{

		}
	}

	public void init(FilterConfig fConfig) throws ServletException
	{
	}

	@Override
	public void destroy()
	{
		// TODO Auto-generated method stub

	}

}
