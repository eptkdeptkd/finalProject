package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListDao;
import dto.MenuDto;
import net.sf.json.JSONObject;

@WebServlet("/menucontroll")
public class UserMenuController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String work = req.getParameter("work");
		String id = (req.getParameter("id")==null)?"":req.getParameter("id");
		JSONObject obj = new JSONObject();
		
		if(work.equals("addMenu")) {
			resp.sendRedirect("./menu/addMenu.jsp?id="+id);
		}else if(work.equals("getMenuList")) {
			ListDao dao = ListDao.getInstance();
			List<MenuDto> mlist = dao.getMenuList(id);
			String str = getMenuListStr(mlist);
			int len = mlist.size();
			
			obj.put("mlist",str);
			obj.put("len", len);
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}else if(work.equals("addone")) {
			String mname = req.getParameter("mname");
			//System.out.println("dao = " +mname);
			ListDao dao = ListDao.getInstance();
			boolean b = dao.addMenuOne(id, mname);
			
			if(b) obj.put("conf","ok");
			else obj.put("conf","no");
			
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}else if(work.equals("moverow")) {
			int index = Integer.parseInt(req.getParameter("index"));
			int count = Integer.parseInt(req.getParameter("count"));
			int seq = Integer.parseInt(req.getParameter("seq"));
			System.out.println("controll " + index +" "+count+" seq= "+seq);
			
			ListDao dao = ListDao.getInstance();
			boolean b = dao.chgOrdernum(index, count, id,seq);
			if(b) obj.put("conf","ok");
			else obj.put("conf","no");
			
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}else if(work.equals("delone")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			ListDao dao = ListDao.getInstance();
			boolean b = dao.delMenu(seq);
			
			if(b) obj.put("conf","ok");
			else obj.put("conf","no");
			
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	public String getMenuListStr(List<MenuDto> mlist) {
		String str = "";
		
		for(int i=0; i<mlist.size(); i++) {
			str+="<tr id='tr"+(i+1)+"'><td><input type='text' size='1' name='ordernum' id="+(i+1)+" style='border:none; background-color:skyblue; text-align:center;' value=" + mlist.get(i).getOrdernum()+" onclick='setRowId(this)' reaonly>";
			str += "</td><td><input type='text' style='border:none; color:grey; font-size:11pt;' id='mname' name='mname' value="+mlist.get(i).getName()+" readonly ></td>"
					+ "<td><input type='hidden' id='mseq"+(i+1)+"' value="+mlist.get(i).getSeq()+"></td></tr>";
		}
	
		//System.out.println("menu = "+str);
		return str;
	}
}
