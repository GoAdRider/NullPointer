package np.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;

import np.com.util.CsvWriter;
import np.com.util.HashMapBinder;

public class TestController implements Action {
	Logger logger = Logger.getLogger(TestController.class);
public ModelAndView execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		
		ModelAndView mav = new ModelAndView(req, res);
		PrintWriter out = res.getWriter();
		String pageName = (String)req.getAttribute("pageName");
		TestDao testDao = TestDao.getInstance();
		
		Gson g = null;
	    Map<String,Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pmap);
		
		String forJson = null;	//json 을 위한 String
		
		logger.info("TestC map>>>>>>"+pmap);
		
		
		
		if(pageName.equals("testList")) {
			String filepath = "C:\\workspace_java\\finalproject_pojo\\webapp\\csvcollect";
			String title = "words";
			List<Map<String, Object>> list =testDao.getTest();
			logger.info("TestC -  testtList >>>> "+list);
			CsvWriter writer = new CsvWriter();
			writer.createCSV(list, title, filepath);
	        g = new Gson();
	        forJson = g.toJson(list);
		}

		
		if(g == null) {
			mav.setViewName(pageName+".jsp");
		}else {
			res.setContentType("application/json; charset=utf-8");
			out.print(forJson);
		}
		
		return mav;
	}
}
