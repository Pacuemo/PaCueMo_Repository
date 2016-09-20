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

@WebFilter(filterName = "auth", initParams = {

				@WebInitParam(name = "mustAuth1", value = "/_99_backstage/pages/index.jsp"),
})
public class AuthFilter implements Filter
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

			if (mustAuth())
			{
				if (checkAuth(req))
				{   //  需要權限，已有權限
					chain.doFilter(request, response);
				}
				else
				{				//  需要權限，沒有權限
					HttpSession session = req.getSession();
					session.setAttribute("requestURI", requestURI);
					session.setAttribute("queryString", queryString);
					if (!isRequestedSessionIdValid)
					{
						session.setAttribute("timeOut", "使用逾時，請重新登入");
					}
					resp.sendRedirect(contextPath);
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

	private boolean checkAuth(HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MemberVO loginToken = (MemberVO) session.getAttribute("LoginOK");
		if (loginToken.getMemberType() == 1)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	private boolean mustAuth()
	{
		boolean Auth = false;
		for (String sURL : url)
		{
			if (sURL.endsWith("*"))
			{
				sURL = sURL.substring(0, sURL.length() - 1);
				if (servletPath.startsWith(sURL))
				{
					Auth = true;
					break;
				}
			}
			else
			{
				String requestURIs = contextPath + sURL;
				if (requestURI.equals(requestURIs))
				{
					Auth = true;
					break;
				}
			}
		}
		return Auth;
	}

	@Override
	public void destroy()
	{
	}
}
