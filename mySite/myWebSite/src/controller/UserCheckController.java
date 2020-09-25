package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import net.sf.json.JSONObject;

@WebServlet("/checkcont")
public class UserCheckController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONObject obj = new JSONObject();
		
		String work = req.getParameter("work");
		String id ="", pwd ="";
		boolean b = false;
		
		if(work.equals("idchk")) {
			id = req.getParameter("id");
			MemberDao dao = MemberDao.getInstance();
			b = dao.checkId(id);
			
			obj.put("b",b);
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}else if(work.equals("pnumchk")) {
			String pnumber = req.getParameter("pnumber");
			MemberDao dao = MemberDao.getInstance();
			b= dao.checkPnumber(pnumber);
			
			obj.put("b",b);
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}else if(work.equals("emailchk")) {
			String email = req.getParameter("email");
			MemberDao dao = MemberDao.getInstance();
			b= dao.checkPemail(email);
			
			obj.put("b",b);
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
			
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JSONObject obj = new JSONObject();
		String work = req.getParameter("work");
		String id= "", pwd="";
		boolean b = false;
		if(work.equals("isLogPos")) {
			id= req.getParameter("id");
			pwd = req.getParameter("pwd");
			
			b = MemberDao.getInstance().isLoginPos(id, pwd);
			
			obj.put("b",b);
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}
	}

}
