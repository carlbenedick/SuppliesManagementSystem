package com.cpi.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cpi.entity.Supply;
import com.cpi.service.SuppliesMaintenanceService;

public class SuppliesServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3254083445269926470L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String page = "";
		String action = request.getParameter("action");
		ApplicationContext applicationContext;
		try {
			applicationContext = new ClassPathXmlApplicationContext("/com/cpi/resource/applicationContext.xml");

			SuppliesMaintenanceService suppliesMainServ = (SuppliesMaintenanceService) applicationContext
					.getBean("supMainService");

			// fetch data from supply_types_3 start
			List<Supply> supplyTypes = new ArrayList<>();
			request.setAttribute("getType", "getSupplyTypes");
			supplyTypes = suppliesMainServ.getSupply(request);
			for (Supply sup : supplyTypes) {
				System.out.println("supply type id: " + sup.getSupplyTypeID() + " type name: " + sup.getTypeName());
			}
			// end

			// end
			// add supplies page
			if (action.equals("goToAddNewSupplies")) {
				request.setAttribute("suppTypes", supplyTypes);
				page = "pages/new_supplies.jsp";
				// supplies maintenance page
			} else if (action.equals("suppliesMaintenance")) {
				// fetch data from supplies_3 start
				List<Supply> supplies = new ArrayList<>();
				request.setAttribute("getType", "getSupply");
				supplies = suppliesMainServ.getSupply(request);
				for (Supply supp : supplies) {
					System.out.println(" type name: " + supp.getTypeName() + " item name: " + supp.getItemName());
				}
				request.setAttribute("suppTypes", supplyTypes);
				request.setAttribute("supplies", supplies);
				page = "pages/supplies_maintenance.jsp";

				// add new supplies
			} else if (action.equals("addNewSupplies")) {
				System.out.println("adding supplies");
				int supplyTypeID = 0;
				for (Supply st : supplyTypes) {
					System.out.println("type_name: " + request.getParameter("supply_type_name"));
					if (st.getTypeName().equalsIgnoreCase(request.getParameter("supply_type_name"))) {
						supplyTypeID = st.getSupplyTypeID();
						System.out.println("supply type id: " + supplyTypeID);
						break;
					}
				}

				List<Supply> addSupply = new ArrayList<Supply>();

				/* request.setAttribute("lastUser", "hr"); */

				String location = request.getParameter("location");
				if (location.isEmpty() || location.equals("")) {
					location = null;
				} else {
					location = request.getParameter("location");
				}

				String reorder_level = request.getParameter("reorder_level");
				Integer reOrdlevel = null;
				if (reorder_level.isEmpty() || reorder_level.equals("")) {
					reOrdlevel = null;
				} else {
					reOrdlevel = Integer.valueOf(request.getParameter("reorder_level"));
				}

				String remarks = request.getParameter("remarks");
				if (remarks.isEmpty() || remarks.equals("")) {
					remarks = null;
				} else {
					remarks = request.getParameter("remarks");
				}

				addSupply.add(new Supply(supplyTypeID, request.getParameter("item_name"),
						request.getParameter("item_unit"), request.getParameter("obsolete_tag"), location, reOrdlevel,
						Integer.valueOf(request.getParameter("actual_count")), remarks,
						request.getParameter("entered_dt"), "hr"));

				request.setAttribute("addSupply", addSupply);
				suppliesMainServ.insertSupply(request);
			} else if (action.equals("updateSupply")) {

				//check if 
				
				List<Supply> updateSupply = new ArrayList<Supply>();

				// request.setAttribute("lastUser", "hr"); 

				String location = request.getParameter("location");
				if (location.isEmpty() || location.equals("")) {
					location = null;
				} else {
					location = request.getParameter("location");
				}

				System.out.println("location " + location);

				String reorder_level = request.getParameter("reorder_level");
				Integer reOrdlevel = null;
				if (reorder_level.isEmpty() || reorder_level.equals("")) {
					reOrdlevel = null;
				} else {
					reOrdlevel = Integer.valueOf(request.getParameter("reorder_level"));
				}

				String remarks = request.getParameter("remarks");
				if (remarks.isEmpty() || remarks.equals("")) {
					remarks = null;
				} else {
					remarks = request.getParameter("remarks");
				}

				System.out.println("remarks "+remarks);
				
				updateSupply.add(new Supply(Integer.valueOf(request.getParameter("supply_ID")),
						request.getParameter("item_name"), request.getParameter("item_unit"),
						request.getParameter("obsolete_tag"), location, reOrdlevel, remarks, "hr"));
				request.setAttribute("updateSupply", updateSupply);
				suppliesMainServ.updateSupply(request);
				
				List<Supply> supplies = new ArrayList<>();
				request.setAttribute("getType", "getSupply");
				supplies = suppliesMainServ.getSupply(request);
				for (Supply supp : supplies) {
					System.out.println(" type name: " + supp.getTypeName() + " item name: " + supp.getItemName());
				}
				request.setAttribute("supplies", supplies);
				
				page = "pages/suppliesTable.jsp";

			} else if (action.equals("searchSupply")) {
				List<Supply> searchSupplies = new ArrayList<Supply>();

				request.setAttribute("supplyID", request.getParameter("supplyID"));
				request.setAttribute("getType", "getSearchSupply");
				searchSupplies = suppliesMainServ.searchSupply(request);

				for (Supply sup : searchSupplies) {
					System.out.println("supply Id: " + sup.getSupplyID());
				}

				request.setAttribute("suppTypes", supplyTypes);
				request.setAttribute("supplies", searchSupplies);
				
				page = "pages/suppliesTable.jsp";
			}else if(action.equals("home")) {
				page = "index.jsp";
			}else if(action.equals("hasChild")) {
				request.setAttribute("supplyID", request.getParameter("supplyID"));
				request.setAttribute("getType", "getSupplyChild");
				Integer result = suppliesMainServ.getResultFunctionHasChild(request);
				
				System.out.println(result);
			}
		} catch (Exception e) {
			System.out.println("servlet: " + e.toString());

		} finally {
			RequestDispatcher dispatch = request.getRequestDispatcher(page);
			dispatch.forward(request, response);
		}

	}

}
