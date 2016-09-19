package _43_member_controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import _43_member_service.MemberService_Spring;
import _9_41_member_model.MemberVO;

@WebServlet(urlPatterns = { "/_03_member/upload.do" })
@MultipartConfig
public class UpdateImgServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	@Autowired
	MemberService_Spring ms;

	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
				config.getServletContext());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String servletPath = request.getServletPath();
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("LoginOK");
		Collection<Part> parts = request.getParts();

		if (memberVO != null && parts != null)
		{
			for (Part part : parts)
			{
				String contentType = part.getContentType();
				if (contentType != null)
				{
					String saveName = memberVO.getMemberId() + "." + contentType.split("/")[1];
					long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
					String relativeWebPath = "/image/member";
					String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
					InputStream is = part.getInputStream();
					BufferedOutputStream fos = new BufferedOutputStream(new FileOutputStream(new File(absoluteDiskPath + "/" + saveName)));
					byte[] b = new byte[(int) size];
					is.read(b);
					fos.write(b);
					fos.close();
					is.close();
					MemberVO temp = new MemberVO();
					temp.setMemberId(memberVO.getMemberId());
					temp.setMemberImgUrl(saveName);

					if (ms.updateImg(temp) == 1)
					{
						memberVO.setMemberImgUrl(saveName);
					}
				}
			}
		}
	}

}
