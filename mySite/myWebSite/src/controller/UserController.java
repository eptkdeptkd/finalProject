package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dto.MemberDto;
import oracle.net.aso.i;

@WebServlet("/logjoin")
public class UserController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String work = req.getParameter("work");
		if(work.equals("first")) {
			resp.sendRedirect("login.jsp");
		}else if(work.equals("movejoin")) {
			resp.sendRedirect("join.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String work = req.getParameter("work");
		
		if(work.equals("join")) {
			String id = req.getParameter("id");
			String nickname = req.getParameter("nickname");
			String password = req.getParameter("pwd");
			String birthday = req.getParameter("birthday");
			
			String address = "";
			String postcode = req.getParameter("postcode");
			String roadaddr = req.getParameter("roadaddr");
			String jibunaddr = req.getParameter("jibunaddr");
			String detailaddr = req.getParameter("detailaddr");
			address = postcode + ", "+ roadaddr+", "+jibunaddr+", "+detailaddr;
			
			String pnumber = req.getParameter("pnumber");
			String email = req.getParameter("email");
			String[] c = req.getParameterValues("snssend");
			int cemail = 0;
			int cpnumber =0;
			if(c.length>0 || c!=null) {
				for(int i=0; i<c.length;i++) {
					if(c[i].equals("1")) {
						cemail=1;
					}else if(c[i].equals("2")) {
						cpnumber=1;
					}
				}
			}
			MemberDto dto = new MemberDto(id,nickname,password,birthday,address,pnumber,email,cemail,cpnumber,3);
			System.out.println("controller "+dto.toString());
			
			MemberDao dao = MemberDao.getInstance();
			dao.addMember(dto);
			
			resp.sendRedirect("login.jsp");
		}else if(work.equals("login")) {
			String id = req.getParameter("id");
			HttpSession session = req.getSession(false);
			if(session ==null) {
				session = req.getSession(true);
				session.setMaxInactiveInterval(30); // 365*24*60*60
			}
			session.setAttribute("loginId", id);

			resp.sendRedirect("blog.jsp?");
		}
				
	}
	
}
