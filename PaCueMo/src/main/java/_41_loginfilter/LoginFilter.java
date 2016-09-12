package _41_loginfilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _9_41_member_model.MemberVO;

@WebFilter(urlPatterns = { "/*" }, initParams = {

				@WebInitParam(name = "mustLogin1", value = "/spring/club/login"),
				@WebInitParam(name = "mustLogin2", value = "/TeamServlet"),
				@WebInitParam(name = "mustLogin3", value = "/_03_member/*"),
				@WebInitParam(name = "mustLogin4", value = "/spring/club/apply"),
				@WebInitParam(name = "mustLogin5", value = "/_5_gambling/*"),
				@WebInitParam(name = "mustLogin6", value = "/spring/team/createTeamPage"),
				@WebInitParam(name = "mustLogin6", value = "/spring/battle_rec/introduce")
})
public class LoginFilter implements Filter
{
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;
	String queryString;

	public void init(FilterConfig fConfig) throws ServletException
	{
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements())
		{
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException
	{

		boolean isRequestedSessionIdValid = false;
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse)
		{
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();
			contextPath = req.getContextPath();
			requestURI = req.getRequestURI();
			queryString = req.getQueryString();
			isRequestedSessionIdValid = req.isRequestedSessionIdValid();

			if (mustLogin())
			{
				if (checkLogin(req))
				{   //  需要登入，已經登入
					chain.doFilter(request, response);
				}
				else
				{				//  需要登入，尚未登入
					HttpSession session = req.getSession();
					session.setAttribute("requestURI", requestURI);
					session.setAttribute("queryString", queryString);
					if (!isRequestedSessionIdValid)
					{
						session.setAttribute("timeOut", "使用逾時，請重新登入");
					}
					resp.sendRedirect(contextPath + "/_01_login/login.jsp");
					return;
				}
			}
			else
			{   //不需要登入
				chain.doFilter(request, response);
			}
		}
		else
		{
			throw new ServletException("Request / Response 型態錯誤");
		}
	}

	private boolean checkLogin(HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MemberVO loginToken = (MemberVO) session.getAttribute("LoginOK");
		if (loginToken == null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	private boolean mustLogin()
	{
		boolean login = false;
		for (String sURL : url)
		{
			if (sURL.endsWith("*"))
			{
				sURL = sURL.substring(0, sURL.length() - 1);
				if (servletPath.startsWith(sURL))
				{
					login = true;
					break;
				}
			}
			else
			{
				String requestURIs = contextPath + sURL;
				if (requestURI.equals(requestURIs))
				{
					login = true;
					break;
				}
			}
		}
		return login;
	}

	@Override
	public void destroy()
	{
	}
}
